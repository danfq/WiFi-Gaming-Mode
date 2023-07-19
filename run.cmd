@echo off
color f
title WiFi Gaming Mode v1.0 - github.com/danfq

REM Go To Menu
goto MENU

:MENU
echo.
echo    +========================+
echo    . WiFi Gaming Mode v1.0 .
echo    +========================+
echo    .                        .
echo    . Press Any Key to Begin .
echo    .                        .
echo    +========================+
echo.
pause > nul

REM Start
goto START

:START
cls
echo.

REM Ping Google
echo [*] Pinging Google to Check Connectivity...
ping google.com
echo.
echo.

REM Flush DNS
echo [*] Flushing DNS...
ipconfig /flushdns
echo.
echo.

REM Disable TCP AutoTune Mode
echo [*] Disabling TCP AutoTune Mode...
netsh int tcp set global autotuning=disabled
echo.
echo.

REM Enable TCP Supplemental Mode
echo [*] Enabling TCP Supplemental Mode...
netsh int tcp set supplemental template=internet
echo.
echo.

REM Enable TCP DCA Mode
echo [*] Enabling TCP DCA (Direct Cache Access)...
netsh int tcp set global dca=enabled
echo.
echo.

REM Enable TCP NetDMA
echo [*] Enabling TCP NetDMA (Network Direct Memory Access)...
netsh int tcp set global netdma=enabled
echo.
echo.

REM Enable ECN Capability
echo [*] Enablind ECN Capability (Explicit Congestion Notification)...
netsh int tcp set global ecncapability=enabled
echo.
echo.

REM Stop Throttling
echo [*] Blocking Google DNS Throttling
netsh advfirewall firewall add rule name="StopThrottling" dir=in action=block remoteip=173.194.55.0/24 enable=yes
echo.
echo.

REM Go to Menu
echo.
echo Press Any Key to Reboot Your PC
pause >nul

shutdown /r /f /t 10 /c "Rebooting to Save Changes | Have Fun Playing ;)"