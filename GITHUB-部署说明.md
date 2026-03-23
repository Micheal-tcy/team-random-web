# 部署到 GitHub（两种办法）

你的电脑当前**未检测到 Git 命令行**。可以任选下面一种方式。

---

## 方法一：纯网页操作（不用安装 Git）✅

### 1. 新建仓库

1. 打开 [https://github.com/new](https://github.com/new)
2. **Repository name** 填例如：`team-random-web`（可自定）
3. 选 **Public**
4. **不要**勾选 “Add a README”（本文件夹里已有文件，避免冲突）
5. 点 **Create repository**

### 2. 上传文件

在新建好的仓库页面：

1. 点 **uploading an existing file**（或 **Add file → Upload files**）
2. 把本机文件夹里的这两个文件拖进去：
   - `index.html`
   - `README.md`（可选，方便以后自己看说明）
3. 下方 **Commit changes** 填说明，点 **Commit changes**

### 3. 开启 GitHub Pages

1. 仓库页点 **Settings**
2. 左侧点 **Pages**
3. **Build and deployment → Source** 选 **Deploy from a branch**
4. **Branch** 选 `main`，文件夹选 **`/ (root)`**，点 **Save**
5. 等 1～3 分钟，刷新 **Pages** 页，会出现你的网站地址，一般为：

   **`https://你的用户名.github.io/仓库名/`**

例如仓库名是 `team-random-web`、用户名是 `tangchenyin`，则是：

`https://tangchenyin.github.io/team-random-web/`

---

## 方法二：安装 Git 后用命令行（以后改代码方便）

1. 安装 [Git for Windows](https://git-scm.com/download/win)，安装时勾选 **“Git from the command line”**。
2. 打开 **Git Bash** 或 **PowerShell**，执行（把用户名和仓库名改成你的）：

```bash
cd /c/Users/tangchenyin/team-random-web
git init
git add index.html README.md
git commit -m "Initial: team random split page"
git branch -M main
git remote add origin https://github.com/你的用户名/你的仓库名.git
git push -u origin main
```

若 GitHub 要求登录，按提示用 **浏览器登录** 或 **Personal Access Token**。

然后再到仓库 **Settings → Pages** 按「方法一」第 3 步开启即可。

---

## 常见问题

- **打开是 404**：Pages 刚开启要等几分钟；确认分支是 `main` 且根目录有 `index.html`。
- **数据存在哪**：名单等仍在**访客各自浏览器**的 localStorage；GitHub 只托管静态网页，不存用户填写的数据。
