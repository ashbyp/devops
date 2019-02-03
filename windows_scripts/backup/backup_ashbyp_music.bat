@ECHO OFF
SET description=ashbyp_music
CALL config.bat
SET source_dir="C:\Users\ashbyp\Music"
SET dest_dir="%destination%\ashbyp\Music"
ECHO "Backing up %description%"
ROBOCOPY %source_dir% %dest_dir% %what_to_copy% %options% %exclude_dirs% %exclude_files%
:END

