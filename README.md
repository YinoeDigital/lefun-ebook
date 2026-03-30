# 樂放旅遊 Le Fun — 行前說明電子書系統

## 專案結構

```
lefun-ebook/
├── tool.html      ← 員工操作工具（上傳PDF → 產生電子書）
├── viewer.html    ← 遊客閱覽端（讀取JSON渲染電子書）
├── data/          ← 存放每份行程的JSON資料
│   └── *.json
└── README.md
```

## 部署到 GitHub Pages（一次設定）

1. 在 GitHub 建立 public repo，命名 `lefun-ebook`
2. 把這個資料夾的所有檔案上傳進去
3. 進入 repo → Settings → Pages → Source 選 `main` 分支根目錄
4. 等待約 1 分鐘，Pages 網址會是：
   `https://[你的帳號].github.io/lefun-ebook/`

## 使用方式

### 員工操作
1. 用瀏覽器開啟 `tool.html`
2. 點右上角「⚙ 設定 API Keys」，輸入：
   - Anthropic API Key（`sk-ant-...`）
   - GitHub Personal Access Token（需 `repo` 權限）
3. 上傳行前說明 PDF
4. 填寫基本資訊（團名、日期、領隊等）
5. 按「一鍵產生電子書」
6. 複製連結分享給遊客

### 遊客閱覽
遊客收到連結格式：
`https://[帳號].github.io/lefun-ebook/viewer.html?id=20260509-jeju`

直接用手機瀏覽器開啟即可，無需安裝任何 App。

## 取得 API Keys

### Anthropic API Key
1. 前往 https://console.anthropic.com
2. 左側選單 → API Keys → Create Key

### GitHub Personal Access Token
1. 前往 https://github.com/settings/tokens
2. Generate new token (classic)
3. 勾選 `repo` 權限
4. 產生後複製（只顯示一次！）

## 品牌色票
- 主色（薄荷綠）：`#81F8B9`
- 輔色（玫瑰粉）：`#ECD1D5`
- 強調（番茄橘）：`#EE6543`
- 淺藍：`#99EBF7`
- 嫩黃：`#E3FF85`

---
技術棧：純 HTML/CSS/JS · PDF.js · Claude API · GitHub Pages
