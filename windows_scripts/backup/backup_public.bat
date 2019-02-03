@ECHO OFF
echo %date% - %time%
CALL backup_public_documents
echo %date% - %time%
CALL backup_public_music
echo %date% - %time%
CALL backup_public_pictures
echo %date% - %time%
CALL backup_public_videos
echo %date% - %time%
:END
