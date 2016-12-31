function Expand-ZIPFile($file, $destination)
{
$shell = new-object -com shell.application
$zip = $shell.NameSpace($file)
foreach($item in $zip.items())
{
$shell.Namespace($destination).copyhere($item)
}
}

$DOCDIR = (Get-Item -Path ".\" -Verbose).FullName
$TARGETDIR = "$DOCDIR\w32-bin"
if( -not (Test-Path "$TARGETDIR") ){ New-Item -ItemType directory -Path $TARGETDIR; (New-Object Net.WebClient).DownloadFile('https://sourceforge.net/projects/win-bash/files/shell-complete/latest/shell.w32-ix86.zip/download',"$DOCDIR\win-bash.zip"); Expand-ZIPFile -File "$DOCDIR\win-bash.zip" -Destination "$DOCDIR\w32-bin\"; Remove-Item "$DOCDIR\win-bash.zip"; }

(New-Object Net.WebClient).DownloadFile('https://github.com/prafiny/db-project/archive/master.zip',"$DOCDIR\master.zip");
Expand-ZIPFile -File "$DOCDIR\master.zip" -Destination "$DOCDIR\"; Remove-Item "$DOCDIR\master.zip";

w32-bin\bash.exe update.sh --no-zip
