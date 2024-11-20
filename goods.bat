@echo off
setlocal enabledelayedexpansion
::腳本
if "%~1"=="" (
    echo Open test.txt
    for /f %%a in (test.txt) do (
      set varA=%%a
      set www=!varA:~12,4!
      if "!www!"=="yout" (
        yt-dlp ^
        --embed-metadata ^
        --embed-thumbnail ^
        --write-thumbnail ^
        --write-sub --embed-sub --sub-lang en,zh,jp ^
        -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio" ^
        %%a ^
        --output "%%(channel)s/[%%(upload_date)s]%%(title)s.%%(ext)s" ^
        --output "thumbnail:%%(channel)s/[%%(upload_date)s]%%(title)s.%%(ext)s" 
      ) ^
      else if "!www!"=="nico" (
        yt-dlp ^
        --cookies www.nicovideo.jp_cookies.txt ^
        --embed-metadata ^
        --embed-thumbnail ^
        -f "h264_720p-aac_192kbps-http" ^
        %%a ^
        --output "%%(channel)s/[%%(upload_date)s]%%(title)s.%%(ext)s" 
      )
    )
) else (
    echo http
    set varA=%~1
    echo %varA%
    set www=!varA:~8,11!
    echo %www%
    if "!www!"=="www.youtube" (
        echo youtube
        yt-dlp ^
        --embed-metadata ^
        --embed-thumbnail ^
        --write-thumbnail ^
        --write-sub --embed-sub --sub-lang en,zh,jp ^
        -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio" ^
        %~1 ^
        --output "%%(channel)s/[%%(upload_date)s]%%(title)s.%%(ext)s" ^
        --output "thumbnail:%%(channel)s/[%%(upload_date)s]%%(title)s.%%(ext)s" 
    ) else if "!www!"=="nicochannel" (
        echo nico
        yt-dlp ^
        --cookies nicochannel.jp_cookies.txt ^
        --embed-metadata --embed-thumbnail ^
        -f 4951 %~1 ^
        --write-thumbnail ^
        --output "%%(channel)s/[%%(release_date)s]%%(title)s.%%(ext)s" ^
        --output "thumbnail:%%(channel)s/[%%(release_date)s]%%(title)s.%%(ext)s"
    )
)