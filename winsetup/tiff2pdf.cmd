@echo off
rem Wrapper around tiff2pdf.exe to work around a bug with output to stdout
"%~d0%~p0tiff2pdf.exe" -o "%tmp%\tiff2pdf.tmp" %*
type "%tmp%\tiff2pdf.tmp"
del "%tmp%\tiff2pdf.tmp"
