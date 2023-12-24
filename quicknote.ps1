#This Script is incpired by https://github.com/scottashipp/noted
#This script will check for a text file in a defined folder named for todays date and create one if it doesn't exist.
#It will then prompt for input across multiple lines, store the input as a variable, and append the out put with a timestamp to the dated text file.

#Variables Section
#Edit this variable to point to the folder you are storing notes.  The folder must exist and your user account must have write permissions or the script will error.

###STORE IN DOCUMENTS FOLDER?  ADJUST VARIABLE TO FIND DOCS REGARDLESS OF REDIRECTION https://stackoverflow.com/questions/24771455/getting-the-users-documents-folder-in-powershell
$notesfolder = "$env:USERPROFILE\Documents\Notes\"

#Do not Adjust
$date = Get-Date
#Year to 4 digit string
$yystr = $date.ToString("yyyy")
$yysubfolder = Join-Path $notesfolder $yystr
#Month
$MMMstr = $date.ToString("MMM")
$MMMsubfolder = Join-Path $yysubfolder $MMMstr
#File
$filedate = $date.ToString("yyyy_MM_dd")
$filename = "$filedate.md"
$filepath = Join-Path $MMMsubfolder $filename

######################
#Define Note Entry Template
$time = $date.ToString("hh:mm:ss tt K")
$notel2 = "---  `n  ### $time `n"
#$notel3 = "### Note Time $time"
#######################

#Notes will be sorted by Year/Month/ 
#Check for Base Folder and create if it doesn't exist
if (!(Test-Path $notesfolder))
    {
        mkdir $notesfolder
        Write-Host "Created Notes Storage Folder"
    }
#Check for Year Folder and create if it doesn't exist
    if (!(Test-Path $yysubfolder))
    {
        mkdir $yysubfolder
        Write-Host "Created Folder $yysubfolder"
    }
#Check for Month Folder and create if it doesn't exist
if (!(Test-Path $MMMsubfolder))
{
    mkdir $MMMsubfolder
    Write-Host "Created Folder $MMMsubfolder"
}
#Check for Todays Text File and Create if it doesn't exist
if (!(Test-Path $filepath))
{
    New-Item -Path $MMMsubfolder -Name $filename -ItemType "file" -Value "# Notes For $filedate"
    Write-Host "Created Notes File for Today"
}

Write-Host "Enter your notes, use MD syntax for formatting.  Enter on a blank line to finish"
while (1) 
  {
    read-host | Set-Variable r
    Set-Variable note -value ($note+"`n"+$r+"  ")
    if (!$r) {break}
  }
$note = $note.trim()
if (!($note))
  {
    exit
  } else {
        $wholenote = $notel2, $note
        Add-Content -Path $filepath -Value $wholenote
  }
