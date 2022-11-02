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
CALL backup_ashbyp_wsl
:END
