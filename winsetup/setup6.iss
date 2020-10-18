#ifndef VERSION
 #define public VERSION "0.6.3"
#endif

#define APPNAME "YajHFC"
#define APPVERNAME APPNAME + " " + VERSION

#define ITEXT_DIR "..\..\..\..\java\lib\itext"
#define ITEXT_JAR "itextpdf-5.5.4.jar"

[Files]
Source: ..\..\..\workspace\yajhfc\build\yajhfc.jar; DestDir: {app}; Components: base
Source: ..\..\..\workspace\yajhfc\src\yajhfc\logo-large.png; DestDir: {app}; Components: base
Source: ..\..\..\workspace\yajhfc\doc\faq_es.pdf; DestDir: {app}; Components: docs
Source: ..\..\..\workspace\yajhfc\doc\faq_de.pdf; DestDir: {app}; Components: docs
Source: ..\..\..\workspace\yajhfc\doc\faq_fr.pdf; DestDir: {app}; Components: docs
Source: ..\..\..\workspace\yajhfc\doc\faq.pdf; DestDir: {app}; Components: docs
Source: ..\..\..\workspace\yajhfc\doc\faq_ru.pdf; DestDir: {app}; Components: docs
Source: ..\..\..\workspace\yajhfc\doc\faq_tr.pdf; DestDir: {app}; Components: docs

Source: ..\..\..\workspace\yajhfc\build\yajhfc.exe; DestDir: {app}; Components: base
Source: ..\..\..\workspace\yajhfc\build\yajhfc-printlaunch.exe; DestDir: {app}; Components: FaxPrinter/Redmon

; YajHFC console support
Source: ..\..\..\workspace\yajhfc-console\build\yajhfc-console.jar; DestDir: {app}; Components: console
Source: ..\..\..\workspace\yajhfc-console\build\cyajhfc.exe; DestDir: {app}; Components: console
Source: ..\..\..\workspace\yajhfc-console\dist\README.txt; DestName: README-cyajhfc.txt; DestDir: {app}; Components: console

