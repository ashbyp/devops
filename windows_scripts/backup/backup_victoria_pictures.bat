@ECHO OFF
SET description=victoria_pictures
CALL config.bat
SET source_dir="C:\Users\victoria\Pictures"
SET dest_dir="%destination%\victoria\Pictures"
ECHO "Backing up %description%"
ROBOCOPY %source_dir% %dest_dir% %what_to_copy% %options% %exclude_dirs% %exclude_files%
:END

