@ECHO OFF
REM Required Variables
REM "description" description of what's being backed up eg: ashbyp_videos
SET destination=\\diskstation\shared\robobackup-ashby-pc2
SET log_fname=logs\%description%_%date:~-4,4%%date:~-7,2%%date:~-10,2%.log
SET what_to_copy=/COPY:DAT /MIR
SET exclude_dirs=/XD junk .git venv .idea
SET exclude_files=/XF *.bak *.tmp *.lock *.swp *.dll *.class .git
SET options=/FFT /R:0 /W:0 /LOG+:%log_fname% /NFL /NDL
:END
