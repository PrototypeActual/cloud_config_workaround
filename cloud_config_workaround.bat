@echo off
setlocal

:: location to keep good local config files
set "GOODCONFIGSDIR=%USERPROFILE%\Documents\game_configs"

:: create a directory to keep good config file
mkdir "%GOODCONFIGSDIR%\%SteamAppId%"

:: get location of config file used in game based on steam appid
if %SteamAppId%==814380 (
            set "GAMECONFIGDIR=Application Data\Sekiro"
            set "GAMECONFIG=GraphicsConfig.xml"
)
if %SteamAppId%==292030 (
            set "GAMECONFIGDIR=Documents\The Witcher 3"
            set "GAMECONFIG=user.settings"
)
if %SteamAppId%==499450 (
            set "GAMECONFIGDIR=Documents\The Witcher 3"
            set "GAMECONFIG=user.settings"
)
if %SteamAppId%==32360 (
            set "GAMECONFIGDIR=Application Data\LucasArts\The Secret of Monkey Island Special Edition"
            set "GAMECONFIG=Settings.ini"
)
if %SteamAppId%==1151640 (
            set "GAMECONFIGDIR=Documents\Horizon Zero Dawn\Saved Game\profile"
            set "GAMECONFIG=graphicsconfig.ini"
)

set "CONFIGPATH=%USERPROFILE%\%GAMECONFIGDIR%\%GAMECONFIG%"

if %SteamAppId%==601150 (
            set "GAMECONFIG=%INSTALLDIR%\dmc5config.ini"
)

:: if this is defined then it's a game in the list so use the workaround
if defined GAMECONFIG (goto workaround)
:: else just run the game
%*
exit

:workaround
:: copy the wanted config file to the location used by game
copy "%GOODCONFIGSDIR%\%SteamAppId%\%GAMECONFIG%" "%CONFIGPATH%"
:: this is %command% (i.e. the game exe) and any parameters from the launch options
%*
:: save any config changes you made in-game for next time
copy "%CONFIGPATH%" "%GOODCONFIGSDIR%\%SteamAppId%\"
exit