; YajHFC PDF support
Source: ..\..\..\workspace\yajhfc-pdf-plugin\build\yajhfc-pdf-plugin.jar; DestDir: {app}; Components: pdf
Source: {#ITEXT_DIR}\{#ITEXT_JAR}; DestDir: {app}\lib; Components: pdf
Source: pdf-plugin.default; DestDir: {app}\settings.d; Components: pdf
Source: ..\..\..\workspace\yajhfc-pdf-plugin\dist\examples\cover.pdf; DestDir: {app}\examples; Components: pdf
Source: ..\..\..\workspace\yajhfc-pdf-plugin\dist\examples\cover-src.odt; DestDir: {app}\examples; Components: pdf
Source: ..\..\..\workspace\yajhfc-pdf-plugin\dist\doc\Creating_PDF_coverpages.pdf; DestDir: {app}; Components: pdf

; JNA
Source: ..\..\..\..\java\jna\jna.jar; DestDir: {app}\lib; DestName: jna.jar; Components: faxprinter/mfilemon libtiff
Source: {code:PlatformJarPath}; DestDir: {app}\lib; DestName: platform.jar; Flags: external; ExternalSize: 913435; Components: faxprinter/mfilemon

; Native libtiff
Source: ..\..\..\workspace\yajhfc-plugin-libtiff\build\yajhfc-plugin-libtiff.jar; DestDir: {app}; Components: libtiff
Source: ..\..\..\workspace\yajhfc-plugin-libtiff\dist\tiff-win32\libtiff.dll; DestDir: {app}\tiff-win32; Components: libtiff
Source: ..\..\..\workspace\yajhfc-plugin-libtiff\dist\tiff-win32\libtiff64.dll; DestDir: {app}\tiff-win32; Components: libtiff
Source: ..\..\..\workspace\yajhfc-plugin-libtiff\dist\tiff-win32\tiff2pdf.exe; DestDir: {app}\tiff-win32; Components: libtiff
Source: ..\..\..\workspace\yajhfc-plugin-libtiff\dist\tiff-win32\tiff2ps.exe; DestDir: {app}\tiff-win32; Components: libtiff
Source: ..\..\..\workspace\yajhfc-plugin-libtiff\dist\tiff-win32\README-tiff.txt; DestDir: {app}\tiff-win32; Components: libtiff
Source: tiff2pdf.cmd; DestDir: {app}\tiff-win32; Components: libtiff

; Redmon:
Source: redmon\enum.exe; DestDir: {app}\redmon; Components: FaxPrinter/Redmon
Source: redmon\FILE_ID.DIZ; DestDir: {app}\redmon; Components: FaxPrinter/Redmon
Source: redmon\LICENCE; DestDir: {app}\redmon; Components: FaxPrinter/Redmon
Source: redmon\README.TXT; DestDir: {app}\redmon; Components: FaxPrinter/Redmon
Source: redmon\redfile.exe; DestDir: {app}\redmon; Components: FaxPrinter/Redmon
Source: redmon\redmon32.dll; DestDir: {app}\redmon; Components: FaxPrinter/Redmon
Source: redmon\redmon64.dll; DestDir: {app}\redmon; Components: FaxPrinter/Redmon
Source: redmon\redmon.chm; DestDir: {app}\redmon; Components: FaxPrinter/Redmon
Source: redmon\redpr.exe; DestDir: {app}\redmon; Components: FaxPrinter/Redmon
Source: redmon\redrun.exe; DestDir: {app}\redmon; Components: FaxPrinter/Redmon
Source: redmon\setup64.exe; DestDir: {app}\redmon; Components: FaxPrinter/Redmon
Source: redmon\setup.exe; DestDir: {app}\redmon; Components: FaxPrinter/Redmon
Source: redmon\src.zip; DestDir: {app}\redmon; Components: FaxPrinter/Redmon
Source: redmon\unredmon64.exe; DestDir: {app}\redmon; Components: FaxPrinter/Redmon
Source: redmon\unredmon.exe; DestDir: {app}\redmon; Components: FaxPrinter/Redmon

; RedmonEE: 32bit files
Source: RedMonEE\Doc2Html.exe; DestDir: {app}\redmonee; Components: FaxPrinter/Redmonee
Source: RedMonEE\Enum.exe; DestDir: {app}\redmonee; Components: FaxPrinter/Redmonee
Source: RedMonEE\LICENCE; DestDir: {app}\redmonee; Components: FaxPrinter/Redmonee
Source: RedMonEE\readme.1st; DestDir: {app}\redmonee; Components: FaxPrinter/Redmonee
Source: RedMonEE\RedFile.exe; DestDir: {app}\redmonee; Components: FaxPrinter/Redmonee
Source: RedMonEE\RedMon.chm; DestDir: {app}\redmonee; Components: FaxPrinter/Redmonee
Source: RedMonEE\redmoncl.exe; DestDir: {app}\redmonee; Components: FaxPrinter/Redmonee
Source: RedMonEE\redmoncs.exe; DestDir: {app}\redmonee; Components: FaxPrinter/Redmonee
Source: RedMonEE\RedMonEE.pdf; DestDir: {app}\redmonee; Components: FaxPrinter/Redmonee
Source: RedMonEE\redmonfn.exe; DestDir: {app}\redmonee; Components: FaxPrinter/Redmonee
Source: RedMonEE\redmonnt.dll; DestDir: {app}\redmonee; Components: FaxPrinter/Redmonee
Source: RedMonEE\redmonS.exe; DestDir: {app}\redmonee; Components: FaxPrinter/Redmonee
Source: RedMonEE\redpr.exe; DestDir: {app}\redmonee; Components: FaxPrinter/Redmonee
Source: RedMonEE\redrun.exe; DestDir: {app}\redmonee; Components: FaxPrinter/Redmonee
Source: RedMonEE\RedRunEE.exe; DestDir: {app}\redmonee; Components: FaxPrinter/Redmonee
Source: RedMonEE\RedRunEE2.exe; DestDir: {app}\redmonee; Components: FaxPrinter/Redmonee
Source: RedMonEE\RedShell.exe; DestDir: {app}\redmonee; Components: FaxPrinter/Redmonee
Source: RedMonEE\RedShellW.exe; DestDir: {app}\redmonee; Components: FaxPrinter/Redmonee
Source: RedMonEE\RedSleep.exe; DestDir: {app}\redmonee; Components: FaxPrinter/Redmonee
Source: RedMonEE\Setup.exe; DestDir: {app}\redmonee; Components: FaxPrinter/Redmonee
Source: RedMonEE\UnRedmon.exe; DestDir: {app}\redmonee; Components: FaxPrinter/Redmonee
Source: submitanddelete.cmd; DestDir: {app}; Components: FaxPrinter/Redmonee

Source: ..\..\..\workspace\yajhfc\COPYING; DestDir: {app}; Components: base
Source: ..\..\..\workspace\yajhfc\LICENSE; DestDir: {app}; Components: base
Source: temp\README.txt; DestDir: {app}; Components: base
Source: temp\README_de.txt; DestDir: {app}; Components: docs
Source: temp\README_es.txt; DestDir: {app}; Components: docs
Source: temp\README_fr.txt; DestDir: {app}; Components: docs
Source: temp\README_ru.txt; DestDir: {app}; Components: docs
Source: temp\README_tr.txt; DestDir: {app}; Components: docs
Source: temp\README_it.txt; DestDir: {app}; Components: docs
;Source: w98info.txt; DestDir: {app}; OnlyBelowVersion: 0,5.0; Components: faxprinter/redmon faxprinter/redmonee; Tasks:
Source: ..\cover\Coverpage example.html; DestDir: {app}\examples; Components: docs
Source: ..\cover\SomeLogo.png; DestDir: {app}\examples; Components: docs

; Temp stuff
Source: c:\programme\istool\isxdl.dll; DestDir: {tmp}; Flags: dontcopy

; mfilemon stuff
;Source: ..\..\..\..\downloads\mfilemon-setup.exe; DestDir: {tmp}; Flags: deleteafterinstall; Components: faxprinter/mfilemon
Source: pipeprint.cmd; DestDir: {app}; Components: faxprinter/mfilemon
Source: mfilemon-named-pipe.override; DestDir: {app}\settings.d; Components: faxprinter/mfilemon

; JRE
Source: jre\*; DestDir: {app}\jre; Components: jre; Flags: recursesubdirs

[Dirs]
Name: "{app}\settings.d"

[Setup]
AppCopyright=© 2005-2012 by Jonas Wolz
AppName={#APPNAME}
AppVerName={#APPVERNAME}
InfoBeforeFile=temp\README.txt
LicenseFile=..\..\..\workspace\yajhfc\COPYING
DefaultDirName={pf}\YajHFC
DefaultGroupName=YajHFC
AppPublisher=Jonas Wolz
AppPublisherURL=http://www.yajhfc.de/
AppVersion={#VERSION}
AppID={{2B5B4C28-0B7E-45C8-AF23-9A1816E70911}
UninstallDisplayIcon={app}\yajhfc.exe
UninstallDisplayName={#APPVERNAME}
ArchitecturesInstallIn64BitMode=x64
OutputBaseFilename=yajhfc-setup

#define public AdditionalLaunchArgs=""

#define public LaunchEXEArgs="--l4j-dont-wait " + AdditionalLaunchArgs
#define public LaunchEXE="{app}\yajhfc.exe"

[Icons]
Name: {group}\{cm:YajHFCName}; Filename: {#LaunchEXE}; Parameters: "{#LaunchEXEArgs}"; WorkingDir: {app}; IconFilename: {app}\yajhfc.exe; IconIndex: 0; Components: base
Name: {group}\{cm:YajHFCName} ({cm:debugmode}); Filename: {#LaunchEXE}; Parameters: "{#LaunchEXEArgs} --debug --logfile=:prompt:"; WorkingDir: {app}; IconFilename: {app}\yajhfc.exe; IconIndex: 0; Components: base
Name: {commondesktop}\{cm:YajHFCName}; Filename: {#LaunchEXE}; Parameters: "{#LaunchEXEArgs}"; IconFilename: {app}\yajhfc.exe; IconIndex: 0; WorkingDir: {app}; Tasks: DesktopIcon
Name: {group}\Homepage; Filename: http://www.yajhfc.de/; Components: base
Name: {group}\FAQ; Filename: {app}\faq.pdf; Components: docs
Name: {group}\FAQ ({cm:French}); Filename: {app}\faq_fr.pdf; Components: docs
Name: {group}\FAQ ({cm:German}); Filename: {app}\faq_de.pdf; Components: docs
Name: {group}\FAQ ({cm:Russian}); Filename: {app}\faq_ru.pdf; Components: docs
Name: {group}\FAQ ({cm:Spanish}); Filename: {app}\faq_es.pdf; Components: docs
Name: {group}\FAQ ({cm:Turkish}); Filename: {app}\faq_tr.pdf; Components: docs
Name: {group}\How to create PDF cover pages; Filename: {app}\Creating_PDF_coverpages.pdf; Components: pdf
Name: {commonstartup}\{cm:YajHFCName}; Filename: {#LaunchEXE}; Parameters: "{#LaunchEXEArgs} --windowstate=T"; WorkingDir: {app}; IconFilename: {app}\yajhfc.exe; IconIndex: 0; Tasks: Autostart


[Registry]
Root: HKLM; Subkey: Software\YajHFC; ValueType: string; ValueName: instpath; ValueData: {app}; Flags: uninsdeletekey
Root: HKLM; Subkey: Software\YajHFC; ValueType: string; ValueName: jarfile; ValueData: yajhfc.jar; Flags: uninsdeletekey
Root: HKLM; Subkey: Software\YajHFC; ValueType: string; ValueName: version; ValueData: {#VERSION}; Flags: uninsdeletekey
Root: HKLM; Subkey: Software\YajHFC; ValueType: string; ValueName: printlaunchyajhfcparams; ValueData: "{#AdditionalLaunchArgs} --stdin"; Flags: uninsdeletekey; Components: faxprinter/redmon
Root: HKLM; Subkey: SYSTEM\CurrentControlSet\Control\Print\Monitors\{cm:redmonname}\Ports\YAJHFC:; Flags: uninsdeletekey dontcreatekey; Components: faxprinter/redmon faxprinter/redmonee
Root: HKLM; Subkey: SYSTEM\CurrentControlSet\Control\Print\Monitors\Multi File Port Monitor\Ports\YAJHFC:; Flags: uninsdeletekey dontcreatekey; Components: faxprinter/mfilemon

Root: HKLM; Subkey: Software\YajHFC; ValueType: string; ValueName: addLaunchArg.PDFplugin; ValueData: "--loadplugin=""{app}\yajhfc-pdf-plugin.jar"""; Flags: uninsdeletekeyifempty uninsdeletevalue; Components: pdf
Root: HKLM; Subkey: Software\YajHFC; ValueType: string; ValueName: addLaunchArg.libtiffplugin; ValueData: "--loadplugin=""{app}\yajhfc-plugin-libtiff.jar"""; Flags: uninsdeletekeyifempty uninsdeletevalue; Components: pdf

[INI]
Filename: {group}\Homepage.url; Section: InternetShortcut; Key: URL; String: http://www.yajhfc.de/

[Components]
Name: Base; Description: {cm:CoreApplicationFiles}; Flags: fixed; Types: custom compact full
Name: Docs; Description: {cm:Documentation}; Types: full
Name: FaxPrinter; Description: {cm:InstallFaxPrinter}; Types: full
Name: FaxPrinter/Redmon; Description: {cm:RedmonComponentDesc}; Types: full; Flags: exclusive
Name: FaxPrinter/RedmonEE; Description: {cm:RedmonEEComponentDesc}; Flags: exclusive
Name: FaxPrinter/mfilemon; Description: {cm:mfilemonComponentDesc}; Flags: exclusive
Name: Console; Description: {cm:ConsoleSupport}; Types: full
Name: PDF; Description: {cm:PDFSupport}; Types: full
Name: libtiff; Description: {cm:libtiff}; Types: full
Name: JRE; Description: {cm:JRE}; Types: full

[Tasks]
Name: DesktopIcon; Description: {cm:CreateDesktopIcon}; Components: base
Name: Autostart; Description: {cm:CreateAutostart}; Components: base
Name: GhostScript; Description: {cm:InstallGSTask}; Components: base

[Run]
Filename: rundll32; StatusMsg: {cm:RemovingX,{cm:faxprinter}}; Components: faxprinter/redmon faxprinter/redmonee faxprinter/mfilemon; Parameters: "printui.dll,PrintUIEntry /dl /n ""{cm:printername}"""; Check: RemoveOldPrinter; AfterInstall: RemoveYajHFCPort; MinVersion: 0,5.0
Filename: cmd; Parameters: "/c echo Restarting spooler service, please wait... && net stop spooler && net start spooler"; Components: faxprinter/redmon faxprinter/redmonee faxprinter/mfilemon; Check: RemoveOldPrinter;
Filename: {reg:HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Redirection Port Monitor,UninstallString|unredmon.exe}; WorkingDir: {sys}; StatusMsg: {cm:RemovingX,RedMon}; Components: FaxPrinter/Redmon FaxPrinter/RedmonEE; Check: RemoveOldPrinter; Parameters: /Q

Filename: {app}\redmon\setup.exe; WorkingDir: {app}\redmon; StatusMsg: {cm:InstallingX,RedMon}; Components: FaxPrinter/Redmon; Check: RedmonNotInstalled; Parameters: /Q
Filename: {app}\redmonee\setup.exe; WorkingDir: {app}\redmonee; StatusMsg: {cm:InstallingX,RedMonEE}; Components: FaxPrinter/RedmonEE; Check: RedmonNotInstalled; Parameters: /Q
Filename: {code:mfilemonSetupPath}; WorkingDir: {tmp}; StatusMsg: {cm:InstallingX,mfilemon}; Components: FaxPrinter/mfilemon; Check: mfilemonNotInstalled; Parameters: /SILENT
Filename: cmd; Parameters: "/c echo Restarting spooler service, please wait... && net stop spooler && net start spooler"; StatusMsg: {cm:InstallingPrinterPort}; Components: faxprinter/redmon faxprinter/redmonee faxprinter/mfilemon; BeforeInstall: InstallYajHFCPort();
; Windows 2000+XP
Filename: rundll32; Parameters: "printui.dll,PrintUIEntry /if /b ""{cm:printername}"" /f {win}\inf\ntprint.inf /r ""yajhfc:"" /m ""Apple LaserWriter 16/600 PS"""; Components: faxprinter/redmon faxprinter/redmonee faxprinter/mfilemon; StatusMsg: {cm:InstallingX,{cm:faxprinter}}; Check: NoYajHFCPrinter; MinVersion: 0,5.0; OnlyBelowVersion: 0,6.0
; Windows Vista/7/8/10
Filename: rundll32; Parameters: "printui.dll,PrintUIEntry /if /b ""{cm:printername}"" /f {win}\inf\ntprint.inf /r ""yajhfc:"" /m ""MS Publisher Color Printer"""; Components: faxprinter/redmon faxprinter/redmonee faxprinter/mfilemon; StatusMsg: {cm:InstallingX,{cm:faxprinter}}; Check: NoYajHFCPrinter; MinVersion: 0,6.0; 

; Windows Vista (alt)
;Filename: rundll32; Parameters: "printui.dll,PrintUIEntry /if /b ""{cm:printername}"" /f {win}\inf\ntprint.inf /r ""yajhfc:"" /m ""FX DP 305-AP PS"""; Components: faxprinter/redmon faxprinter/redmonee faxprinter/mfilemon; StatusMsg: {cm:InstallingX,{cm:faxprinter}}; Check: NoYajHFCPrinter; MinVersion: 0,6.0; OnlyBelowVersion: 0,6.01
; Windows 7 (alt)
;Filename: rundll32; Parameters: "printui.dll,PrintUIEntry /if /b ""{cm:printername}"" /f {win}\inf\ntprint.inf /r ""yajhfc:"" /m ""Xerox Phaser 6120 PS"""; Components: faxprinter/redmon faxprinter/redmonee faxprinter/mfilemon; StatusMsg: {cm:InstallingX,{cm:faxprinter}}; Check: NoYajHFCPrinter; MinVersion: 0,6.01; OnlyBelowVersion: 0,6.02
; Windows 8 (alt)
;Filename: rundll32; Parameters: "printui.dll,PrintUIEntry /if /b ""{cm:printername}"" /f {win}\inf\ntprint.inf /r ""yajhfc:"" /m ""MS Publisher Color Printer"""; Components: faxprinter/redmon faxprinter/redmonee faxprinter/mfilemon; StatusMsg: {cm:InstallingX,{cm:faxprinter}}; Check: NoYajHFCPrinter; MinVersion: 0,6.02; 

;Filename: {app}\w98info.txt; Flags: shellexec; OnlyBelowVersion: 0,5.0; Components: faxprinter/redmon faxprinter/redmonee
;Filename: {code:GSSetupPath}; Check: InstallGS; StatusMsg: {cm:InstallingX,GhostScript}; Parameters: -auto
Filename: {code:GSSetupPath}; Check: InstallGS; StatusMsg: {cm:InstallingX,GhostScript}; Parameters: /S


[UninstallRun]
Filename: rundll32; Components: faxprinter/redmon faxprinter/redmonee faxprinter/mfilemon; Parameters: "printui.dll,PrintUIEntry /dl /n ""{cm:printername}"""; RunOnceId: DeletePrinter; MinVersion: 0,5.0
Filename: reg; Components: faxprinter/redmon faxprinter/redmonee; Parameters: "delete ""HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\{cm:redmonname}\Ports\YAJHFC:"" /f"; RunOnceId: DeletePort; MinVersion: 0,5.0
Filename: reg; Components: faxprinter/mfilemon; Parameters: "delete ""HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\Multi File Port Monitor\YAJHFC:"" /f"; RunOnceId: DeletePort; MinVersion: 0,5.0
Filename: cmd; Parameters: "/c echo Restarting spooler service, please wait... && net stop spooler && net start spooler"; Components: faxprinter/redmon faxprinter/redmonee faxprinter/mfilemon; RunOnceId: RestartSpooler;
Filename: {reg:HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Redirection Port Monitor,UninstallString|unredmon.exe}; WorkingDir: {sys}; Components: FaxPrinter/Redmon FaxPrinter/RedmonEE; RunOnceId: RemoveRedmon;
[UninstallDelete]
Type: files; Name: {group}\Homepage.url
Type: files; Name: {app}\settings.d\path-settings.default


[CustomMessages]
; Do not translate redmonname
redmonname=Redirected Port

; May be translated
printername=YajHFC Fax
DebugMode=debug mode
YajHFCName=YajHFC fax client
RedmonComponentDesc=Redmon
RedmonEEComponentDesc=RedmonEE
mfilemonComponentDesc=mfilemon (Named Pipe)

; English/Default text:
; begin translation keys
InstallFaxPrinter=Install a fax printer
InstallingX=Installing %1...
RemovingX=Removing %1...
FaxPrinter=fax printer
CoreApplicationFiles=Core application files
Documentation=Documentation
JRE=Java runtime enviroment
InstallGSTask=Download and install GhostScript (if not already installed)
InstallTIFFTask=Download and install tiff2pdf (if not already installed)
PreserveDLMsg=Save downloaded files on the desktop?
RedmonEE32bitOnly=RedmonEE is only supported on 32bit versions of Windows.
RedmonEERecommended=On this version of Windows, using RedmonEE instead of Redmon is recommended.
mfilemonRecommended=On this version of Windows, using mfilemon instead of Redmon is recommended.
InstalledRedmonDiffers=The Redmon version already installed on this computer differs from the version you have selected for installation. Do you want setup to uninstall the already installed version? (If you select "No" YajHFC will continue to use the installed version.)
ConsoleSupport=Support for command line only mode
PDFSupport=Advanced PDF support (iText)
libtiff=Native libtiff support
CreateAutostart=Automatically start YajHFC on login
mfilemonWantsAutostart=You have selected the mfilemon (Named Pipe) fax printer option. Please note that for the fax printer to work YajHFC must be running when you print to it.
InstallingPrinterPort=Installing YAJHFC: port...
; end translation keys

; German translation:
; translation for: Support for command line only mode
de.ConsoleSupport=Unterstützung für Nur-Kommandozeilenmodus
; translation for: Core application files
de.CoreApplicationFiles=Zentrale Programmdateien
; translation for: Automatically start YajHFC on login
de.CreateAutostart=YajHFC automatisch beim Einloggen starten
; translation for: Documentation
de.Documentation=Dokumentation
; translation for: fax printer
de.FaxPrinter=Faxdrucker
; translation for: Install a fax printer
de.InstallFaxPrinter=Einen Faxdrucker installieren
; translation for: Download and install GhostScript (if not already installed)
de.InstallGSTask=GhostScript herunterladen und installieren (falls noch nicht installiert)
; translation for: Download and install tiff2pdf (if not already installed)
de.InstallTIFFTask=tiff2pdf herunterladen und installieren (falls noch nicht installiert)
; translation for: The Redmon version already installed on this computer differs from the version you have selected for installation. Do you want setup to uninstall the already installed version? (If you select "No" YajHFC will continue to use the installed version.)
de.InstalledRedmonDiffers=Die auf diesem Computer bereits installierte Redmon-Version weicht von der zur Installation ausgewählten ab. Möchten Sie, dass Setup die bereits installierte Version deinstalliert? (Wenn Sie "Nein" auswählen, wird YajHFC die bereits installierte Version weiterbenutzen.)
; translation for: Installing YAJHFC: port...
de.InstallingPrinterPort=Installiere YAJHFC: Druckeranschluß...
; translation for: Installing %1...
de.InstallingX=Installiere %1...
; translation for: Advanced PDF support (iText)
de.PDFSupport=Erweiterte PDF-Unterstützung (iText)
; translation for: Save downloaded files on the desktop?
de.PreserveDLMsg=Heruntergeladene Dateien auf dem Desktop speichern?
; translation for: RedmonEE is only supported on 32bit versions of Windows.
de.RedmonEE32bitOnly=RedmonEE wird nur auf 32bit-Versionen von Windows unterstützt.
; translation for: On this version of Windows, using RedmonEE instead of Redmon is recommended.
de.RedmonEERecommended=Auf dieser Version von Windows wird empfohlen, RedmonEE anstatt von Redmon zu verwenden.
; translation for: Removing %1...
de.RemovingX=Entferne %1...
; translation for: On this version of Windows, using mfilemon instead of Redmon is recommended.
de.mfilemonRecommended=Auf dieser Windows-Version wird die Verwendung von mfilemon statt Redmon empfohlen.
; translation for: You have selected the mfilemon (Named Pipe) fax printer option. Please note that for the fax printer to work YajHFC must be running when you print to it.
de.mfilemonWantsAutostart=Sie haben die "mfilemon (Named Pipe)"-Faxdruckeroption ausgewählt. Bitte beachten Sie: Damit der Faxdrucker funktioniert, muss YajHFC laufen, während Sie auf den Faxdrucker drucken.
de.libtiff=Unterstützung für native libtiff

; Spanish translation:
; translation for: Support for command line only mode
es.ConsoleSupport=Soporte para el modo de sólo línea de comandos
; translation for: Core application files
es.CoreApplicationFiles=Archivos principales de la aplicación
; translation for: Automatically start YajHFC on login
es.CreateAutostart=Iniciar automáticamente YajHFC al inicio de sesión
; translation for: Documentation
es.Documentation=Documentación
; translation for: fax printer
es.FaxPrinter=impresora de faxes
; translation for: Install a fax printer
es.InstallFaxPrinter=Instalar una impresora de faxes
; translation for: Download and install GhostScript (if not already installed)
es.InstallGSTask=Descargar e instalar GhostScript (si no se encuentra instalado)
; translation for: Download and install tiff2pdf (if not already installed)
es.InstallTIFFTask=Descargar e instalar tiff2pdf (si no se encuentra instalado)
; translation for: The Redmon version already installed on this computer differs from the version you have selected for installation. Do you want setup to uninstall the already installed version? (If you select "No" YajHFC will continue to use the installed version.)
es.InstalledRedmonDiffers=La versión de Redmon que se encuentra instalada en el sistema no coincide con la versión que ha seleccionado para instalar. ¿Desea que el asistente elimine la versión que se encuentra instalada? (si selecciona "No" YajHFC seguirá utilizando la versión instalada.)
; translation for: Installing YAJHFC: port...
es.InstallingPrinterPort=Instalando YajHFC: puerto...
; translation for: Installing %1...
es.InstallingX=Instalando %1...
; translation for: Advanced PDF support (iText)
es.PDFSupport=Soporte avanzado de PDF (iText)
; translation for: Save downloaded files on the desktop?
es.PreserveDLMsg=¿Guardar los archivos descargados en el escritorio?
; translation for: RedmonEE is only supported on 32bit versions of Windows.
es.RedmonEE32bitOnly=RedmonEE sólo está disponible para versiones Windows de 32 bits.
; translation for: On this version of Windows, using RedmonEE instead of Redmon is recommended.
es.RedmonEERecommended=En esta versión de Windows se recomienda que utilice RedmonEE en lugar de Redmon.
; translation for: Removing %1...
es.RemovingX=Eliminando %1...
; translation for: Native libtiff support
es.libtiff=Soporte nativo de libtiff
; translation for: On this version of Windows, using mfilemon instead of Redmon is recommended.
es.mfilemonRecommended=En esta versión de Windows se recomienda que utilice mfilemon en lugar de Redmon.
; translation for: You have selected the mfilemon (Named Pipe) fax printer option. Please note that for the fax printer to work YajHFC must be running when you print to it.
es.mfilemonWantsAutostart=Ha seleccionado la opción de impresora de faxes mfilemon (tubería con nombre). Tenga en cuenta que para que funcione la impresora de faxes YajHFC debe estar ejecutándose cuando imprima.

; Polish translation
pl.InstallFaxPrinter=Zainstaluj drukarkę faksów
pl.InstallingX=Zainstalowano %1...
pl.FaxPrinter=Drukarka faksów
pl.CoreApplicationFiles=Główne pliki aplikacji
pl.Documentation=Dokumentacja
pl.InstallGSTask=Pobierz i zainstaluj GhostScript (jeżeli nie zainstalowany)
pl.InstallTIFFTask=Pobierz i zainstaluj tiff2pdf (jeżeli nie zainstalowany)
pl.PreserveDLMsg=Zapisać pobrane pliki na pulpicie?

; Italian translation:
; translation for: Support for command line only mode
it.ConsoleSupport=Supporto per l'utilizzo esclusivo da linea di comando
; translation for: Core application files
it.CoreApplicationFiles=File applicativi di base
; translation for: Automatically start YajHFC on login
it.CreateAutostart=Avvia YajHFC automaticamente al login
; translation for: Documentation
it.Documentation=Documentazione
; translation for: fax printer
it.FaxPrinter=stampante fax
; translation for: Install a fax printer
it.InstallFaxPrinter=Installa una stampante fax
; translation for: Download and install GhostScript (if not already installed)
it.InstallGSTask=Scarica e installa GhostScript (se non già installato)
; translation for: Download and install tiff2pdf (if not already installed)
it.InstallTIFFTask=Scarica e installa tiff2pdf (se non già installato)
; translation for: The Redmon version already installed on this computer differs from the version you have selected for installation. Do you want setup to uninstall the already installed version? (If you select "No" YajHFC will continue to use the installed version.)
it.InstalledRedmonDiffers=La versione di Redmon attualmente installata su questo computer differisce dalla versione selezionata per l'installazione. Si vuole disinstallare automaticamente la versione attualmente installata? (Se si seleziona "No" YajHFC continuerà ad usare la versione attualmente installata.)
; translation for: Installing YAJHFC: port...
it.InstallingPrinterPort=Installazione YajHFC: porta...
; translation for: Installing %1...
it.InstallingX=Installazione %1...
; translation for: Advanced PDF support (iText)
it.PDFSupport=Supporto PDF avanzato (iText)
; translation for: Save downloaded files on the desktop?
it.PreserveDLMsg=Salvare sul Desktop i file scaricati?
; translation for: RedmonEE is only supported on 32bit versions of Windows.
it.RedmonEE32bitOnly=RedMonEE è supportato solo su versioni Windows a 32 bit.
; translation for: On this version of Windows, using RedmonEE instead of Redmon is recommended.
it.RedmonEERecommended=Su questa versione di Windows è consigliato l'uso di RedmonEE al posto di Redmon.
; translation for: Removing %1...
it.RemovingX=Rimozione %1...
; translation for: Native libtiff support
it.libtiff=Supporto nativo libtiff
; translation for: On this version of Windows, using mfilemon instead of Redmon is recommended.
it.mfilemonRecommended=Su questa versione di Windows è consigliato l'uso di mfilemon al posto di Redmon.
; translation for: You have selected the mfilemon (Named Pipe) fax printer option. Please note that for the fax printer to work YajHFC must be running when you print to it.
it.mfilemonWantsAutostart=E' stata selezionata l'opzione mfilemon (Named Pipe) per la stampante fax. Tenere presente che per il funzionamento della stampante fax è necessario che YajHFC sia in funzione quando si stampa su essa.

; French translation:
fr.InstallFaxPrinter=Installer une imprimante Fax
fr.InstallingX=Installation %1...
fr.FaxPrinter=imprimante fax
fr.CoreApplicationFiles=Fichier application (Core)
fr.Documentation=Documentation
fr.InstallGSTask=Téléchargement et installation de GhostScript (Si pas déjà installé)
fr.InstallTIFFTask=Téléchargement et installation de tiff2pdf (Si pas déjà installé)
fr.PreserveDLMsg=Enregistrer les fichiers téléchargés sur le bureau?

; Russian translation:
; translation for: Support for command line only mode
ru.ConsoleSupport=Поддержка режима командной строки
; translation for: Core application files
ru.CoreApplicationFiles=Базовые компоненты программы
; translation for: Automatically start YajHFC on login
ru.CreateAutostart=Автоматически запускать YajHFC при входе в систему
; translation for: Documentation
ru.Documentation=Документация
; translation for: fax printer
ru.FaxPrinter=факс-принтер
; translation for: Install a fax printer
ru.InstallFaxPrinter=Установить факс-принтер
; translation for: Download and install GhostScript (if not already installed)
ru.InstallGSTask=Загрузить и установить GhostScript (если еще не установлен)
; translation for: Download and install tiff2pdf (if not already installed)
ru.InstallTIFFTask=Загрузить и установить tiff2pdf (если еще не установлен)
; translation for: The Redmon version already installed on this computer differs from the version you have selected for installation. Do you want setup to uninstall the already installed version? (If you select "No" YajHFC will continue to use the installed version.)
ru.InstalledRedmonDiffers=Установленная на этом компьютере версия Redmon отличается от версии, выбранной Вами для установки. Хотите ли Вы, чтобы программа установки удалила установленную версию? (Если Вы выберете "Нет", YajHFC будет использовать установленную версию.)
; translation for: Installing YAJHFC: port...
ru.InstallingPrinterPort=Устанавливается YAJHFC: порт...
; translation for: Installing %1...
ru.InstallingX=Устанавливается %1...
; translation for: Advanced PDF support (iText)
ru.PDFSupport=Расширенная поддержка PDF (iText)
; translation for: Save downloaded files on the desktop?
ru.PreserveDLMsg=Сохранить загруженные файлы на рабочем столе?
; translation for: RedmonEE is only supported on 32bit versions of Windows.
ru.RedmonEE32bitOnly=RedmonEE поддерживается только в 32bit версиях Windows.
; translation for: On this version of Windows, using RedmonEE instead of Redmon is recommended.
ru.RedmonEERecommended=Для этой версии Windows рекомендуется использовать RedmonEE вместо Redmon.
; translation for: Removing %1...
ru.RemovingX=Удаляется %1...
; translation for: Native libtiff support
ru.libtiff=Встроенная поддержка libtiff
; translation for: On this version of Windows, using mfilemon instead of Redmon is recommended.
ru.mfilemonRecommended=Для этой версии Windows рекомендуется использовать mfilemon вместо Redmon.
; translation for: You have selected the mfilemon (Named Pipe) fax printer option. Please note that for the fax printer to work YajHFC must be running when you print to it.
ru.mfilemonWantsAutostart=Вы выбрали mfilemon (Именованную Трубу) в качестве факс-принтера. Имейте ввиду, что для работы факс-принтера необходимо, чтобы во время печати был запущле?



; Native names for the languages (so do not translate them either):
German=Deutsch
English=English
Spanish=Español
French=Français
Turkish=Türkçe
Russian=Русский

[Languages]
Name: en; MessagesFile: compiler:Default.isl
Name: de; MessagesFile: compiler:Languages\German.isl; InfoBeforeFile: temp\README_de.txt
Name: fr; MessagesFile: compiler:Languages\French.isl; InfoBeforeFile: temp\README_fr.txt
Name: es; MessagesFile: compiler:Languages\Spanish.isl; InfoBeforeFile: temp\README_es.txt
Name: it; MessagesFile: compiler:Languages\Italian.isl; InfoBeforeFile: temp\README_it.txt
Name: pl; MessagesFile: compiler:Languages\Polish.isl
Name: ru; MessagesFile: compiler:Languages\Russian.isl; InfoBeforeFile: temp\README_ru.txt
;Name: tr; MessagesFile: compiler:Languages\Turkish.isl; InfoBeforeFile: temp\README_tr.txt

[Code]
var bInstallGS: boolean;
    bInstallTIFF: boolean;
    sGSSetupPath: string;
    smfilemonSetupPath: string;
    sPlatformJarPath: string;
    preserveDownload: integer;
    bRemoveOldPrinter: boolean;
    printerExists: boolean;
const
    ghostscript32path = 'http://download.yajhfc.de/redirect/gsw32setup-newest.exe';
    ghostscript64path = 'http://download.yajhfc.de/redirect/gsw64setup-newest.exe';
    mfilemonURL = 'http://download.yajhfc.de/redirect/mfilemon-setup-newest.exe';
    platformjarURL = 'http://download.yajhfc.de/misc/jna/platform.jar';
    
    ghostscriptdllkey = 'SOFTWARE\GPL Ghostscript';
    setupsigold = '# Auto-generated by YajHFC setup. Remove this line if you manually edit this file, else it will get overwritten on a update';
    setupsig = '# Auto-generated by YajHFC setup. Do not edit this file!';

function InitializeSetup(): Boolean;
begin
  bInstallGS := false;
  bInstallTIFF := false;
  bRemoveOldPrinter := false;
  preserveDownload := -1;
  printerExists := RegKeyExists(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Control\Print\Printers\' + CustomMessage('printername'));

  result := true;
end;

function RedmonNotInstalled(): Boolean;
begin
	result := not RegKeyExists(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Control\Print\Monitors\' + CustomMessage('redmonname'));
end;

function mfilemonNotInstalled(): Boolean;
begin
	result := not RegKeyExists(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Control\Print\Monitors\Multi File Port Monitor');
end;

function NoYajHFCPrinter(): Boolean;
begin
	result := not printerExists;
end;

// Install port for "normal" Redmon
procedure InstallYajHFCPortNormal();
var redmonkey, portkey: string;
begin
	redmonkey := 'SYSTEM\CurrentControlSet\Control\Print\Monitors\' + CustomMessage('redmonname');
	if not RegKeyExists(HKEY_LOCAL_MACHINE, redmonkey) then
	begin
		MsgBox('Could not create a redirected port for YajHFC (Redmon not correctly installed).', mbError, MB_OK);
		exit;
	end;

	portkey := redmonkey + '\Ports\YAJHFC:';
	if RegKeyExists(HKEY_LOCAL_MACHINE, portkey) then
		Log('YAJHFC: port seems to already exist. Continuing anyway...'); // Port already created ??

	RegWriteStringValue(HKEY_LOCAL_MACHINE, portkey, 'Description', 'YajHFC Redirected Port');
	RegWriteStringValue(HKEY_LOCAL_MACHINE, portkey, 'Command', ExpandConstant('{app}\yajhfc-printlaunch.exe'));
	RegWriteStringValue(HKEY_LOCAL_MACHINE, portkey, 'Arguments', '');
	RegWriteStringValue(HKEY_LOCAL_MACHINE, portkey, 'Printer', '');
	RegWriteStringValue(HKEY_LOCAL_MACHINE, portkey, 'LogFileName', ExpandConstant('{app}\yajhfc-redmon.log'));
	RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'Output', 0);
	RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'ShowWindow', 0);
	RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'RunUser', 1);
	RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'Delay', 1200);
	RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'LogFileUse', 0);
	RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'LogFileDebug', 0);
	RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'PrintError', 0);
end;

// Install port for RedmonEE
procedure InstallYajHFCPortEE();
var redmonkey, portkey: string;
begin
	redmonkey := 'SYSTEM\CurrentControlSet\Control\Print\Monitors\' + CustomMessage('redmonname');
	if not RegKeyExists(HKEY_LOCAL_MACHINE, redmonkey) then
	begin
		MsgBox('Could not create a redirected port for YajHFC (RedmonEE not correctly installed).', mbError, MB_OK);
		exit;
	end;

	portkey := redmonkey + '\Ports\YAJHFC:';
	if RegKeyExists(HKEY_LOCAL_MACHINE, portkey) then
		Log('YAJHFC: port seems to already exist. Continuing anyway...'); // Port already created ??

	RegWriteStringValue(HKEY_LOCAL_MACHINE, portkey, 'Description', 'YajHFC Redirected Port');
	RegWriteStringValue(HKEY_LOCAL_MACHINE, portkey, 'Command', '');
	RegWriteStringValue(HKEY_LOCAL_MACHINE, portkey, 'Arguments', '');
  RegWriteStringValue(HKEY_LOCAL_MACHINE, portkey, 'AfterworksCommand', '"' + ExpandConstant('{app}\submitanddelete.cmd') + '"');
  RegWriteStringValue(HKEY_LOCAL_MACHINE, portkey, 'AfterworksArguments', '%s');
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'Output', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'ShowWindow', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'RunUser', 1);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'StartShell', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'ServerRunning', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'Delay', 1200);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'DebugLevel', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'LogFileUse', 0);
	RegWriteStringValue(HKEY_LOCAL_MACHINE, portkey, 'LogFileName', ExpandConstant('{app}\yajhfc-redmonee.log'));
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'LogFileDebug', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'LogOmitPrintCode', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'PrintError', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'CleanUpDocNames', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'LogOmitPrintCode', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'DefaultFileName', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'UseRunDll32', 0);
	RegWriteStringValue(HKEY_LOCAL_MACHINE, portkey, 'ExternalSaveAs', '');
  RegWriteStringValue(HKEY_LOCAL_MACHINE, portkey, 'FilenameTemplate', '');
  RegWriteStringValue(HKEY_LOCAL_MACHINE, portkey, 'DefaultExtension', '');
  RegWriteStringValue(HKEY_LOCAL_MACHINE, portkey, 'ServerProgram', '');
  RegWriteStringValue(HKEY_LOCAL_MACHINE, portkey, 'ServerPgmParam', '');
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'UseRPC', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'RPCDefaultProtocol', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'RPCUseDefaultPort', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'RPCSendError', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'RPCFileTransfer', 0);
  RegWriteStringValue(HKEY_LOCAL_MACHINE, portkey, 'ServerAccountLog', '');
  RegWriteStringValue(HKEY_LOCAL_MACHINE, portkey, 'SpoolDirectory', '%TEMP%');
  RegWriteStringValue(HKEY_LOCAL_MACHINE, portkey, 'SpoolTemplate', '%REDMON_USER%-%c-%t-%n.ps');
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'SpoolFiles', 1);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'SpoolNoRedirect', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'SpoolAsUser', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'SpoolDelete', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'PDFLevel', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'Encrypt', 0);
  RegWriteStringValue(HKEY_LOCAL_MACHINE, portkey, 'OwnerPassword', '');
  RegWriteStringValue(HKEY_LOCAL_MACHINE, portkey, 'UserPassword', '');
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'DisableAll', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'PromptSecOptions', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'DisablePrint', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'DisableModify', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'DisableCopy', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'DisableAnnotations', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'DisableExtract', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'DisableAssemble', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'DisableHQPrint', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'PriorityPrim', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'PrioritySec', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'FileNumber', 0);
end;

