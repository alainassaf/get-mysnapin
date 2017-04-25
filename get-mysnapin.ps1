Function Get-MySnapin {
<#
    .SYNOPSIS
    Checks for a PowerShell Snapin(s) and imports it if available, otherwise it will display a warning and exit.
    .DESCRIPTION
    Checks for a PowerShell Snapin(s) and imports it if available, otherwise it will display a warning and exit.
    .PARAMETER snapins
    Required parameter. List of PSSnapins separated by commas.
    .INPUTS
    None
    .OUTPUTS
    None
    .EXAMPLE
    PS> get-MySnapin PSSNAPIN
    Checks system for installed PSSNAPIN and imports it if available.
    .LINK
    http://www.linkedin.com/in/alainassaf/
    http://wagthereal.com
    https://github.com/alainassaf/get-mysnapin
    .NOTES
    NAME        :  Get-MySnapin
    VERSION     :  1.00
    CHANGE LOG - Version - When - What - Who
    1.00 - 02/13/2017 - Initial script - Alain Assaf
    LAST UPDATED:  02/13/2017
    AUTHOR      :  Alain Assaf
#>
    Param([string]$snapins)
        $ErrorActionPreference= 'silentlycontinue'
        foreach ($snap in $snapins.Split(",")) {
            if(-not(Get-PSSnapin -name $snap)) {
                if(Get-PSSnapin -Registered | Where-Object { $_.name -like $snap }) {
                    add-PSSnapin -Name $snap
                    $true
                }                                                                           
                else {
                    write-warning "$snap PowerShell Cmdlet not available."
                    write-warning "Please run this script from a system with the $snap PowerShell Cmdlet installed."
                    exit 1
                }                                                                           
            }                                                                                                                                                                  
        }
}

$PSSnapins = ("*citrix*")

get-MySnapin $PSSnapins
