@ECHO OFF
SET description=public_pictures
CALL config.bat
SET source_dir="C:\Users\public\Pictures"
SET dest_dir="%destination%\public\Pictures"
ECHO "Backing up %description%"
ROBOCOPY %source_dir% %dest_dir% %what_to_copy% %options% %exclude_dirs% %exclude_files%
:END

