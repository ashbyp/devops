@ECHO OFF
SET description=victoria_videos
CALL config.bat
SET source_dir="C:\Users\victoria\Videos"
SET dest_dir="%destination%\victoria\Videos"
SET exclude_files=%exclude_files% Thumbs.db
ECHO "Backing up %description%"
ROBOCOPY %source_dir% %dest_dir% %what_to_copy% %options% %exclude_dirs% %exclude_files%
:END
