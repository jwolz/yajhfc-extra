#ifndef VERSION
 #define public VERSION "0.5.1"
#endif
#ifndef FOPVersion
  #define public FOPVersion "0.1.7"
#endif
#define FOPDIR "..\..\..\..\build\fop-1.0"

[Files]
Source: ..\..\..\workspace\FOPPlugin\build\FOPPlugin.jar; DestDir: {app}; Components: base
Source: ..\..\..\workspace\FOPPlugin\dist\readme.odt; DestDir: {app}; Components: docs
Source: ..\..\..\workspace\FOPPlugin\dist\readme.pdf; DestDir: {app}; Components: base
Source: ..\..\..\workspace\FOPPlugin\dist\yajhfc-fo.cmd; DestDir: {app}; Components: base
Source: ..\..\..\workspace\FOPPlugin\dist\examples\cover.odt; DestDir: {app}\examples; Components: docs
Source: ..\..\..\workspace\FOPPlugin\dist\examples\SomeLogo.png; DestDir: {app}\examples; Components: docs
Source: ..\..\..\workspace\FOPPlugin\dist\examples\SomeLogoScaled.png; DestDir: {app}\examples; Components: docs
Source: {#FOPDIR}\build\fop.jar; DestDir: {app}\lib; Components: base

  #define FindHandle
  #define FindResult
;  #define ClassPath ""

  #sub ProcessFoundFile
    #define FileName FindGetFileName(FindHandle)
Source: {#FOPDIR}\lib\{#FileName}; DestDir: {app}\lib; Components: base
;	#define public ClassPath = ClassPath + "{app}\lib\" + FileName + ";"
  #endsub

  #for {FindHandle = FindResult = FindFirst(FOPDIR + "\lib\*.jar", 0); FindResult; FindResult = FindNext(FindHandle)} ProcessFoundFile
  #if FindHandle
    #expr FindClose(FindHandle)
  #endif

;  #define ClassPath = ClassPath + "{app}\lib\fop.jar"

[Setup]
AppCopyright=© 2005-2011 by Jonas Wolz
AppName=YajHFC FOP Plugin
AppVerName=YajHFC FOP Plugin {#FOPVersion} (for YajHFC {#VERSION})
;InfoBeforeFile=temp\README.txt
LicenseFile=..\..\..\workspace\FOPPlugin\COPYING
DefaultDirName={reg:HKLM\Software\YajHFC,instpath|{pf}\YajHFC}
DefaultGroupName=YajHFC
AppPublisher=Jonas Wolz
AppPublisherURL=http://www.yajhfc.de/
AppVersion={#FOPVersion}
AppID={{5EA2AC5F-7811-453D-96BC-678DD910B593}
UninstallDisplayIcon={app}\yajhfc.ico
UninstallDisplayName=YajHFC FOP Plugin {#FOPVersion} (for YajHFC {#VERSION})
OutputBaseFilename=Setup-FOPPlugin
ArchitecturesInstallIn64BitMode=x64
DisableDirPage=yes

[Icons]
Name: {group}\FOPPlugin README; Filename: {app}\readme.pdf

[Registry]
Root: HKLM; Subkey: Software\YajHFC; ValueType: string; ValueName: addLaunchArg.FOPplugin; ValueData: "--loadplugin=""{app}\FOPPlugin.jar"""; Flags: uninsdeletekeyifempty uninsdeletevalue
Root: HKLM; Subkey: Software\YajHFC; ValueType: string; ValueName: FOPplugin-version; ValueData: {#FOPVersion}; Flags: uninsdeletekeyifempty uninsdeletevalue

[Components]
Name: Base; Description: Core plugin files; Flags: fixed; Types: custom compact full
Name: Docs; Description: Documentation; Types: full

[Languages]
Name: en; MessagesFile: compiler:Default.isl
Name: de; MessagesFile: compiler:Languages\German.isl
Name: fr; MessagesFile: compiler:Languages\French.isl
Name: es; MessagesFile: compiler:Languages\Spanish.isl
Name: it; MessagesFile: compiler:Languages\Italian.isl
Name: pl; MessagesFile: compiler:Languages\Polish.isl
Name: ru; MessagesFile: compiler:Languages\Russian.isl
;Name: tr; MessagesFile: compiler:Languages\Turkish.isl

[Code]
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
    MsgBox('To install the YajHFC FOP plugin, the YajHFC main application must have been installed before.'#13#10#13#10
           'Please install YajHFC and try again.',
           mbCriticalError, MB_OK);
    result := false;
  end
end;
