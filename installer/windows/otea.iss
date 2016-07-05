
[Setup]
AppName=OceanTEA
AppVersion=0
DefaultDirName={userappdata}\OceanTEA
DefaultGroupName=OceanTEA
Compression=none

[Files]
Source: "Git-2.9.0-64-bit.exe"; DestDir: "{app}"
Source: "DockerToolbox-1.11.2.exe"; DestDir: "{app}"

[Run]
Filename: "{app}\Git-2.9.0-64-bit.exe"; Parameters: "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
Filename: "{app}\DockerToolbox-1.11.2.exe"; Parameters: "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
Filename: "{pf64}\Git\git-bash.exe"; WorkingDir: "{pf64}\Docker Toolbox\"; Parameters: "--login ""{pf64}\Docker Toolbox\start.sh"""
Filename: "{pf64}\Git\cmd\git.exe"; Parameters: "clone https://github.com/a-johanson/oceantea-build.git"; WorkingDir: "{app}"
