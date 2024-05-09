@echo off
setlocal enabledelayedexpansion

REM Get current date in YYMMDD format
for /F "tokens=1-3 delims=-" %%a in ('echo %date%') do (
    set "current_date=%%c%%b%%a"
)

REM Initialize message body
set "message_body=QTY   FILE"
for %%F in (%*) do (
    REM Append filename to the message body
set "file_name=%%~nxF"
    set message_body= !message_body! "%%0a1"  !file_name!
)

REM Set subject
set "subject=Pl print %current_date%"


REM Set to address
set "to_emails=<comma separated emails>"

REM Open Gmail compose with the specified parameters
start "" "https://mail.google.com/mail/?view=cm&fs=1&to=%to_emails%&su=%subject%&body=%message_body%"
