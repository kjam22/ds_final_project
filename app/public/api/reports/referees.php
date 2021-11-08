<?php

try {
    $_POST = json_decode(
                file_get_contents('php://input'), 
                true,
                2,
                JSON_THROW_ON_ERROR
            );
} catch (Exception $e) {
    header($_SERVER["SERVER_PROTOCOL"] . " 400 Bad Request");
    exit;
}
require 'class/DbConnection.php';

// Step 1: Get a datase connection from our helper class
$db = DbConnection::getConnection();

// Step 2: Create & run the query

$stmt = $db->prepare ( 'SELECT a.assign_status, 
                    g.field,
                    g.gdate, 
                    g.gtime, 
                    r.firstname,
                    r.lastname,
                    a.assign_position,
                    g.gtype
                    FROM game g, referee r, assign a 
                    WHERE  
                    r.id = a.refereeid AND 
                  g.id = a.gameid AND g.gdate = ? and g.gtime = ? and g.id = ? ');
$vars = [];


$stmt->execute([
    $_POST['gdate'],
    $_POST['gtime'],
    $_POST['gameid'],
   ]);


$games = $stmt->fetchAll();


// Step 3: Convert to JSON
$json = json_encode($games, JSON_PRETTY_PRINT);


// Step 4: Output
header('Content-Type: application/json');
echo $json;