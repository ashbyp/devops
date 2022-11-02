@ECHO OFF
SET description=ashbyp_pictures
CALL config.bat
SET source_dir="C:\Users\ashbyp\OneDrive\Pictures"
SET dest_dir="%destination%\ashbyp\Pictures"
ECHO "Backing up %description%"
ROBOCOPY %source_dir% %dest_dir% %what_to_copy% %options% %exclude_dirs% %exclude_files%
:END

