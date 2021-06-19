@ECHO OFF
SET description=ashbyp_wsl
CALL config.bat
SET source_dir="C:\Users\ashbyp\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc\LocalState\rootfs\home\ashbyp"
SET dest_dir="%destination%\ashbyp\wsl_home"
SET exclude_files=%exclude_files% *.jar *.war *.o
ECHO "Backing up %description%"
ROBOCOPY %source_dir% %dest_dir% %what_to_copy% %options% %exclude_dirs% %exclude_files%
:END

