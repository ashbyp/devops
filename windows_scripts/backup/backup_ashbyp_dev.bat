@ECHO OFF
SET description=ashbyp_dev
CALL config.bat
SET source_dir="C:\Users\ashbyp\dev"
SET dest_dir="%destination%\ashbyp\dev"
SET exclude_dirs=%exclude_dirs% "Strata"
SET exclude_files=%exclude_files% *.jar *.war
ECHO "Backing up %description%"
ROBOCOPY %source_dir% %dest_dir% %what_to_copy% %options% %exclude_dirs% %exclude_files%
:END

