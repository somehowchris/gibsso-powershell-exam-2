function getProducts([System.string] $sstring){
    if($sstring){
        return (Get-WmiObject Win32_Product | Where-Object {$_.Name -like "*"+$sstring+"*"} | Select-Object Name, Version)
    }else{
        return (Get-WmiObject Win32_Product | Select-Object Name, Version)
    }
}