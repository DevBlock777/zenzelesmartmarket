<?php
// require __DIR__ . '/../vendor/autoload.php';

// use Dotenv\Dotenv;

// $dotenv = Dotenv::createImmutable(__DIR__ . "/../");
// $dotenv->load();

// $host = $_ENV["DB_HOST"];
// $dbName = $_ENV["DB_NAME"];
// $dbUser = $_ENV["DB_USER"];
// $dbPassword = $_ENV["DB_PASSWORD"];

$env = parse_ini_file(__DIR__ . "/../.env");

$host = $env["DB_HOST"];
$dbName = $env["DB_NAME"];
$dbUser = $env["DB_USER"];
$dbPassword = $env["DB_PASSWORD"];
echo "Host: $host\n";

try {
  $conn = new PDO("mysql:host=$host;dbname=$dbName", $dbUser, $dbPassword);
  // set the PDO error mode to exception
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  echo "Connected successfully";
} catch(PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
}