<html>
<body>
<?php
  if(isset($_POST['submit']))
  {
    $username = $_POST['username'];
    $password = $_POST['password'];
    ob_start();
    session_start();
    try
    {
      $con = new PDO("mysql:dbname=webportal;host=localhost","root","!@m+her00+@db");
      $con->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_WARNING);
    }
    catch(PDOException $e)
    {
      exit("Connection failed ". $e->getMessage());
    }
    require_once("account.php");
    $account = new Account($con);
    $success = $account->login($username,$password);
    if($success)
    {
      header("Location: hacker.php");
    }
  }
?>

