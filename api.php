<?php
// file: api.php
// Lưu ý: Không để bất kỳ ký tự nào trước thẻ <?php ở dòng 1

header('Content-Type: application/json; charset=utf-8');

$url = isset($_GET['url']) ? $_GET['url'] : '';

if (empty($url)) {
    echo json_encode(["error" => "Lỗi: Vui lòng cung cấp URL."]);
    exit;
}

putenv("PYTHONIOENCODING=utf-8");

// Thêm cờ 2>&1 vào biến lệnh nếu bạn muốn DEBUG lỗi Python (kết quả lỗi sẽ hiện trong JSON response)
// Nhưng để chạy sản phẩm (Production), ta chỉ cần output chuẩn.
$command = "python3 scraper.py " . escapeshellarg($url);

$output = shell_exec($command);

if ($output === null) {
    echo json_encode(["error" => "Lỗi Server: Không thể gọi lệnh Python."]);
} else {
    // Lọc bỏ các dòng trống hoặc log thừa nếu vẫn còn sót
    $output = trim($output);
    
    // Kiểm tra xem output có phải là JSON không trước khi trả về
    json_decode($output);
    if (json_last_error() !== JSON_ERROR_NONE) {
        // Nếu output không phải JSON thuần (do dính log), trả về lỗi để dễ debug
        echo json_encode([
            "error" => "Invalid JSON Output from Python",
            "raw_output" => $output
        ]);
    } else {
        echo $output;
    }
}
?>