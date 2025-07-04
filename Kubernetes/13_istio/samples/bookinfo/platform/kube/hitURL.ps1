﻿$URLs = @(
  'http://192.168.1.129' #change the public ip as per your setup
)

$minSeconds = 1 * 1
$maxSeconds = 2 * 1

# Loop forever
while($true){
  # Send requests to all 3 urls
  $URLs |ForEach-Object {
    (Invoke-WebRequest -Uri $_ | Select Content).content
  }

  # Sleep for a random duration between 10 and 15 minutes
  Start-Sleep -Seconds (Get-Random -Min $minSeconds -Max $maxSeconds)
}