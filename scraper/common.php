<?php
/**
 * Common helpers for all scrapers
 */

/**
 * Fetch HTML using cURL with nice headers
 */
if (!function_exists('fetch_html')) {
    function fetch_html(string $url, int $timeout = 20): string
    {
        $ch = curl_init($url);

        $headers = [
            'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
            'Accept-Language: vi-VN,vi;q=0.9,en-US;q=0.8,en;q=0.7',
            'Cache-Control: no-cache',
            'Pragma: no-cache',
        ];

        curl_setopt_array($ch, [
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_MAXREDIRS      => 5,
            CURLOPT_TIMEOUT        => $timeout,
            CURLOPT_ENCODING       => 'gzip,deflate',
            CURLOPT_HTTPHEADER     => $headers,
            CURLOPT_USERAGENT      => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) ' .
                                      'AppleWebKit/537.36 (KHTML, like Gecko) ' .
                                      'Chrome/120.0 Safari/537.36',
            CURLOPT_SSL_VERIFYPEER => false,
            CURLOPT_SSL_VERIFYHOST => false,
        ]);

        $html = curl_exec($ch);
        if ($html === false) {
            $err = curl_error($ch);
            curl_close($ch);
            throw new Exception("cURL error: $err");
        }

        $status = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        if ($status >= 400) {
            throw new Exception("HTTP error: $status when fetching $url");
        }

        return $html;
    }
}

/**
 * Convert price string like "1.590.000đ" or "1,590,000 VND" → integer
 */
if (!function_exists('to_int_price')) {
    function to_int_price(?string $text): ?int
    {
        if ($text === null) return null;
        $num = preg_replace('/[^0-9]/', '', $text);
        if ($num === '' || $num === null) return null;
        return (int)$num;
    }
}

/**
 * Build absolute URL from base + relative
 */
if (!function_exists('absolute_url')) {
    function absolute_url(string $base, string $relative): string
    {
        // Nếu đã là absolute
        if (preg_match('!^https?://!i', $relative)) {
            return $relative;
        }

        // Nếu relative bắt đầu bằng "/"
        $parts = parse_url($base);
        $scheme = $parts['scheme'] ?? 'https';
        $host   = $parts['host']   ?? '';
        $port   = isset($parts['port']) ? ':' . $parts['port'] : '';

        if (strpos($relative, '/') === 0) {
            return "$scheme://$host$port$relative";
        }

        // Lấy path
        $path = $parts['path'] ?? '/';
        $path = preg_replace('~/[^/]*$~', '/', $path);

        return "$scheme://$host$port$path$relative";
    }
}
