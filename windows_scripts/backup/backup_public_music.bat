@ECHO OFF
SET description=public_music
CALL config.bat
SET source_dir="C:\Users\public\Music"
SET dest_dir="%destination%\public\Music"
ECHO "Backing up %description%"
ROBOCOPY %source_dir% %dest_dir% %what_to_copy% %options% %exclude_dirs% %exclude_files%
:END

