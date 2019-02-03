@ECHO OFF
echo %date% - %time%
CALL backup_marcus_documents
echo %date% - %time%
CALL backup_marcus_music
echo %date% - %time%
CALL backup_marcus_pictures
echo %date% - %time%
CALL backup_marcus_videos
echo %date% - %time%
CALL backup_marcus_appdata
echo %date% - %time%
REM CALL backup_marcus_dropbox
REM echo %date% - %time%
:END
