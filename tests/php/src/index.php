<?php
echo "<html><body>";
echo "write test<br/>\n";
$myfile = fopen("writable/testfile.txt", "w");
fwrite($myfile, "test data\n");
fclose($myfile);
echo "read test<br/>\n";
$myfile = fopen("writable/testfile.txt", "r");
echo fread($myfile,filesize("writable/testfile.txt"));
echo "<br/>";
fclose($myfile);
echo "write test2<br/>\n";
$myfile = fopen("test2.txt", "w");
fwrite($myfile, "test2 data\n");
fclose($myfile);
echo "read test2<br/>\n";
$myfile = fopen("test2.txt", "r");
echo fread($myfile,filesize("test2.txt"));
echo "<br/>";
fclose($myfile);

echo "done<br/>\n";
echo "</body></html>"
?>
