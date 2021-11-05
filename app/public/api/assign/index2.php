<?php
require 'class/DbConnection.php';

// Step 1: Get a datase connection from our helper class
$db = DbConnection::getConnection();

// Step 2: Create & run the query
$sql = 'SELECT  g.field, g.gdate, g.gtime, r.firstname, r.lastname,a.assign_status
        FROM assign a, game g, referee r
        WHERE g.id = a.id AND r.id = a.id';


$vars = [];


$stmt = $db->prepare($sql);
$stmt->execute($vars);



$games = $stmt->fetchAll();

// Step 3: Convert to JSON
$json = json_encode($games, JSON_PRETTY_PRINT);


// Step 4: Output
header('Content-Type: application/json');
echo $json;