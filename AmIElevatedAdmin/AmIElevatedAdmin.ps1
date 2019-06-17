

function AmIElevatedAdmin()
{
    # Returns a WindowsIdentity object that represents the current Windows user.
    $currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()

    # The WindowsPrincipal class is primarily used to check the role of a Windows user.
    # The WindowsPrincipal.IsInRole method overloads let you check the user role by using
    # different role contexts.
    $principal = New-Object System.Security.Principal.WindowsPrincipal($currentUser)

    # Get the Administrator context.
    $admin = [System.Security.Principal.WindowsBuiltInRole]::Administrator

    # Check if the user is an administrator context.
    $isElevatedAdmin = $principal.IsInRole($admin)

    return $isElevatedAdmin
}

$isAdmin = AmIElevatedAdmin

Write-Host("Current user is elevated admin: $isAdmin")

# Note that in PoSH v4, you can simply add these commands to the top of the file.
#   #requires -version 4.0
#   #requires –runasadministrator
#
# See more here: https://www.jonathanmedd.net/2014/01/testing-for-admin-privileges-in-powershell.html