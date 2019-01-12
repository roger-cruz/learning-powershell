#
# Script.ps1
#
$service=$args[0]

# Process must not run between min and max secs
$doNotRunMin = 60
$doNotRunMax = 120

# Process must run between min and max secs
$runMin = 60
$runMax = 120

$iteration = 1
function StopSleepStart
{
	Write-Host "Stoping service $service.  Iteration: $iteration"
	Stop-Service $service
	$sleep = Get-Random -Minimum $doNotRunMin -Maximum $doNotRunMax
	Write-Host "Will restart the service in $sleep seconds"
	Start-Sleep -Seconds $sleep

	Write-Host "Starting service $service.  Iteration: $iteration"
	Start-Service $service
	$sleep = Get-Random -Minimum $runMin -Maximum $runMax
	Write-Host "Letting it run for $sleep seconds before stopping the service"
	Start-Sleep -Seconds $sleep
}

function Main()
{
	if (!$service)
	{
			"Please specify name of service to start/stop at random times"
	}
	else
	{
		while ($true)
		{
			StopSleepStart
			$iteration = $iteration + 1
		}
	}
}

Main
