<?php
include 'db_connect.php';
function dijkstra($graph, $start, $end) {
    $distances = [];
    $previous = [];
    $nodes = [];

    // Initialize distances and previous nodes
    foreach ($graph as $node => $edges) {
        $distances[$node] = INF; // Set initial distances to infinity
        $previous[$node] = null; // No previous node
        $nodes[$node] = $node; // All nodes are available to visit
    }
    $distances[$start] = 0; // Distance to the start node is 0

    while (!empty($nodes)) {
        // Find the node with the smallest distance
        $minNode = null;
        foreach ($nodes as $node) {
            if ($minNode === null || $distances[$node] < $distances[$minNode]) {
                $minNode = $node;
            }
        }

        if ($minNode === $end) {
            break; // We've reached the destination
        }

        unset($nodes[$minNode]); // Remove this node from the unvisited list

        // Update the distances to neighboring nodes
        foreach ($graph[$minNode] as $neighbor => $cost) {
            $alt = $distances[$minNode] + $cost;
            if ($alt < $distances[$neighbor]) {
                $distances[$neighbor] = $alt;
                $previous[$neighbor] = $minNode;
            }
        }
    }

    // Backtrack to find the path
    $path = [];
    $current = $end;
    while ($previous[$current] !== null) {
        $path[] = $current;
        $current = $previous[$current];
    }
    $path[] = $start;

    return array_reverse($path); // Return the path from start to end
}

// Function to get the graph from the database using mysqli
/*function getGraph($conn) {
    $graph = [];

    $sql = "SELECT from_branch_id, to_branch_id, distance FROM branch_distances";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $graph[$row['from_branch_id']][$row['to_branch_id']] = $row['distance'];
            $graph[$row['to_branch_id']][$row['from_branch_id']] = $row['distance']; // For undirected graph
        }
    }

    return $graph;
}*/

// Function to get branch details (name, city) from the database using mysqli
/*function getBranchDetails($conn, $branchId) {
    $stmt = $conn->prepare("SELECT branch_code, city FROM branches WHERE id = ?");
    $stmt->bind_param("i", $branchId); // "i" means the branchId is an integer
    $stmt->execute();
    $result = $stmt->get_result();
    return $result->fetch_assoc();
}*/
?>
