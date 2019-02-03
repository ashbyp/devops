@ECHO OFF
SET description=victoria_documents
CALL config.bat
SET source_dir="C:\Users\victoria\Documents"
SET dest_dir="%destination%\victoria\Documents"
SET exclude_dirs=%exclude_dirs% "My *"
ECHO "Backing up %description%"
ROBOCOPY %source_dir% %dest_dir% %what_to_copy% %options% %exclude_dirs% %exclude_files%
:END

