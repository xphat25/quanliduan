<?php
header('Content-Type: application/json; charset=utf-8');
require_once "db.php";

// Scrapers
require_once __DIR__ . '/../scraper/sieuthiyte_scraper.php';
require_once __DIR__ . '/../scraper/phana_scraper.php';

// ====================================================================
// 1. Nhận URL
// ====================================================================
if (!isset($_GET['url']) || empty($_GET['url'])) {
    echo json_encode(["error" => "Missing URL"]);
    exit;
}

$url = trim($_GET['url']);
$domain = parse_url($url, PHP_URL_HOST);

// ====================================================================
// 2. Chọn scraper theo domain
// ====================================================================
$data = null;
$platform_code = "other";

try {

    if (strpos($domain, "sieuthiyte") !== false) {
        $data = scrape_sieuthiyte_list($url);
        $platform_code = "sieuthiyte";
    }

    elseif (strpos($domain, "phana.com.vn") !== false) {
        $data = scrape_phana_list($url);
        $platform_code = "phana";
    }

    else {
        echo json_encode([
            "error" => "Website not supported",
            "supported" => [
                "sieuthiyte.com.vn",
                "phana.com.vn"
            ]
        ]);
        exit;
    }

} catch (Exception $e) {
    echo json_encode(["error" => $e->getMessage()]);
    exit;
}


// ====================================================================
// 3. Lấy hoặc tạo platform trong DB
// ====================================================================
$stmt = $conn->prepare("SELECT id FROM platforms WHERE code = ?");
$stmt->bind_param("s", $platform_code);
$stmt->execute();
$stmt->store_result();

if ($stmt->num_rows > 0) {
    $stmt->bind_result($platform_id);
    $stmt->fetch();
} else {
    $ins = $conn->prepare("INSERT INTO platforms (code, name) VALUES (?, ?)");
    $ins->bind_param("ss", $platform_code, $domain);
    $ins->execute();
    $platform_id = $ins->insert_id;
}

$stmt->close();


// ====================================================================
// 4. Chuẩn hóa key
// ====================================================================
function normalize_key($str) {
    return preg_replace('/[^a-z0-9]+/', '-', strtolower($str));
}


// ====================================================================
// 5. SQL insert/update
// ====================================================================
$sql = "
INSERT INTO products
(platform_id, title, normalized_key, product_url, image_url, shop_name,
 price_current, price_original, sold_quantity, rating_avg, rating_count,
 last_scraped_at)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())
ON DUPLICATE KEY UPDATE
 price_current = VALUES(price_current),
 price_original = VALUES(price_original),
 sold_quantity = VALUES(sold_quantity),
 rating_avg = VALUES(rating_avg),
 rating_count = VALUES(rating_count),
 updated_at = NOW(),
 last_scraped_at = NOW()
";

$stmt_product = $conn->prepare($sql);


// ====================================================================
// 6. Lưu dữ liệu vào DB
// ====================================================================
foreach ($data as $item) {

    $title  = $item['title'] ?? '';
    $norm   = normalize_key($title);
    $url2   = $item['link'] ?? '';
    $img    = $item['image'] ?? '';
    $shop   = null;

    $p_new  = $item['price_new'] ?? null;
    $p_old  = $item['price_old'] ?? null;
    $sold   = $item['sold'] ?? null;
    $rate   = $item['rating'] ?? null;
    $count  = $item['rating_count'] ?? null;

    $stmt_product->bind_param(
        "isssssiiiii",
        $platform_id,
        $title,
        $norm,
        $url2,
        $img,
        $shop,
        $p_new,
        $p_old,
        $sold,
        $rate,
        $count
    );

    $stmt_product->execute();
}


// ====================================================================
// 7. Trả dữ liệu lại cho frontend
// ====================================================================
echo json_encode($data, JSON_UNESCAPED_UNICODE);

?>
