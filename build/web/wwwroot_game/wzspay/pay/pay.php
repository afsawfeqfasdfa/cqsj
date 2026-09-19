<?php
    header("Content-type: text/html; charset=utf8");
    if(isset($_REQUEST['money'])){
        $paymoney = $_REQUEST['money'];
        $gameuser = $_REQUEST['roleName'];
        $url = "http://127.0.0.1/Payment/WapService/7ca3198a96c978a078d9f85d122b9ecc";
        $url .= sprintf("?gameuser=%s&paymoney=%s",$gameuser,$paymoney);
        header("location:$url");
    }
?>

