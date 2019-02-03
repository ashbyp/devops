@ECHO OFF
SET description=ashbyp_documents
CALL config.bat
SET source_dir="C:\Users\ashbyp\Documents"
SET dest_dir="%destination%\ashbyp\Documents"
SET exclude_dirs=%exclude_dirs% "hibernate-distribution-3.5.3-Final" "og-*" "Downloads" "springindepth" "eclipse" "m2" ".m2" "db" "apache-log4j-1.2.16" "mysql-connector-java-3.1.14" "My *"
SET exclude_files=%exclude_files% *.jar *.war
ECHO "Backing up %description%"
ROBOCOPY %source_dir% %dest_dir% %what_to_copy% %options% %exclude_dirs% %exclude_files%
:END

