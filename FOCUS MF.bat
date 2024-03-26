@echo off

setlocal enabledelayedexpansion
rem Define an array to store process names
set "processes="
rem Define an array of process names to iterate over

set "process_names=upc.exe UplayWebCore.exe Discord.exe RiotClientServices.exe steamwebhelper.exe steam.exe steamservice.exe EABackgroundService.exe AnyDesk.exe EpicGamesLauncher.exe"

rem Add process names to the array
for %%p in (%process_names%) do (
  for /f "tokens=2" %%a in ('tasklist /fi "imagename eq %%p" /nh') do (
    set "processes=!processes! %%p"
    taskkill /pid %%a /F
  )
)

rem Output the array
echo Process names: %processes%

rem Clean up environment variables
endlocal

pause