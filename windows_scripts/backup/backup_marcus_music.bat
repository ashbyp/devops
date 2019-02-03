@ECHO OFF
SET description=marcus_music
CALL config.bat
SET source_dir="C:\Users\marcus\Music"
SET dest_dir="%destination%\marcus\Music"
ECHO "Backing up %description%"
ROBOCOPY %source_dir% %dest_dir% %what_to_copy% %options% %exclude_dirs% %exclude_files%
:END

