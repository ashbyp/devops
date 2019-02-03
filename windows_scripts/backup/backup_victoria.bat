@ECHO OFF
echo %date% - %time%
CALL backup_victoria_appdata
echo %date% - %time%
CALL backup_victoria_documents
echo %date% - %time%
CALL backup_victoria_music
echo %date% - %time%
CALL backup_victoria_pictures
echo %date% - %time%
CALL backup_victoria_videos
echo %date% - %time%
:END
