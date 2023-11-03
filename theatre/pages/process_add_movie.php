<?php
session_start();
include('../../config.php');
extract($_POST);

$target_dir = "../../images/";
$target_file = $target_dir . basename($_FILES["image"]["name"]);

$flname = "images/" . basename($_FILES["image"]["name"]);

// Store the session variable in a separate variable
$theatre = $_SESSION['theatre'];

// Prepare the SQL statement with placeholders
$stmt = $con->prepare("INSERT INTO tbl_movie (movie_id, t_id, movie_name, cast, `desc`, release_date, image, video_url, `status`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, 0)");

// Bind parameters
$stmt->bind_param("sssssss", $theatre, $name, $cast, $desc, $rdate, $flname, $video);

if ($stmt->execute()) {
    // Query executed successfully
    move_uploaded_file($_FILES["image"]["tmp_name"], $target_file);
    $_SESSION['success'] = "Movie Added";
    header('location:add_movie.php');
} else {
    // Error handling
    $_SESSION['error'] = "Error adding movie: " . $stmt->error;
    header('location:add_movie.php');
}

// Close the statement
$stmt->close();
?>

