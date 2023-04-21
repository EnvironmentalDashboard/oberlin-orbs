<?php
// another way of doing it
error_reporting(-1);
ini_set('display_errors', 'On');
require 'db.php';
foreach ($db->query('SELECT id, elec_uuid, water_uuid, elec_rvid, water_rvid, disabled, testing, INET_NTOA(ip) AS ip FROM orbs ORDER BY id ASC') as $row) {
	if (($row['testing'] === '0')) {
		if ($row['disabled'] === '0') {
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
			exec('bash -c "exec nohup setsid echo \'' . $msg . '\' | timeout 15s netcat ' . $row['ip'] . ' 9950 > \'' . $row['ip'] . '\' 2>&1 &"');
			// $stmt = $db->prepare('UPDATE orbs SET last_resp = ? WHERE id = ?');
			// $stmt->execute(array($result, $row['id']));
		} //else {
		// 	shell_exec("echo \"^R00B00G00f32+\" | timeout 2s netcat {$row['ip']} 9950");
		// }
	} else {
		$msg = "****";
		exec('bash -c "exec nohup setsid echo \'' . $msg . '\' | timeout 15s netcat ' . $row['ip'] . ' 9950 > \'' . $row['ip'] . '\' 2>&1 &"');
		$con = "mysql:host={$host};dbname={$dbname};charset=utf8;port=3306";
		try {
			$db = new PDO($con, "{$username}", "{$password}"); // cast as string bc cant pass as reference
			$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
		} catch (PDOException $e) {
			die($e->getMessage());
		}
		$updatetest = 'UPDATE orbs SET testing=0 WHERE ip="' . $row['ip'] . '"';;
		$db->query($updatetest);
	}
}
