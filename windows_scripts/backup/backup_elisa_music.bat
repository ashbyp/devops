@ECHO OFF
SET description=Elisa_music
CALL config.bat
SET source_dir="C:\Users\Elisa\Music"
SET dest_dir="%destination%\Elisa\Music"
ECHO "Backing up %description%"
ROBOCOPY %source_dir% %dest_dir% %what_to_copy% %options% %exclude_dirs% %exclude_files%
:END

