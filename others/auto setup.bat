@echo off
echo This is for activing some functions that makes life easier.
echo Please wait until the progress is done...
adb kill-server
adb start-server
echo =============================================
echo Waiting for Device, connect USB cable now...
echo =============================================
adb wait-for-device
echo Device found!
adb devices
adb shell sh /data/user_de/0/moe.shizuku.privileged.api/start.sh
adb shell sh /data/data/me.piebridge.brevent/brevent.sh
adb -d shell pm grant com.fooview.android.fooview android.permission.READ_LOGS
adb -d shell pm grant com.fooview.android.fooview android.permission.WRITE_SECURE_SETTINGS
adb.exe shell pm grant com.samruston.buzzkill android.permission.WRITE_SECURE_SETTINGS
adb shell pm grant com.byyoung.setting android.permission.WRITE_SECURE_SETTINGS
echo =============================================
echo            Installation finished!
echo =============================================
echo.
pause