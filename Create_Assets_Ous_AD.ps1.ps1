# #############################################################################
#
# POWERSHELL
# NAME: Create_Assets_Ous_AD.ps1
# 
# AUTHOR:  Felipe Sa
# DATE:  10/08/2021
# 
# COMMENT:  Script to create assets (laptop and desktop) in different OUs (offices) in Active Directory.
# Displays assets joined to the domain within the last 30 days to facilitate the creation of the next one.
#
# VERSION HISTORY
# 1.0 10.08.2021 Initial Version.
#
# #############################################################################

Import-Module ActiveDirectory;

$ADgroup1 = “EUR-SG Allowed Autodesk LicDir Rename Computers”
$ADgroup2 = “EUR-SG Allowed SMB1 Removal Computers”
$ADgroup3 = “EUR-SG IRL BitLocker Computers”

function Show-Menu {       
    param (
        [string]$Title = 'Select the Office'
    )
    Clear-Host
    Write-Host "================ Joined to the domain within the last 10 days ================"
    $Joined = [DateTime]::Today.AddDays(-10)
    Get-ADComputer -Filter 'WhenCreated -ge $joined' -Properties whenCreated | Format-Table Name,whenCreated,distinguishedName -Autosize -Wrap
    Write-Host "================ $Title ================"
    Write-Host "";    
    Write-Host "1: Press '1' for Dublin"
    Write-Host "2: Press '2' for Cork"
    Write-Host "3: Press '3' for Galway"
    Write-Host "Q: Press 'Q' to quit."   

}

do
 {
    Show-Menu
    Write-Host "";
    $office = Read-Host "Select the office"
    switch ($office)
    {
    '1' {
                   
          Do{
    $computername = Read-Host "Computer name"
}While (($computername -eq $null) -or ($computername -eq ""))

Do{
    $ou = Read-Host "Type of the computer [1- Laptop] or [2- Desktop]"

}While (($ou -ne 1) -and ($ou -ne 2))
       

        

         if ($ou -eq "1") { $ou = "OU=Laptops,OU=Computers,OU=West Pier,OU=Offices,OU=IRL,OU=Europe,DC=eur,DC=rpsgroup,DC=com"; $type = "Laptop"  }
         if ($ou -eq "2") { $ou = "OU=Desktops,OU=Computers,OU=West Pier,OU=Offices,OU=IRL,OU=Europe,DC=eur,DC=rpsgroup,DC=com"; $type = "Desktop" }

         
         Write-Host "";
         Write-Host "Adding $computername to Active Directory ..."
         Write-Host "";

         New-ADComputer -Name $computername -SamAccountName $computername -Path $ou

         write-host "$computername has been added to AD"
         # [void][System.Console]::ReadKey($true)

         Write-Host "";
         write-host "$ADgroup1 has been added to $computername"
         write-host "$ADgroup2 has been added to $computername"
         write-host "$ADgroup3 has been added to $computername"
         # [void][System.Console]::ReadKey($true)

         $pc = Get-ADComputer "$computername" | Select -expand SamAccountName

         Add-ADGroupMember $ADgroup1 $pc -passthru
         Add-ADGroupMember $ADgroup2 $pc -passthru
         Add-ADGroupMember $ADgroup3 $pc -passthru
         
         Write-Host "";
         write-host "DONE! $type $computername created successfully!"
         # [void][System.Console]::ReadKey($true)
         Write-Host "";

         } '2' {
    
               Do{
    $computername = Read-Host "Computer name"
}While (($computername -eq $null) -or ($computername -eq ""))

Do{
    $ou = Read-Host "Type of the computer [1- Laptop] or [2- Desktop]"

}While (($ou -ne 1) -and ($ou -ne 2))
       

        

         if ($ou -eq "1") { $ou = "OU=Laptops,OU=Computers,OU=Innishmore,OU=Offices,OU=IRL,OU=Europe,DC=eur,DC=rpsgroup,DC=com"; $type = "Laptop"  }
         if ($ou -eq "2") { $ou = "OU=Desktops,OU=Computers,OU=Innishmore,OU=Offices,OU=IRL,OU=Europe,DC=eur,DC=rpsgroup,DC=com"; $type = "Desktop" }

         Write-Host "";
         Write-Host "Adding $computername to Active Directory ..."
         Write-Host "";

         New-ADComputer -Name $computername -SamAccountName $computername -Path $ou

         write-host "$computername has been added to AD"
         # [void][System.Console]::ReadKey($true)

         Write-Host "";
         write-host "$ADgroup1 has been added to $computername"
         write-host "$ADgroup2 has been added to $computername"
         write-host "$ADgroup3 has been added to $computername"
         # [void][System.Console]::ReadKey($true)

         $pc = Get-ADComputer "$computername" | Select -expand SamAccountName

         Add-ADGroupMember $ADgroup1 $pc -passthru
         Add-ADGroupMember $ADgroup2 $pc -passthru
         Add-ADGroupMember $ADgroup3 $pc -passthru
         
         Write-Host "";
         write-host "DONE! $type $computername created successfully!"
         # [void][System.Console]::ReadKey($true)
         Write-Host "";

    } '3' {     
     Do{
    $computername = Read-Host "Computer name"
}While (($computername -eq $null) -or ($computername -eq ""))

Do{
    $ou = Read-Host "Type of the computer [1- Laptop] or [2- Desktop]"

}While (($ou -ne 1) -and ($ou -ne 2))
       

        

         if ($ou -eq "1") { $ou = "OU=Laptops,OU=Computers,OU=Galway,OU=Offices,OU=IRL,OU=Europe,DC=eur,DC=rpsgroup,DC=com"; $type = "Laptop"  }
         if ($ou -eq "2") { $ou = "OU=Desktops,OU=Computers,OU=Galway,OU=Offices,OU=IRL,OU=Europe,DC=eur,DC=rpsgroup,DC=com"; $type = "Desktop" }

         Write-Host "";
         Write-Host "Adding $computername to Active Directory ..."
         Write-Host "";

         New-ADComputer -Name $computername -SamAccountName $computername -Path $ou

         write-host "$computername has been added to AD"
         # [void][System.Console]::ReadKey($true)

         Write-Host "";
         write-host "$ADgroup1 has been added to $computername"
         write-host "$ADgroup2 has been added to $computername"
         write-host "$ADgroup3 has been added to $computername"
         # [void][System.Console]::ReadKey($true)

         $pc = Get-ADComputer "$computername" | Select -expand SamAccountName

         Add-ADGroupMember $ADgroup1 $pc -passthru
         Add-ADGroupMember $ADgroup2 $pc -passthru
         Add-ADGroupMember $ADgroup3 $pc -passthru
         
         Write-Host "";
         write-host "DONE! $type $computername created successfully!"
         # [void][System.Console]::ReadKey($true)
         Write-Host "";
    }
    }
    pause
 }
until ($office -eq 'q')