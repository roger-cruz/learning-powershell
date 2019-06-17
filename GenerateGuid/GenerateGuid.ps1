
function GenerateGuid()
{
    # This is a convenient static method that you can call to get a new Guid. 
    $guid = [guid]::NewGuid()
    return $guid
}

$newGuid = GenerateGuid
Write-Host("A new GUID was generated: $newGuid")