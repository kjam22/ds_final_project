<?php
require 'class/DbConnection.php';

// Step 1: Get a datase connection from our helper class
$db = DbConnection::getConnection();

// Step 2: Create & run the query
$sql='SELECT * FROM assign';

$sql = 'SELECT  a.id,  a.gameid, r.firstname, r.lastname, a.refereeid,  a.assign_status, g.field, g.gtype,g.gdate,g.gtime, a.assign_position
FROM assign a, referee r, game g
WHERE  a.refereeid = r.id  and a.gameid=g.id';
$vars = [];


$stmt = $db->prepare($sql);
$stmt->execute($vars);

$games = $stmt->fetchAll();


// Step 3: Convert to JSON
$json = json_encode($games, JSON_PRETTY_PRINT);


// Step 4: Output
header('Content-Type: application/json');
echo $json;
