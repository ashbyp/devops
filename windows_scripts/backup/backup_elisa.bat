@ECHO OFF
echo %date% - %time%
CALL backup_Elisa_documents
echo %date% - %time%
CALL backup_Elisa_music
echo %date% - %time%
CALL backup_Elisa_pictures
echo %date% - %time%
CALL backup_Elisa_videos
echo %date% - %time%
CALL backup_Elisa_appdata
echo %date% - %time%
REM CALL backup_Elisa_dropbox
REM echo %date% - %time%
:END
