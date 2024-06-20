netsh wlan show profiles | Out-file -FilePath "./output.txt"
Write-Host "please fix output before continue"
Read-Host -Prompt "Press any key after fix"
foreach($ussd in Get-Content ./output.txt){ netsh wlan show profile "$ussd" key=clear | Out-file -filepath "./ussd.txt" -append}
