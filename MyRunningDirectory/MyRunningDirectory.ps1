
function WhatIsMyRunningDirectory
{
	# We use the variable scope construct ($script:) to specify this script
	# as opposed to a calling (parent) script.
	# More at https://scriptingblog.com/tag/myinvocation-mycommand-path/
	$scriptPath = $script:MyInvocation.MyCommand.Path
	$dir = Split-Path $scriptpath
	return $dir
}

# Note that this is the location of the script and not where it was invoked from.
$myDir = WhatIsMyRunningDirectory
Write-Host("This script is located in: $myDir")