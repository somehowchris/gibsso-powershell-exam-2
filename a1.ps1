function getTotalA{
    $total = (get-wmiObject Win32_OperatingSystem -Property TotalVisibleMemorySize).TotalVisibleMemorySize
    $free = (get-wmiObject Win32_OperatingSystem -Property FreePhysicalMemory).FreePhysicalMemory
    return $total - $free
}

function getTotalB{
    $total = ((Get-Process).WorkingSet | Measure-Object -Sum).Sum / 1KB
    return $total
}

$a = getTotalA
$b = getTotalB
$diff = $b - $a
    
Write-Host "Total A:   $($a/1KB) MB"
Write-Host "Total B:   $($b/1KB) MB"
Write-Host "Diff:      $($diff/1KB) MB"