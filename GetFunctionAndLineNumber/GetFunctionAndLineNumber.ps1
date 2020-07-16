
function Get-CallStack
{ 
    [CmdletBinding()] 
    Param 
    ( 
        [Parameter(Mandatory=$true, 
                   ValueFromPipelineByPropertyName=$true)] 
        [ValidateNotNullOrEmpty()] 
        [string]$Message
    )
 
    $stack = (Get-PSCallStack)    
    $cmd = $($stack[0].Command)
    $scriptName = $stack[0].ScriptName
    $lineNumber = $stack[0].ScriptLineNumber 
    Write-Host "Cmd $cmd, $script name = $scriptName, line # = $linenumber"
    $stack | Select-Object -Property *
}
Get-CallStack "Test"