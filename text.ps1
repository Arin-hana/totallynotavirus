netsh wlan show profiles | Out-file -FilePath "./output.txt"
#Write-Host "please fix output before continue"
#Read-Host -Prompt "Press any key after fix"
$input = Get-content "./output.txt" -raw
$pattern = "All User Profile\s*:\s*(.*)"
$matches = [regex]::Matches($input, $pattern)

if ($matches.Count -gt 0) {
    foreach ($match in $matches) {
        $profileName = $match.Groups[1].Value.Trim()
        netsh wlan show profile "$profileName" key=clear | Out-file -filepath "./ussd.txt" -append
    }
}
