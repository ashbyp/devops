@ECHO OFF
SET description=victoria_music
CALL config.bat
SET source_dir="C:\Users\victoria\Music"
SET dest_dir="%destination%\victoria\Music"
ECHO "Backing up %description%"
ROBOCOPY %source_dir% %dest_dir% %what_to_copy% %options% %exclude_dirs% %exclude_files%
:END

