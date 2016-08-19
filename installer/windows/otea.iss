[Setup]
AppName=OceanTEA
AppVersion=1
DefaultDirName={userappdata}\OceanTEA
DefaultGroupName=OceanTEA
Compression=none
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64
MinVersion=10.0
ChangesEnvironment=yes

[Files]
Source: "InstallDocker.msi"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\docker\windows\*"; DestDir: "{app}\scripts"; Flags: ignoreversion
Source: ".\docker-quickstart-terminal.ico"; DestDir: "{app}"; Flags: ignoreversion

[Run]
Filename: "msiexec.exe"; Parameters: "/i ""{app}\InstallDocker.msi"" /passive"
Filename: "{pf64}\Docker\Docker\Docker for Windows.exe"; Flags: nowait

[Icons]
Name: "{commondesktop}\Start OceanTEA"; WorkingDir: "{app}\scripts"; Filename: "{app}\scripts\start.bat"; IconFilename: "{app}/docker-quickstart-terminal.ico"
Name: "{commondesktop}\Stop OceanTEA"; WorkingDir: "{app}\scripts"; Filename: "{app}\scripts\start.bat"; IconFilename: "{app}/docker-quickstart-terminal.ico"
