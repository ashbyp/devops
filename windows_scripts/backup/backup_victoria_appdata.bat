@ECHO OFF
SET description=victoria_appdata
CALL config.bat
ECHO "Backing up %description%"
SET source_dir="C:\Users\victoria\AppData\Local\Microsoft\Outlook"
SET dest_dir="%destination%\victoria\AppData\Microsoft\Outlook"
ROBOCOPY %source_dir% %dest_dir% %what_to_copy% %options% %exclude_dirs% %exclude_files%
SET source_dir="C:\Users\victoria\AppData\Local\Google\Chrome\not_exist"
SET dest_dir="%destination%\victoria\AppData\Google\Chrome"
SET exclude_dirs=%exclude_dirs% "Cache" "Local Storage" "Extensions" "Locales"
SET exclude_files=%exclude_files%  *.exe *.nexe "History Index*" "Archived History*" "Safe Browsing*"
REM ROBOCOPY %source_dir% %dest_dir% %what_to_copy% %options% %exclude_dirs% %exclude_files%
:END

