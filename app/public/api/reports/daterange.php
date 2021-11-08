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

// Step 1: Get a datase connection from our helper class
$db = DbConnection::getConnection();

// Step 2: Create & run the query
// Note the use of parameterized statements to avoid injection
$stmt = $db->prepare(
        'SELECT g.field, 
        g.gdate, 
        g.gtime,
        r.firstname,
        r.lastname,
        r.id
        FROM game g, referee r, assign a 
        WHERE r.id = a.refereeid AND 
              g.id = a.gameid AND 
              g.gdate > ? and g.gdate < ?  and r.id = ? and a.assign_status= "assigned" ');

$stmt->execute([
  $_POST['start_date'],
  $_POST['end_date'],
  $_POST['refereeid'],
 ]);


 $games = $stmt->fetchAll();
 if (isset($_GET['format']) && $_GET['format']=='csv') {
    header('Content-Type: text/csv');
    echo "Game Field,Game Date, Game Time, Referee Firstname, Referee Lastname\r\n";
  
    foreach($games as $g) {
      echo $g['field']. ','
                .$g['gdate'] . ','
                .$g['gtime'] . ','
                .$g['firstname'] .','
                .$g['lastname']."\r\n";
    }
  
  } 
  else {

  
 // Step 3: Convert to JSON
 $json = json_encode($games, JSON_PRETTY_PRINT);
 
 // Step 4: Output
 header('Content-Type: application/json');
 echo $json;}