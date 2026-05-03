<?php
require 'db_connect.php';
require 'dijkstra.php';

if (empty($_GET['start']) || empty($_GET['end'])) {
  echo "Looks like source and destination is same branch";
  die;
}
if (isset($_GET['start']) && isset($_GET['end'])) {
    $startBranchId = $_GET['start'];
    $endBranchId = $_GET['end'];

  
    $graph = getGraph($conn);  

    $shortestPath = dijkstra($graph, $startBranchId, $endBranchId);

    echo "<h2>Shortest Path from Branch $startBranchId to Branch $endBranchId</h2>";

    
    echo "<ul>";
    foreach ($shortestPath as $branchId) {
        $branch = getBranchDetails($conn, $branchId);
        echo "<li><strong>{$branch['branch_code']}</strong> - {$branch['city']}</li>";
    }
    echo "</ul>";
} else {
    echo "No data provided. Please provide the start and end branch IDs.";
}

function getGraph($conn) {
    $graph = [];

    
    $sql = "SELECT * FROM branch_distances";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $graph[$row['from_branch_id']][$row['to_branch_id']] = $row['distance'];
            $graph[$row['to_branch_id']][$row['from_branch_id']] = $row['distance'];
        }
    }

    return $graph;
}

function getBranchDetails($conn, $branchId) {
    $stmt = $conn->prepare("SELECT * FROM branches WHERE id = ?");
    $stmt->bind_param("i", $branchId);  
    $stmt->execute();
    $result = $stmt->get_result();

    return $result->fetch_assoc();
}
