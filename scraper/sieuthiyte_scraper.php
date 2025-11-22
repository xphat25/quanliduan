<?php

require_once __DIR__ . "/common.php"; // fetch_html + to_int_price

function scrape_sieuthiyte_list($url) {

    $html = fetch_html($url);

    $dom = new DOMDocument();
    @$dom->loadHTML('<meta charset="utf-8">' . $html);
    $xpath = new DOMXPath($dom);

    $products = [];

    // đúng selector cho từng item
    $items = $xpath->query('//div[contains(@class,"item-slide")]');

    foreach ($items as $item) {

        // LINK
        $aNode = $xpath->query('.//a', $item)->item(0);
        $link = $aNode ? $aNode->getAttribute('href') : "";
        if ($link && strpos($link, "http") !== 0) {
            $link = "https://sieuthiyte.com.vn" . $link;
        }

        // TITLE
        $titleNode = $xpath->query('.//h3[contains(@class,"title")]', $item)->item(0);
        $title = $titleNode ? trim($titleNode->textContent) : "";

        // IMAGE (fix lazy load)
        $imgNode = $xpath->query('.//img', $item)->item(0);
        $image = "";

        if ($imgNode) {
            $image = 
                $imgNode->getAttribute("data-src") ? $imgNode->getAttribute("data-src") :
                ($imgNode->getAttribute("data-original") ? $imgNode->getAttribute("data-original") :
                $imgNode->getAttribute("src"));

            if ($image && strpos($image, "http") !== 0) {
                $image = "https://sieuthiyte.com.vn" . $image;
            }
        }

        // PRICE NEW
        $priceNode = $xpath->query('.//p[@class="price"]/span', $item)->item(0);
        $price_new = to_int_price($priceNode ? $priceNode->textContent : "");

        // PRICE OLD
        $oldNode = $xpath->query('.//p[@class="price-old"]/span', $item)->item(0);
        $price_old = to_int_price($oldNode ? $oldNode->textContent : "");

        // DISCOUNT
        $discountNode = $xpath->query('.//span[contains(@class,"sale")]', $item)->item(0);
        $discount = $discountNode ? trim($discountNode->textContent) : "";

        if ($title) {
            $products[] = [
                "title"      => $title,
                "price_new"  => $price_new,
                "price_old"  => $price_old ?: null,
                "discount"   => $discount,
                "image"      => $image,
                "link"       => $link
            ];
        }
    }

    return $products;
}

?>
