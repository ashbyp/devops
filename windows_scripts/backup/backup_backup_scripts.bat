@ECHO OFF
SET description=backup_scripts
CALL config.bat
SET source_dir="C:\Users\ashbyp\Backup"
SET dest_dir="%destination%\backup_scripts"
ECHO "Backing up %description%"
ROBOCOPY %source_dir% %dest_dir% %what_to_copy% %options% %exclude_dirs% %exclude_files%
:END

