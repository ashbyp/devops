@ECHO OFF
SET description=Elisa_pictures
CALL config.bat
SET source_dir="C:\Users\Elisa\Pictures"
SET dest_dir="%destination%\Elisa\Pictures"
ECHO "Backing up %description%"
ROBOCOPY %source_dir% %dest_dir% %what_to_copy% %options% %exclude_dirs% %exclude_files%
:END

