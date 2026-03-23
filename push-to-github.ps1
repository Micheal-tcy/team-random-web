# 用法（在 PowerShell 里运行）：
#   cd C:\Users\tangchenyin\team-random-web
#   .\push-to-github.ps1 -RepoUrl "https://github.com/你的用户名/仓库名.git"
#
# 若尚未在 GitHub 新建空仓库：打开 https://github.com/new ，不要勾选 README。

param(
  [Parameter(Mandatory = $true)]
  [string]$RepoUrl
)

$git = "C:\Program Files\Git\bin\git.exe"
if (-not (Test-Path $git)) {
  $git = "git"
}

Set-Location $PSScriptRoot

& $git remote remove origin 2>$null
& $git remote add origin $RepoUrl
& $git branch -M main
& $git push -u origin main

Write-Host ""
Write-Host "推送完成后：GitHub 仓库 → Settings → Pages → Branch 选 main，文件夹 / (root)，保存。" -ForegroundColor Green
Write-Host "网站地址一般为：https://你的用户名.github.io/仓库名/" -ForegroundColor Cyan
