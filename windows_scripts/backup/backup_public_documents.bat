@ECHO OFF
SET description=public_documents
CALL config.bat
SET source_dir="C:\Users\public\Documents"
SET dest_dir="%destination%\public\Documents"
SET exclude_dirs=%exclude_dirs% "My *"
ECHO "Backing up %description%"
ROBOCOPY %source_dir% %dest_dir% %what_to_copy% %options% %exclude_dirs% %exclude_files%
:END

