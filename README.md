# Overview

This PowerShell script automates adding assets in different OUs (for companies that have different offices in the Active Directory)<br/>
This script adds laptops & desktops to Active Directory.

# Usage

$ADgroup = “EU-Finance-Group” --> Change to your AD group name<br/>
function Show-Menu --> Modify with the name of your offices<br/>
$ou = "OU=Laptops,OU=Computers..." --> Path to your desktop/laptop OU in your AD. You have to change it according to the selected office.<br/>

1. Run ".\Create_Assets_Ous_AD" as Admin
2. Select your Office (1-Dublin, 2- Cork, 3- Other, Q-Quit)<br/>
  Option 1: Laptop<br/>
  Option 2: Desktop<br/>
3. Voila! Asset added to AD with the appropriate security group.

# Features
You can update the script by adding/removing offices as per your scenario.<br/>Remember to reflect this change in the menu and code.

