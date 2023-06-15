--TEST--
BZ2 with files
--EXTENSIONS--
bz2
--FILE--
<?php

error_reporting(E_ALL);

$filename = "with_files.bz2";
$str = "This is a test string.\n";
$bz = bzopen($filename, "w");
bzwrite($bz, $str);
bzclose($bz);

$bz = bzopen($filename, "r");
print bzread($bz, 10);
print bzread($bz);
bzclose($bz);
unlink($filename);
?>
--EXPECT--
This is a test string.