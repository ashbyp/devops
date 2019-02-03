@ECHO OFF
SET description=ashbyp_cygwin
CALL config.bat
SET source_dir="C:\cygwin64\home\ashbyp"
SET dest_dir="%destination%\ashbyp\cygwin_home"
SET exclude_files=%exclude_files% *.jar *.war *.o
ECHO "Backing up %description%"
ROBOCOPY %source_dir% %dest_dir% %what_to_copy% %options% %exclude_dirs% %exclude_files%
:END

