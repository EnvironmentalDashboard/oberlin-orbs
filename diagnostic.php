<?php
require 'db.php';
foreach ($db->query('SELECT id, INET_NTOA(ip) AS ip FROM orbs WHERE disabled = 0') as $row) {
  $msg = "?????";
  $result = shell_exec("echo \"{$msg}\" | timeout 5s netcat {$row['ip']} 9950");
  $stmt = $db->prepare('UPDATE orbs SET diagnostic = ? WHERE id = ?');
  $stmt->execute(array($result, $row['id']));
}
?>