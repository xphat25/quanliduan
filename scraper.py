# file: scraper.py

# scraper.py - Scraper sử dụng Selenium và Regex để lấy danh sách sản phẩm
import sys
import io
import json
import re 
import logging
from urllib.parse import urlparse, urljoin
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from selenium.common.exceptions import WebDriverException
from webdriver_manager.chrome import ChromeDriverManager
from scraper_beauti import extract_images_and_titles

# --- CẤU HÌNH ---
REQUEST_TIMEOUT = 30
WAIT_TIME = 10

# --- XỬ LÝ ENCODING CHO WINDOWS ---
# Ép buộc stdout/stderr dùng UTF-8 để không bị lỗi 'charmap' khi in tiếng Việt
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')
sys.stderr = io.TextIOWrapper(sys.stderr.buffer, encoding='utf-8')

def get_driver():
    """Khởi tạo Chrome WebDriver."""
    chrome_options = Options()
    chrome_options.add_argument('--headless')
    chrome_options.add_argument('--no-sandbox')
    chrome_options.add_argument('--disable-dev-shm-usage')
    chrome_options.add_argument('user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36')
    # Tắt bớt log rác của Selenium
    chrome_options.add_experimental_option("excludeSwitches", ["enable-logging"])
    
    try:
        service = Service(ChromeDriverManager().install())
        driver = webdriver.Chrome(service=service, options=chrome_options)
        driver.set_page_load_timeout(REQUEST_TIMEOUT)
        return driver
    except WebDriverException as e:
        # Trả về lỗi dưới dạng JSON để PHP bắt được
        print(json.dumps({"error": f"Driver Error: {str(e)}"}))
        sys.exit(1)

def clean_price(text):
    """Chuyển đổi chuỗi giá (ví dụ: '100.000đ') thành số nguyên."""
    if not text:
        return None
    cleaned = re.sub(r"[^\d]", "", text)
    try:
        return int(cleaned) if cleaned else None
    except ValueError:
        return None

def scrape_page(url):
    """
    Hàm scraping chính: Sử dụng Selenium + Regex (chính) và gọi scrape_beauti 
    để lấy hình ảnh và link chuẩn xác. 
    """
    logging.info(f"=" * 70)
    logging.info(f"Starting Hybrid Scrape (Regex for Price + BS for Image/Link): {url}")
    logging.info(f"=" * 70)
    
    driver = None
    results = []
    
    try:
        driver = get_driver()
        driver.get(url)
        
        # Chờ phần tử body tải xong
        WebDriverWait(driver, WAIT_TIME).until(
            EC.presence_of_element_located((By.TAG_NAME, "body"))
        )
        
        # Lấy toàn bộ HTML đã được kết xuất
        page_source = driver.page_source 
        
        # Lấy nội dung văn bản thô cho Regex
        body_text = driver.find_element(By.TAG_NAME, "body").text

        # 1. CHẠY LOGIC REGEX CŨ (Để lấy Title và Price)
        pattern = r"(Combo.*?)\s+([\d\.]+đ)\s+([\d\.]+đ)"
        matches = re.findall(pattern, body_text, re.MULTILINE)
        
        if not matches:
             # Fallback pattern
             pattern = r"(Combo.*?)\s+([\d]{3,}(?:\.[\d]{3})*đ)\s+([\d]{3,}(?:\.[\d]{3})*đ)"
             matches = re.findall(pattern, body_text, re.MULTILINE)

        logging.info(f"Tìm thấy {len(matches)} combo khuyến mãi bằng Regex.")

        # 2. GỌI BEAUTIFUL SOUP TỪ FILE KHÁC ĐỂ LẤY HÌNH ẢNH VÀ LINK CHUẨN
        # image_link_map sẽ là: {title_key: {'image': image_url, 'link': product_link}, ...}
        image_link_map = extract_images_and_titles(page_source, url)

        # 3. KẾT HỢP VÀ XỬ LÝ DỮ LIỆU TỪ REGEX
        if matches:
            for match in matches:
                title, price_old_str, price_new_str = match
                title_stripped = title.strip()
                
                # --- XỬ LÝ GIÁ VÀ DISCOUNT ---
                price_old = clean_price(price_old_str)
                price_new = clean_price(price_new_str)
                
                # Tính toán discount
                discount = None
                if price_old and price_new and price_old > price_new:
                     try:
                        percentage = round((price_old - price_new) / price_old * 100)
                        discount = f"-{percentage}%"
                     except (ZeroDivisionError, TypeError):
                        discount = None
                
                # --- LẤY HÌNH ẢNH VÀ LINK GỐC (ĐÃ FIX) ---
                matched_image = None
                matched_link = url 
                
                # Duyệt qua map để tìm đối chiếu
                for image_title_key, item_data in image_link_map.items():
                    # Kiểm tra xem tiêu đề Regex có là một phần của tiêu đề ALT không (hoặc ngược lại)
                    if title_stripped in image_title_key or image_title_key in title_stripped:
                        matched_image = item_data.get('image')
                        # Gán link chuẩn 100% (Link thực tế trích xuất từ BS)
                        if item_data.get('link'):
                            matched_link = item_data.get('link') 
                        break 

                # Thêm sản phẩm đã có đủ thông tin
                results.append({
                    "title": title_stripped,
                    "price_old": price_old,
                    "price_new": price_new,
                    "discount": discount,
                    "image": matched_image, 
                    "link": matched_link, 
                })
        
        # 4. CƠ CHẾ FALLBACK (DỰ PHÒNG) QUAN TRỌNG
        # Nếu Regex trả về rỗng, ta lấy dữ liệu từ Image/Link Map
        if len(results) == 0 and len(image_link_map) > 0:
            logging.warning("Regex không tìm thấy giá. Kích hoạt chế độ Fallback: Chỉ lấy Ảnh + Tiêu đề + Link.")
            
            for title_key, item_data in image_link_map.items():
                if len(title_key) < 3 and not title_key.startswith("http"): continue 

                results.append({
                    "title": title_key,
                    "price_old": None,      
                    "price_new": None,      
                    "discount": None,
                    "image": item_data.get('image'),
                    "link": item_data.get('link') if item_data.get('link') else url 
                })

        logging.info(f"Đã xử lý tổng cộng {len(results)} sản phẩm.")
        return results
        
    except Exception as e:
        logging.error(f"Lỗi trong quá trình scraping: {e}")
        import traceback
        logging.error(traceback.format_exc())
        # Bắt lỗi Python và trả về JSON Error
        print(json.dumps({"error": f"Scraper Exception: {str(e)}"}))
        sys.exit(1)
        
    finally:
        if driver:
            driver.quit()

# --- MAIN EXECUTION BLOCK ---
if __name__ == "__main__":
    input_url = sys.argv[1] if len(sys.argv) > 1 else ""

    if not input_url:
        print(json.dumps({"error": "No URL provided"}))
    else:
        try:
            data = scrape_page(input_url)
            print(json.dumps(data, ensure_ascii=False))
            
        except Exception as e:
            # Nếu có lỗi xảy ra, in lỗi dạng JSON
            print(json.dumps({"error": str(e)}))