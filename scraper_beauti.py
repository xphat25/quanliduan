# file: scraper_beauti.py

from bs4 import BeautifulSoup
from urllib.parse import urlparse, urljoin
import logging

# Thiết lập Selector CSS dựa trên cấu trúc HTML đã cung cấp
PRODUCT_CONTAINER_SELECTOR = "a[href]" # Đã fix: Container chính là thẻ <a> bao quanh sản phẩm
IMAGE_SELECTOR = "img" 

def extract_images_and_titles(html_content, base_url):
    """
    Sử dụng Beautiful Soup để phân tích HTML (tĩnh) được cung cấp, trích xuất link hình ảnh và 
    Link sản phẩm thực tế, sử dụng thuộc tính ALT làm key đối chiếu (image_link_map).
    """
    image_link_map = {}
    
    try:
        soup = BeautifulSoup(html_content, 'html.parser')
        
        # 1. Tìm các container sản phẩm (là thẻ <a> có href)
        product_containers = soup.select(PRODUCT_CONTAINER_SELECTOR)

        for container in product_containers:
            title_key = None
            image_url = None
            
            # Link sản phẩm được lấy trực tiếp từ container (thẻ <a>)
            product_link = urljoin(base_url, container.get('href'))
            
            # 2. Trích xuất Ảnh và Key đối chiếu (ALT)
            image_tag = container.select_one(IMAGE_SELECTOR)
            if image_tag:
                title_key = image_tag.get('alt', '').strip()
                
                # Ưu tiên data-original -> data-src -> src
                temp_image_url = (
                    image_tag.get('data-original') 
                    or image_tag.get('data-src') 
                    or image_tag.get('src')
                )
                
                # Sửa lỗi lấy 1 ảnh: Kiểm tra nếu link ảnh không phải là None HOẶC chuỗi rỗng
                if temp_image_url and temp_image_url.strip():
                    # Đảm bảo URL tuyệt đối
                    image_url = urljoin(base_url, temp_image_url) 
                
                # Thử lấy tiêu đề từ thẻ <h3> (h3.title) nếu alt rỗng
                if not title_key:
                    title_tag = container.select_one("h3.title") 
                    if title_tag:
                         title_key = title_tag.text.strip()

            # 3. Lưu vào map
            # Ưu tiên sử dụng title làm key
            if title_key and product_link: 
                image_link_map[title_key] = {
                    'image': image_url,
                    'link': product_link
                }
            # Fallback: Nếu không có tiêu đề nhưng có link (dùng link làm key đối chiếu tạm thời)
            elif product_link:
                # Sử dụng link làm key nếu không có title_key để tránh mất dữ liệu ảnh/link
                image_link_map[product_link] = { 
                    'image': image_url,
                    'link': product_link
                }
                
    except Exception as e:
        logging.error(f"Error during Beautiful Soup parsing: {e}")

    logging.info(f"Beautiful Soup analysis finished. Found {len(image_link_map)} image/link sets.")
    return image_link_map