@ECHO OFF
SET description=marcus_dropbox
CALL config.bat
SET source_dir="C:\Users\marcus\Dropbox"
SET dest_dir="%destination%\marcus\Dropbox"
SET exclude_files=%exclude_files% *.jar *.war
ECHO "Backing up %description%"
ROBOCOPY %source_dir% %dest_dir% %what_to_copy% %options% %exclude_dirs% %exclude_files%
:END

