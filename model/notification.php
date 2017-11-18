<?php
namespace Model\Notification;
use \Db;
use \PDOException;
/**
 * Notification model
 *
 * This file contains every db action regarding the notifications
 */

/**
 * Get all the notifications sorted by time (descending order)
 * @param uid the user id
 * @return a sorted list of every notifications objects
 */
function list_all_notifications($uid) {
    $ary = array_merge(get_liked_notifications($uid), get_followed_notifications($uid), get_mentioned_notifications($uid));
    usort(
        $ary,
        function($a, $b) {
            return $b->date->format('U') - $a->date->format('U');
        }
    );
    return $ary;
}

