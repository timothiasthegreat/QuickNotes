#https://github.com/timothiasthegreat/QuickNotes

#Get User's Document Library Path
$cfgdDocuments = [Environment]::GetFolderPath("MyDocuments")

#Edit this variable to point to the folder you are storing notes.
#Initial configuration creates a QuickNotes folder in you Documents Library
$notesfolder = "$cfgdDocuments\QuickNotes\"

#########################
#Do not Adjust variables in this section
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

#Notes will be sorted by Year\Month\ 
#Check for QuickNotes\yyyy\MMM\ Folder and create if it doesn't exist
if (!(Test-Path $MMMsubfolder))
{
    mkdir $MMMsubfolder | Out-Null
    Write-Host "Created Folder $MMMsubfolder"
}
#Check for Todays Text File and Create if it doesn't exist
if (!(Test-Path $filepath))
{
    New-Item -Path $MMMsubfolder -Name $filename -ItemType "file" -Value "# Notes For $filedate `n `n" | Out-Null
    Write-Host "Created Notes File for Today"
}

######################
#Define Note Entry Template
$time = $date.ToString("hh:mm:ss tt K")
$notel1 = "`n  ### $time `n"
#######################

#Below While Loop collects terminal input to the variable r, then appends that input to the variable note 
#preceeded with a new line (provides the linebreak in the output) and follows it with a double space (markdown for simple line break)
#The loop breaks on a line only containing qq
Write-Host "Enter your notes, use MD syntax for formatting.  Type qq on the last line to finish:" -ForegroundColor Green
while (1) 
{
    $r = read-host
    $note += "`n" + $r + "  "
    if ($r -eq "qq") {break}
}
$note = $note.trim()
if (!($note))
  {
    exit
  } else {
        $wholenote = $notel1, $note, "`n ---"
        Add-Content -Path $filepath -Value $wholenote
  }
