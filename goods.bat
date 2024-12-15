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
    set varA=%1
    echo !varA!
    set www=!varA:~9,11!
    echo !www!
    if "!www!"=="www.youtube" (
        call :download_youtube "%~1"
    ) ^
    else if "!www!"=="music.youtu" (
        call :download_youtube_music "%~1"
    ) ^
    else if "!www!"=="nicochannel" (
        call :download_nicochannel "%~1"
    ) ^
    else if "!www!"=="www.bilibil" (
        call :download_bilibili "%~1"
    )
)
goto :end


:download_youtube_music
    echo download_youtube_music
    yt-dlp ^
        --cookies music.youtube.com_cookies.txt ^
        --embed-metadata ^
        --extract-audio ^
        -f bestaudio ^
        %1 ^
        --output "%%(playlist)s/%%(playlist_index)s. %%(title)s.%%(ext)s"
    goto :eof

:download_youtube
    echo download_youtube
    echo %~1
    yt-dlp ^
        --embed-metadata ^
        --embed-thumbnail ^
        --write-thumbnail ^
        --write-sub --embed-sub --sub-lang en,zh,zh-TW,zh-Hant,ja ^
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
    
:download_bilibili
    @REM for test
    @REM yt-dlp --cookies www.bilibili.com_cookies.txt -F "https://www.bilibili.com/video/BV1pB4y1f7Pz/?share_source=copy_web&vd_source=1983853958445a17c1d4b0d0d997109d"
    echo download_bilibili
    yt-dlp ^
        --cookies www.bilibili.com_cookies.txt ^
        --embed-metadata ^
        --embed-thumbnail ^
        --write-thumbnail ^
        -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio" ^
        %1 ^
        --output "%%(channel)s/[%%(release_date)s]%%(title)s.%%(ext)s" ^
        --output "thumbnail:%%(channel)s/[%%(release_date)s]%%(title)s.%%(ext)s"
    goto :eof

:end
echo End of script.
endlocal