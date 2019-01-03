function checkIP($ip){
    ping $ip -n 1 -w 500
    $code = $lastexitcode -eq 0
    return $code
}

$output = @{}
foreach($nr in 1..10){
    $test = checkIP('192.168.102.'+$nr)
    if($test -contains "True"){
        $output.Add('192.168.102.'+$nr, $True)
    }else{
        $output.Add('192.168.102.'+$nr, $False)
    }
}

$filename = "Pings.csv"
$output | Out-File -filepath C:\tmp\$filename -Encoding utf8

