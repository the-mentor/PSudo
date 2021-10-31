function psudo {
    $cmd = "`$r=$($Args[0..-1]);[System.Management.Automation.PSSerializer]::Serialize(`$r)"
    $CmdInBytes = [System.Text.Encoding]::Unicode.GetBytes($cmd)
    $EncodedCmd=[Convert]::ToBase64String($CmdInBytes)
    $r=sudo pwsh -e "$EncodedCmd"
    if($r){[System.Management.Automation.PSSerializer]::Deserialize($r)}
}