@ECHO OFF
SET description=marcus_appdata
CALL config.bat
ECHO "Backing up %description%"
SET source_dir="C:\Users\marcus\AppData\Local\Microsoft\Outlook"
SET dest_dir="%destination%\marcus\AppData\Microsoft\Outlook"
ROBOCOPY %source_dir% %dest_dir% %what_to_copy% %options% %exclude_dirs% %exclude_files%
SET source_dir="C:\Users\marcus\AppData\Local\Google\Chrome"
SET dest_dir="%destination%\marcus\AppData\Google\Chrome"
SET exclude_dirs=%exclude_dirs% "Cache" "Local Storage" "Extensions" "Locales"
SET exclude_files=%exclude_files%  *.exe *.nexe "History Index*" "Archived History*" "Safe Browsing*"
REM ROBOCOPY %source_dir% %dest_dir% %what_to_copy% %options% %exclude_dirs% %exclude_files%
:END

