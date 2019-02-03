@ECHO OFF
echo %date% - %time%
CALL backup_ashbyp_documents
echo %date% - %time%
CALL backup_ashbyp_dev
echo %date% - %time%
CALL backup_ashbyp_music
echo %date% - %time%
CALL backup_ashbyp_pictures
echo %date% - %time%
CALL backup_ashbyp_videos
echo %date% - %time%
CALL backup_ashbyp_appdata
echo %date% - %time%
CALL backup_ashbyp_cygwin
echo %date% - %time%
CALL backup_ashbyp_scripts
echo %date% - %time%
REM CALL backup_ashbyp_dropbox
REM echo %date% - %time%
:END
