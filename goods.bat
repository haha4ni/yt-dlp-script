@echo off
setlocal enabledelayedexpansion

:main
if "%~1"=="" (
    echo Open download_list.txt 
    for /f "delims=" %%a in (download_list.txt) do (
        set varA=%%a
        set www=!varA:~8,11!
        if "!www!"=="www.youtube" (
            call :download_youtube "%%a"
        ) ^
        else if "!www!"=="nicochannel" (
            call :download_nicochannel "%%a"
        )
    )
) ^
else (
    echo http
    set varA=%~1
    set www=!varA:~8,11!
    if "!www!"=="www.youtube" (
        call :download_youtube "%~1"
    ) ^
    else if "!www!"=="nicochannel" (
        call :download_nicochannel "%~1"
    )
)
goto :end

:download_youtube
    echo download_youtube
    echo %~1
    yt-dlp ^
        --cookies music.youtube.com_cookies.txt ^
        --embed-metadata ^
        --embed-thumbnail ^
        --write-thumbnail ^
        --write-sub --embed-sub --sub-lang en,zh,zh-TW,zh-Hant,jp ^
        -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio" ^
        %1 ^
        --output "%%(channel)s/[%%(upload_date)s]%%(title)s.%%(ext)s" ^
        --output "thumbnail:%%(channel)s/[%%(upload_date)s]%%(title)s.%%(ext)s"
    goto :eof

:download_nicochannel
    echo download_nicochannel
    yt-dlp ^
        --cookies nicochannel.jp_cookies.txt ^
        --embed-metadata ^
        --embed-thumbnail ^
        --write-thumbnail ^
        -f 4951 ^
        %1 ^
        --output "%%(channel)s/[%%(release_date)s]%%(title)s.%%(ext)s" ^
        --output "thumbnail:%%(channel)s/[%%(release_date)s]%%(title)s.%%(ext)s"
    goto :eof

:end
echo End of script.
endlocal