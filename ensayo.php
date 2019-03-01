<?php 
if (verifi_arq_ping('www.google.com')) {
	echo ("hay conectividad\n");
}else{
	echo("no hay conectividad\n");
}

function verifi_arq_ping($dominio){
	$ch = curl_init($dominio);
	curl_setopt($ch, CURLOPT_TIMEOUT, 5);
	curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	$data = curl_exec($ch);
	$httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
	curl_close($ch);
	if($httpcode>=200 && $httpcode<300){
	  return true;
	} else {
	  return false;
	}

}

 ?>