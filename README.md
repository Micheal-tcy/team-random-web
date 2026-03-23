# 随机分队网页（可在线访问 + 本地保存）

本目录为**纯静态页面**，可部署到任意静态托管，访客在浏览器中打开即可使用。

## 数据如何「保留」

- **同一网址 + 同一浏览器**：名单、参与开关、队伍数、上次分队结果会写入 `localStorage`，刷新或下次打开仍在。
- **换电脑 / 换浏览器**：请使用页面上的 **「导出 JSON 备份」**，在新环境 **「导入备份」**。
- **清除**：页面内 **「清除本地数据」** 或浏览器清除站点数据。

## 云端保存（Supabase）

页面支持把**完整状态**（名单、参与开关、队伍数、分队结果）存到你自己的 **Supabase**（免费 PostgreSQL）：

1. 注册 [Supabase](https://supabase.com) 并新建项目。
2. 打开 **SQL Editor**，运行仓库里的 **`supabase-schema.sql`**。
3. 在项目 **Settings → API** 复制 **Project URL** 与 **anon public** key，填到网页「云端保存」区域。
4. 点击 **生成新 ID** 得到「存档 ID」，再点 **保存到云端**。其他设备用相同 URL、anon key 和存档 ID 点 **从云端加载** 即可同步。

可选勾选 **本地改动后自动同步云端**（约 2 秒防抖）。

**安全说明**：anon key 会出现在前端代码/网络请求中，属正常用法；请勿把「存档 ID」泄露给不信任的人。当前 RLS 策略允许匿名读写表内数据，适合小团队；更高要求请自行改为登录用户 + 更严 RLS 或 Edge Function。

## 一键上线（任选一种）

### 1. GitHub Pages

1. 在 GitHub 新建仓库，将本目录中的 **`index.html`** 推到仓库**根目录**（或见下「子目录」）。
2. 仓库 **Settings → Pages**，**Source** 选 `Deploy from a branch`，分支选 `main`，文件夹 `/ (root)`，保存。
3. 几分钟后访问：`https://你的用户名.github.io/仓库名/`

若把页面放在子目录（例如 `docs/`），将 **Build and deployment** 的文件夹改为 `/docs`，并把 `index.html` 放在 `docs/` 下。

### 2. Netlify Drop

打开 [Netlify Drop](https://app.netlify.com/drop)，把包含 `index.html` 的文件夹拖进去，即可得到 `https://随机名.netlify.app` 在线地址。

### 3. Cloudflare Pages

连接 Git 仓库或直接上传 `index.html`，按向导发布即可。

### 4. Vercel

新建 Project，导入含 `index.html` 的目录，框架选 **Other**，部署后得到 `*.vercel.app` 链接。

---

本地调试：直接用浏览器打开 `index.html` 即可（`file://` 下部分浏览器对 `localStorage` 仍可用，上线后使用 `https://` 最稳妥）。
