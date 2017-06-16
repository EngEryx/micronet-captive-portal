
<?php
$data = array();
var_dump($_POST);
//------------------
$file = "log_json.txt";
$log = fopen($file, 'a');
$data = $_POST;
$str = "";
foreach($data as $det=>$k)
{
$str = $det."=>".$k."\n";
}

echo $str;
fwrite($log, $str);
//fclose($log);
echo "success";


?>