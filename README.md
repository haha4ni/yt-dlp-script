# 使用手冊

## 概述
該腳本利用 `yt-dlp` 工具來從不同的視頻平台下載內容，並根據來源網站執行不同的下載配置。支持的平台包括：

- YouTube
- YouTube Music (可直接下載整張專輯)
- NicoChannel
- Bilibili

腳本還可以根據一個下載清單（`download_list.txt`）批量下載視頻，或直接處理單一的視頻 URL。

---

## Cookies
如需近一步下載更高畫質/音質的檔案，請搭配自身的Cookies使用，Cookies導出套件如下：  
https://chromewebstore.google.com/detail/get-cookiestxt-locally/cclelndahbckbenkjhflpdbgdldlbecc  
到相對應的網站主頁(Youtube、Bilibili...)點擊Export As下載至此專案根目錄，對應的網站Cookies.txt檔名如下

- **`music.youtube.com_cookies.txt`**：
  用於下載 YouTube Music 的 Cookie 文件。

- **`nicochannel.jp_cookies.txt`**：
  用於下載 NicoChannel 的 Cookie 文件。

- **`www.bilibili.com_cookies.txt`**：
  用於下載 Bilibili 的 Cookie 文件。

---

## 用法


### **1. 處理單一 URL**

直接傳遞 URL 作為參數，腳本會自動識別來源並執行相應的下載邏輯。

```bash
goods.bat "<video_url>"
```

#### 範例：
```bash
goods.bat "https://www.youtube.com/watch?v=example"
```

---

### **2. 基本用法：執行腳本處理清單**

如果沒有參數，腳本會自動讀取當前目錄下的 `download_list.txt` 文件，並依次處理其中的每個 URL。

```bash
批次檔運行:
  goods.bat
```

#### **`download_list.txt` 範例**：
```
https://www.youtube.com/watch?v=example
https://nicochannel.jp/video/example
https://www.bilibili.com/video/example
https://music.youtube.com/watch?v=example
```

---

