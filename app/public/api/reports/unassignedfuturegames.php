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

require("class/DbConnection.php");

// Step 0: Validate the incoming data
// This code doesn't do that, but should ...
// For example, if the date is empty or bad, this insert fails.

// Step 1: Get a datase connection from our helper class
$db = DbConnection::getConnection();

// Step 2: Create & run the query
// Note the use of parameterized statements to avoid injection
$stmt = $db->prepare(
        'SELECT a.assign_status, 
        g.field,
        g.gdate, 
        g.gtime, 
        r.firstname,
        r.lastname
        FROM game g, referee r, assign a 
        WHERE r.id = a.refereeid AND 
              g.id = a.gameid AND 
              g.gdate > ? and a.assign_status = "unassigned"');       



$stmt->execute([
  $_POST['gdate'],
  
 ]);

 $games = $stmt->fetchAll();
 if (isset($_GET['format']) && $_GET['format']=='csv') {
    header('Content-Type: text/csv');
    echo "Referee Status,Game Field,Game Date,Start Time, End Time\r\n";
  
    foreach($games as $g) {
      echo $g['assign_status'] . ','
          .$g['gfield'] . ','
          .$g['gdate'] . ','
          .$g['gtime'] . ','
          .$g['lastname'] . ','
          .$g['firstname']."\r\n";
    }
  
  } 

 // Step 3: Convert to JSON
 else {
     $json = json_encode($games, JSON_PRETTY_PRINT);
 
 // Step 4: Output
 header('Content-Type: application/json');
 echo $json;
 }
