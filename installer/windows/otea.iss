
[Setup]
AppName=OceanTEA
AppVersion=1
DefaultDirName={userappdata}\OceanTEA
DefaultGroupName=OceanTEA
Compression=none
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64

[Files]
Source: "Git-2.9.0-64-bit.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "DockerToolbox-1.11.2.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\docker-local\*"; DestDir: "{app}\scripts"; Flags: ignoreversion
Source: ".\docker-quickstart-terminal.ico"; DestDir: "{app}"; Flags: ignoreversion

[Run]
Filename: "{app}\Git-2.9.0-64-bit.exe"; Parameters: "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
Filename: "{app}\DockerToolbox-1.11.2.exe"; Parameters: "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"

[Icons]
Name: "{commondesktop}\Start OceanTEA"; WorkingDir: "{app}\scripts"; Filename: "{pf64}\Git\bin\bash.exe"; Parameters: "--login ""{app}\scripts\start.sh"""; IconFilename: "{app}/docker-quickstart-terminal.ico"
Name: "{commondesktop}\Stop OceanTEA"; WorkingDir: "{app}\scripts"; Filename: "{pf64}\Git\bin\bash.exe"; Parameters: "--login ""{app}\scripts\stop.sh"""; IconFilename: "{app}/docker-quickstart-terminal.ico"

[UninstallRun]
Filename: "{pf64}\Git\bin\bash.exe"; Parameters: "--login ""{app}\scripts\uninstall.sh"""; WorkingDir: "{app}\scripts"

[UninstallDelete]
Type: filesandordirs; Name: "{app}\scripts"