// Install port for mfilemon
procedure InstallYajHFCPortMFileMon();
var mfkey, portkey: string;
begin
	mfkey := 'SYSTEM\CurrentControlSet\Control\Print\Monitors\Multi File Port Monitor';
	if not RegKeyExists(HKEY_LOCAL_MACHINE, mfkey) then
	begin
		MsgBox('Could not create a port for YajHFC (mfilemon not correctly installed).', mbError, MB_OK);
		exit;
	end;

	portkey := mfkey + '\YAJHFC:';
	if RegKeyExists(HKEY_LOCAL_MACHINE, portkey) then
		Log('YAJHFC: port seems to already exist. Continuing anyway...'); // Port already created ??

	RegWriteStringValue(HKEY_LOCAL_MACHINE, portkey, 'ExecPath', ExpandConstant('{win}\Temp'));
	RegWriteStringValue(HKEY_LOCAL_MACHINE, portkey, 'FilePattern', 'yajhfc-%u-%i.tmp');
	RegWriteStringValue(HKEY_LOCAL_MACHINE, portkey, 'OutputPath', ExpandConstant('{win}\Temp'));
  RegWriteStringValue(HKEY_LOCAL_MACHINE, portkey, 'UserCommand', ExpandConstant('{cmd} /c "{app}\pipeprint.cmd"') + ' %f : yajhfc-%u');
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'Overwrite', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'PipeData', 0);
  RegWriteDWordValue(HKEY_LOCAL_MACHINE, portkey, 'WaitTermination', 0);
