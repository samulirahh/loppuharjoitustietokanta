<?php

require_once '../inc/functions.php';
require_once '../inc/headers.php';

$input = json_decode(file_get_contents('php://input'));
$name = filter_var($input->name, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

try {
    $db = openDb();
    $sql = "insert into categories (category_name) values ('$name')";
    executeInsert($db, $sql);
    $data = array('trnro' => $db->lastInsertId(), 'category_name' => $name);
    print json_encode($data);

} catch (PDOException $pdoex) {
returnError($pdoex);
}