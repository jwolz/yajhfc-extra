#ifndef VERSION
 #define public VERSION "0.5.1"
#endif

#define JAVAMAILDIR "..\..\..\..\java\lib\javamail"

[Files]
Source: ..\..\..\workspace\yajhfc-plugin-mail\build\yajhfc-plugin-mail.jar; DestDir: {app}; Components: base
;Source: batch-printer.override; DestDir: {app}\settings.d; Components: base
Source: ..\..\..\workspace\yajhfc-plugin-mail\dist\README.txt; DestDir: {app}; DestName: yajhfc-plugin-mail-README.txt; Components: base

Source: {#JAVAMAILDIR}\mail.jar; DestDir: {app}\lib; Components: base

[Setup]
AppCopyright=© 2005-2011 by Jonas Wolz
AppName=YajHFC Batch Printer and Mail Plugin
AppVerName=YajHFC Batch Printer and Mail Plugin {#VERSION}
;InfoBeforeFile=temp\README.txt
LicenseFile=..\..\..\workspace\yajhfc-plugin-mail\COPYING
DefaultDirName={reg:HKLM\Software\YajHFC,instpath|{pf}\YajHFC}
DefaultGroupName=YajHFC
AppPublisher=Jonas Wolz
AppPublisherURL=http://www.yajhfc.de/
AppVersion={#VERSION}
AppID={{A0AB9C07-00D5-489D-9EC2-FA4B6862DB3E}
UninstallDisplayIcon={app}\yajhfc.exe
UninstallDisplayName=YajHFC Batch Printer and Mail Plugin {#VERSION}
OutputBaseFilename=Setup-BatchPrinter
ArchitecturesInstallIn64BitMode=x64
DisableDirPage=yes

[Registry]
Root: HKLM; Subkey: Software\YajHFC; ValueType: string; ValueName: addLaunchArg.batchprinter; ValueData: "--loadplugin=""{app}\yajhfc-plugin-mail.jar"""; Flags: uninsdeletekeyifempty uninsdeletevalue
Root: HKLM; Subkey: Software\YajHFC; ValueType: string; ValueName: batchprinter-version; ValueData: {#VERSION}; Flags: uninsdeletekeyifempty uninsdeletevalue

Root: HKLM; Subkey: SYSTEM\CurrentControlSet\Control\Print\Monitors\Standard TCP/IP Port\Ports\yajhfc_batch_19101; ValueType: dword;  ValueName: Protocol; ValueData: 1; Flags: uninsdeletekey
Root: HKLM; Subkey: SYSTEM\CurrentControlSet\Control\Print\Monitors\Standard TCP/IP Port\Ports\yajhfc_batch_19101; ValueType: dword;  ValueName: Version; ValueData: 1; Flags: uninsdeletekey
Root: HKLM; Subkey: SYSTEM\CurrentControlSet\Control\Print\Monitors\Standard TCP/IP Port\Ports\yajhfc_batch_19101; ValueType: string; ValueName: HostName; ValueData: ""; Flags: uninsdeletekey
Root: HKLM; Subkey: SYSTEM\CurrentControlSet\Control\Print\Monitors\Standard TCP/IP Port\Ports\yajhfc_batch_19101; ValueType: string; ValueName: IPAddress; ValueData: "127.0.0.1"; Flags: uninsdeletekey
Root: HKLM; Subkey: SYSTEM\CurrentControlSet\Control\Print\Monitors\Standard TCP/IP Port\Ports\yajhfc_batch_19101; ValueType: string; ValueName: HWAddress; ValueData: ""; Flags: uninsdeletekey
Root: HKLM; Subkey: SYSTEM\CurrentControlSet\Control\Print\Monitors\Standard TCP/IP Port\Ports\yajhfc_batch_19101; ValueType: dword;  ValueName: PortNumber; ValueData: 19101; Flags: uninsdeletekey
Root: HKLM; Subkey: SYSTEM\CurrentControlSet\Control\Print\Monitors\Standard TCP/IP Port\Ports\yajhfc_batch_19101; ValueType: string; ValueName: "SNMP Community"; ValueData: "public"; Flags: uninsdeletekey
Root: HKLM; Subkey: SYSTEM\CurrentControlSet\Control\Print\Monitors\Standard TCP/IP Port\Ports\yajhfc_batch_19101; ValueType: dword;  ValueName: "SNMP Enabled"; ValueData: 0; Flags: uninsdeletekey
Root: HKLM; Subkey: SYSTEM\CurrentControlSet\Control\Print\Monitors\Standard TCP/IP Port\Ports\yajhfc_batch_19101; ValueType: dword;  ValueName: "SNMP Index"; ValueData: 1; Flags: uninsdeletekey

[Run]
Filename: cmd; Parameters: "/c echo Restarting spooler service, please wait... && net stop spooler && net start spooler"; StatusMsg: {cm:InstallingPrinterPort};
; Windows 2000+XP
Filename: rundll32; Parameters: "printui.dll,PrintUIEntry /if /b ""{cm:printername}"" /f {win}\inf\ntprint.inf /r ""yajhfc_batch_19101"" /m ""Apple LaserWriter 16/600 PS"""; StatusMsg: {cm:InstallingX,{cm:faxprinter}}; MinVersion: 0,5.0; OnlyBelowVersion: 0,6.0; Check: NoYajHFCPrinter;
; Windows Vista/7/8
Filename: rundll32; Parameters: "printui.dll,PrintUIEntry /if /b ""{cm:printername}"" /f {win}\inf\ntprint.inf /r ""yajhfc_batch_19101"" /m ""MS Publisher Color Printer"""; StatusMsg: {cm:InstallingX,{cm:faxprinter}}; MinVersion: 0,6.0; Check: NoYajHFCPrinter;

[UninstallRun]
Filename: rundll32; Parameters: "printui.dll,PrintUIEntry /dl /n ""{cm:printername}"""; RunOnceId: DeletePrinter; MinVersion: 0,5.0
Filename: cmd; Parameters: "/c echo Restarting spooler service, please wait... && net stop spooler && net start spooler"; RunOnceId: RestartSpooler;

[Components]
Name: Base; Description: Core plugin files; Flags: fixed; Types: custom compact full
;Name: Docs; Description: Documentation; Types: full

[Languages]
Name: en; MessagesFile: compiler:Default.isl
Name: de; MessagesFile: compiler:Languages\German.isl
Name: fr; MessagesFile: compiler:Languages\French.isl
Name: es; MessagesFile: compiler:Languages\Spanish.isl
Name: it; MessagesFile: compiler:Languages\Italian.isl
Name: pl; MessagesFile: compiler:Languages\Polish.isl
Name: ru; MessagesFile: compiler:Languages\Russian.isl
;Name: tr; MessagesFile: compiler:Languages\Turkish.isl

[CustomMessages]
; May be translated
printername=YajHFC batch fax printer

; English/Default text:

; begin translation keys
faxprinter=Fax Printer
InstallingX=Installing %1...
RemovingX=Removing %1...
InstallingPrinterPort=Installing printer port...
; end translation keys


[Code]

function NoYajHFCPrinter(): Boolean;
begin
	result := not RegKeyExists(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Control\Print\Printers\' + CustomMessage('printername'));
end;

procedure splitversion(ver: string; var major, minor, build: integer);
var
  p, p2, i: integer;
  s:string;
begin
    major:=0;
    minor:=0;
    build:=0;

    p := Pos('.', ver);
		if (p > 0) then
		begin
			major := strtointdef(copy(ver, 1, p-1), 0);
      s:= copy(ver, p+1, length(ver)-p);
      p2 := Pos('.', s);
      if (p2 > 0) then
		  begin
			  minor := strtointdef(copy(s, 1, p2-1), 0);
        for i:=p2+1 to length(s) do
        begin
          if (ord(s[i]) < ord('0')) or (ord(s[i]) > ord('9')) then
            break;
        end;
        if (i > p2+1) then
        begin
          build := strtointdef(copy(s, p2+1, i-p2-1), 0);
        end
      end
      else
      begin
        minor := strtointdef(s, 0)
      end;
		end
end;

function InitializeSetup(): Boolean;
var
  yajhfcver: string;
  ymaj, ymin, ybld, pmaj, pmin, pbld: integer;
begin
  if RegQueryStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\YajHFC', 'version', yajhfcver) then
	begin
    splitversion('{#VERSION}', pmaj, pmin, pbld);
    splitversion(yajhfcver, ymaj, ymin, ybld);
    if (ymaj = pmaj) and (ymin = pmin) and (ybld = pbld) then
    begin
      result := true;
    end
    else
    begin
      case MsgBox(
		  'The installed YajHFC version ' + yajhfcver + ' differs from the expected version {#VERSION}. This may cause problems.'#13#10#13#10
      'Install the plugin anyway?',
		  mbError, MB_YESNO) of
		IDYES:
			result := true;
		IDNO:
			result := false;
		end;
    end
  end
  else
  begin
    MsgBox('To install the YajHFC Batch Printer and Mail Plugin, the YajHFC main application must have been installed before.'#13#10#13#10
           'Please install YajHFC and try again.',
           mbCriticalError, MB_OK);
    result := false;
  end
end;
