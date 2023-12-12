<?php
// This PHP script writes a bash script that is downloaded and then executed by the server on Oberlins wifi
echo "#! /bin/bash\n\n";
error_reporting(-1);
ini_set('display_errors', 'On');
require '../includes/db.php';
foreach ($db->query('SELECT elec_uuid, water_uuid, elec_rvid, water_rvid, disabled, INET_NTOA(ip) AS ip FROM orbs') as $row) {
  if ($row['disabled'] === '0') {
    // It's better to store the meters uuid rather than id column because the uuid is an identifier that can be verified with the BuildingOS API ensuring that we will always know which meter is connected to which orb
    if ($row['elec_uuid'] == null) {
      $elec = 'X';
    } else {
      $stmt = $db->prepare('SELECT relative_value FROM relative_values WHERE id = ?');
      $stmt->execute(array($row['elec_rvid']));
      $elec = round(($stmt->fetchColumn() / 100) * 4); // must be integer 0-4
    }
    if ($row['water_uuid'] == null) {
      $water = 'X';
    } else {
      $stmt = $db->prepare('SELECT relative_value FROM relative_values WHERE id = ?');
      $stmt->execute(array($row['water_rvid']));
      $water = round(($stmt->fetchColumn() / 100) * 4); // must be integer 0-4
    }
    $msg = "/E{$elec}W{$water}&";
    // $msg = "?????";
    echo "echo \"{$msg}\" | netcat {$row['ip']} 9950 > '/home/steve/orbs/{$row['ip']}' 2>&1 &\n";
  } else {
    // echo "echo \"^R00B00G00f32+\" | netcat {$row['ip']} 9950;\n";
  }
}
?>