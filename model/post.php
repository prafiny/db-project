<?php
namespace Model\Post;

/**
 * Get the list of used hashtags in message
 * @param text the message
 * @return an array of hashtags
 */
function extract_hashtags($text) {
    return array_map(
        function($el) { return substr($el, 1); },
        array_filter(
            explode(" ", $text),
            function($c) {
                return $c !== "" && $c[0] == "#";
            }
        )
    );
}

/**
 * Get the list of mentioned users in message
 * @param text the message
 * @return an array of usernames
 */
function extract_mentions($text) {
    return array_map(
        function($el) { return substr($el, 1); },
        array_filter(
            explode(" ", $text),
            function($c) {
                return $c !== "" && $c[0] == "@";
            }
        )
    );
}