end;

// Detects which version of Redmon is installed
// 0: No Redmon installed
// 1: "Normal" Redmon installed
// 2: Redmon EE installed
// 3: Unknown Redmon installed
function DetectInstalledRedmonVersion(): integer;
begin
  if RedmonNotInstalled then
    result := 0
  else
  begin
    //TODO: Find a better algorithm here...
    if FileExists(ExpandConstant('{sys}\redmon.hlp')) 
    or FileExists(ExpandConstant('{sys}\redmon32.dll')) 
    or FileExists(ExpandConstant('{sys}\redmon64.dll')) then
      result := 1
    else if FileExists(ExpandConstant('{sys}\redmon.chm')) then
      result := 2
    else
      result := 3;
  end;
end;

procedure RemoveYajHFCPort();
begin
  RegDeleteKeyIncludingSubkeys(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Control\Print\Monitors\' + CustomMessage('redmonname') + '\Ports\YAJHFC:');
  RegDeleteKeyIncludingSubkeys(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Control\Print\Monitors\Multi File Port Monitor\YAJHFC:');
end;

procedure InstallYajHFCPort();
begin
  RemoveYajHFCPort;
  if IsComponentSelected('faxprinter/mfilemon') then
    InstallYajHFCPortMFileMon()
  else
    if (DetectInstalledRedmonVersion() = 2) then
      InstallYajHFCPortEE()
    else
      InstallYajHFCPortNormal();
end;

function IsTerminalServer(): boolean;
var winver: TWindowsVersion;
begin
   GetWindowsVersionEx(winver);
   result := (winver.ProductType = VER_NT_DOMAIN_CONTROLLER) or
             (winver.ProductType = VER_NT_SERVER) or
             ((winver.SuiteMask and (VER_SUITE_TERMINAL or VER_SUITE_SMALLBUSINESS or VER_SUITE_SMALLBUSINESS_RESTRICTED)) <> 0);
end;

function IsRedmonEERecommended(): boolean;
begin
   result := IsTerminalServer and not IsWin64;
end;

function IsMfilemonRecommended(): boolean;
begin
   result := IsTerminalServer and IsWin64;   
end;

function RemoveOldPrinter(): boolean;
begin
  result := bRemoveOldPrinter;
end;

procedure isxdl_AddFile(URL, Filename: PAnsiChar);
external 'isxdl_AddFile@files:isxdl.dll stdcall';
function isxdl_DownloadFiles(hWnd: Integer): Integer;
external 'isxdl_DownloadFiles@files:isxdl.dll stdcall';
function isxdl_SetOption(Option, Value: PAnsiChar): Integer;
external 'isxdl_SetOption@files:isxdl.dll stdcall';

function InstallGS(): boolean;
begin
  result := bInstallGS;
end;
function GSSetupPath(Param: String): string;
begin
  result := sGSSetupPath;
end;
function mfilemonSetupPath(Param: String): string;
begin
  result := smfilemonSetupPath;
end;
function platformJarPath(Param: String): string;
begin
  result := sPlatformJarPath;
end;

// Return value: 1 needed, 0 not needed, -10000 do not download
function isDownloadNeeded(var setupPath: string; downloadURL: string): integer;
var
  exeName: string;
begin
  result := 0;
  exeName := ExtractFileName(downloadURL);
  setupPath := ExpandConstant('{src}\' + exeName);
	if not FileExists(setupPath) then
	begin
		setupPath := ExpandConstant('{userdesktop}\' + exeName);
		if not FileExists(setupPath) then
		begin
		  setupPath := ExpandConstant('{tmp}\' + exeName);
		  if not FileExists(setupPath) then
		  begin
		   result := 1;

		   if preserveDownload = -1 then
		   begin
		       case MsgBox(CustomMessage('PreserveDLMsg'), mbConfirmation, MB_YESNOCANCEL) of
           IDYES:
		          preserveDownload := 1;
		       IDNO:
  		        preserveDownload := 0;
		       else
	   	        result := -10000;
		       end;
		   end;

		   if result = 1 then
       begin
  		   if preserveDownload = 1 then
	   	     setupPath := ExpandConstant('{userdesktop}\' + exeName);

		  	 isxdl_AddFile(downloadURL, setupPath);
		   end;
		  end
		end
	end
end;

function getGSEXE2(const RootKey: integer): string;
var
  path: string;
  subkeys: TArrayOfString;
  i: integer;
begin
  result := '';
  if RegGetSubkeyNames(RootKey, ghostscriptdllkey, subkeys) then
  begin
    // Test if any of the keys exist starting from the back to hopefully get newer versions first
    for I := GetArrayLength(subkeys)-1 downto 0 do
    begin
      if RegQueryStringValue(RootKey, ghostscriptdllkey + '\' + subkeys[i], 'GS_DLL', path) then
      begin
        result := extractFileDir(path) + '\gswin32c.exe';
        if FileExists(result) then
        begin
           log('Found GhostScript at: ' + result);
           exit;
        end
        else
          if is64BitInstallMode() then
          begin
              result := extractFileDir(path) + '\gswin64c.exe'
              if FileExists(result) then
              begin
                log('Found GhostScript at: ' + result);
                exit;
              end;
          end;
      end;
    end;
  end;
end;

function getGSEXE(): string;
begin
  result := getGSEXE2(HKEY_LOCAL_MACHINE);
  if Is64BitInstallMode() then
     if (result = '') or not FileExists(result) then
       result := getGSEXE2(HKEY_LOCAL_MACHINE_32);
end;

function getTIFFEXE(): string;
begin
  result := ExpandConstant('{app}\tiff-win32\tiff2pdf.cmd');
end;

function DownloadFiles(): boolean;
var
  hWnd: Integer;
  path: string;
  gsURL: string;
  downloadNeeded: integer;
begin
    downloadNeeded := 0;

    if (IsTaskSelected('GhostScript')) then
    begin
      bInstallGS := true;
      path := getGSEXE();
      if path <> '' then
        if FileExists(path) then
        begin
          bInstallGS := false;
          log('Found Ghostscript: ' + path);
        end;
    end
    else
      bInstallGS := false;

    if bInstallGS then
    begin
      if Is64bitInstallMode() then
        gsURL := ghostscript64path
      else
        gsURL := ghostscript32path;

      downloadNeeded := downloadNeeded + isDownloadNeeded(sGSSetupPath, gsURL);
    end;


    if IsComponentSelected('faxprinter/mfilemon') and (downloadNeeded >= 0) then
    begin
      if mfilemonNotInstalled then
         downloadNeeded := downloadNeeded + isDownloadNeeded(sMfilemonSetupPath, mfilemonURL);

      if (downloadNeeded >= 0) then
        downloadNeeded := downloadNeeded + isDownloadNeeded(sPlatformJarPath, PlatformJarURL);
    end;

		// don't try to init isxdl if it's not needed because it will error on < ie 3

		if downloadNeeded >= 1 then
			begin
				hWnd := StrToInt(ExpandConstant('{wizardhwnd}'));
				//isxdl_SetOption('label', 'Downloading Ghost');
				//isxdl_SetOption('description', 'This program needs to install the Microsoft .NET Framework 2.0. Please wait while Setup is downloading extra files to your computer.');
				if isxdl_DownloadFiles(hWnd) = 0 then Result := false;
			end;

		result := (downloadNeeded >= 0);
end;

procedure WriteSettingsDefault();
var
  tiffExe, gsExe: string;
  settingsFile: string;
  haveTIFFAndGS: boolean;
  lines: TArrayOfString;
begin
  tiffExe := getTIFFExe();
  gsExe := getGSExe();
  haveTIFFAndGS := true;

  // Check if there is a pre-0.5.2 settings file around...
  settingsFile := ExpandConstant('{app}\settings.default');
  if fileExists(settingsFile) then
  begin
    loadStringsFromFile(settingsFile, lines);
    if lines[0] = setupsigold then
      DeleteFile(settingsFile);
  end;

  settingsFile := ExpandConstant('{app}\settings.d\path-settings.default');

  log('Writing settings.default...');
  setArrayLength(lines, 6);
  lines[0] := setupsig;
  if (tiffExe <> '') and fileexists(tiffExe) then
  begin
    StringChangeEx(tiffExe, '\', '\\', true);
    StringChangeEx(tiffExe, ':', '\:', true);
    lines[1] := 'tiff2PDFLocation=' + tiffExe;
  end
  else if (not IsComponentSelected('pdf')) then
    haveTIFFAndGS := false; // iText gives an alternate conversion method

  if (gsExe <> '') and fileexists(gsExe) then
  begin
    StringChangeEx(gsExe, '\', '\\', true);
    StringChangeEx(gsExe, ':', '\:', true);
    lines[2] := 'ghostScriptLocation=' + gsExe;
  end
  else
    haveTIFFAndGS := false;

  if haveTIFFAndGS then
  begin
    lines[3] := 'createSingleFilesForViewing=true';
    lines[4] := 'alwaysCreateTargetFormat=true';
    lines[5] := 'multiFileSendMode=EXCEPT_COVER';
    saveStringsToFile(settingsFile, lines, true);
    log('settings.default written.');
  end
  else
    log('settings.default NOT written.');
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then
  begin
    WriteSettingsDefault();
  end;
end;

function NextButtonClick(CurPage: Integer): Boolean;
var installedRedmonVer: integer;
begin
  result := true;

  //*********************************************************************************
  // Only run this at the "Ready To Install" wizard page.
  //*********************************************************************************
  case CurPage of
  wpReady:
      result := downloadFiles();
  wpSelectTasks:
      begin
        if IsComponentSelected('faxprinter/mfilemon') and not IsTaskSelected('Autostart') then
        begin
          MsgBox(CustomMessage('mfilemonWantsAutostart'), mbInformation, MB_OK);
        end;
      end;
  wpSelectComponents:
    begin
      if IsComponentSelected('faxprinter/redmonee') then
      begin
        if IsWin64 then
        begin
          MsgBox(CustomMessage('RedmonEE32bitOnly'), mbError, MB_OK);
          result := false;
        end;
      end
      else if IsComponentSelected('faxprinter/redmon') then
      begin
        if IsRedmonEERecommended then
        begin
          MsgBox(CustomMessage('RedmonEERecommended'), mbInformation, MB_OK);
        end
        else if IsMfilemonRecommended then
        begin
          MsgBox(CustomMessage('mfilemonRecommended'), mbInformation, MB_OK);
        end;
      end;
      if result then
      begin
        bRemoveOldPrinter := false;
        installedredmonver := DetectInstalledRedmonVersion;
        log('Found installed Redmon version of ' + IntToStr(installedredmonver));
        if installedredmonver > 0 then //Some redmon version already installed
        begin
          if ((installedRedmonVer <> 1) and IsComponentSelected('faxprinter/redmon'))   or
             ((installedRedmonVer <> 2) and IsComponentSelected('faxprinter/redmonee')) then
          begin
             if MsgBox(CustomMessage('InstalledRedmonDiffers'), mbConfirmation, MB_YESNO) = IDYES then
              bRemoveOldPrinter := true;
          end;
        end;
      end;
    end;
  end;
end;

procedure CheckComponent(const componentDescription: string);
var i: integer;
begin
  for i:=0 to wizardform.ComponentsList.Items.Count-1 do
  begin
    if wizardform.componentslist.itemcaption[i] = componentDescription then
    begin
      wizardform.componentslist.checked[i] := true;
      exit;
    end;
  end;
end;

procedure InitializeWizard();
begin
  if IsRedmonEERecommended then
    CheckComponent(CustomMessage('RedmonEEComponentDesc'))
  else if IsMfilemonRecommended then
    CheckComponent(CustomMessage('mfilemonComponentDesc'));
end;









