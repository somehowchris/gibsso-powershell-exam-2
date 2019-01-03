function getProcesses([System.string] $filterDuplicates){
    if($filterDuplicates){
        $processes = @()
        foreach($process in (Get-Process).Name){
            if(-not $processes.Contains($process)){
                $processes += $process
            }
        }
        return $processes
    }else{
        return ((Get-Process).Name | Sort-Object Name )
    }
}