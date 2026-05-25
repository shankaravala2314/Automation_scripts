@echo off
color 0A
TITLE Simple S3 Folder Upload Automation

REM =========================
REM CHANGE ONLY BELOW LINES
REM =========================

SET SOURCE=I:\Part_2\Data\Kanpur\test
SET DESTINATION=sysgrid/store-igenesys/kanpur/test

REM =========================
REM UPLOAD
REM =========================

echo ==========================================
echo Upload Started...
echo ==========================================

echo Source:
echo %SOURCE%

echo Destination:
echo %DESTINATION%

C:\mc\mc.exe mirror --overwrite --retry "%SOURCE%" %DESTINATION%

echo ==========================================
echo Upload Completed
echo ==========================================

pause