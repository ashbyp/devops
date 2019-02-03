@ECHO OFF
SET description=ashbyp_scripts
CALL config.bat
SET source_dir="C:\Users\ashbyp\Scripts"
SET dest_dir="%destination%\ashbyp\Scripts"
SET exclude_files=%exclude_files% *.jar *.war
ECHO "Backing up %description%"
ROBOCOPY %source_dir% %dest_dir% %what_to_copy% %options% %exclude_dirs% %exclude_files%
:END

