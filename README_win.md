- 终端模拟器：[alacritty](#alacritty) • [wezterm](#wezterm)
- Shell：[powershell](#powershell)
- Git：[git](#git) • [lazygit](#lazygit)
- 搜索：[fd](#fd) • [ripgrep](#ripgrep) • [fzf](#fzf)
- IDE：[Neovim](#neovim) • [Visual Studio Code](#visual-studio-code) • [IntelliJ IDEA](#intellij-idea)
- 其他：[scoop](#scoop) • [bat](#bat) • [zoxide](#zoxide) • [btop](#btop) • [xmllint](#xmllint) • [firefox](#firefox)

---

### 平台

[Linux](/README.md) | Windows

---

## Alacritty

> [Github 仓库](https://github.com/alacritty/alacritty)

安装：`scoop install alacritty`

配置：

> 使用管理员权限打开 powershell

```powershell
# 切换到 dotfiles 路径下
cd <dotfiles_root>

# 创建配置文件
mkdir "$ENV:APPDATA\alacritty"

# 创建软链接
New-Item -ItemType SymbolicLink -Path "$ENV:APPDATA\alacritty\alacritty.toml" -Target "$((Get-Location).Path)\alacritty\alacritty_windows.toml"
```

---

## Wezterm

> [官网](https://wezterm.org/) | [Github 仓库](https://github.com/wezterm/wezterm)

安装：参考[官方文档](https://wezterm.org/installation.html)

配置：

> 使用管理员权限打开 powershell

```powershell
# 切换到 dotfiles 路径下
cd <dotfiles_root>

# 创建配置文件
mkdir "$ENV:USERPROFILE\.config\wezterm"

# 创建软链接
New-Item -ItemType SymbolicLink -Path "$ENV:USERPROFILE\.config\wezterm\wezterm.lua" -Target "$((Get-Location).Path)\wezterm\wezterm_windows.lua"
```

---

### 自定义本地配置

在 wezterm 配置目录下创建 `local_config.lua` 文件

```lua
local M = {}

M.launch_menu = {
  { label = "Git Bash", args = { "C:/Program Files/Git/bin/bash.exe" } },
  { label = "remote linux", args = { "ssh", "remote_name"} }
}

return M
```

---

## Powershell

> [Github 仓库](https://github.com/PowerShell/PowerShell)

安装：`winget install --id Microsoft.PowerShell`

配置：

> 使用管理员权限打开 powershell

```powershell
# 切换到 dotfiles 路径下
cd <dotfiles_root>

mkdir $(Split-Path $PROFILE)

# 创建软链接
New-Item -ItemType SymbolicLink -Path "$PROFILE" -Target "$((Get-Location).Path)\powershell\Microsoft.PowerShell_profile.ps1"
```

---

### 添加本地配置

创建 powershell 配置文件同级目录下创建 `Local_config.ps1` 文件

```powershell
# 进入配置同级目录
cd $(Split-Path $PROFILE)

echo "$env:custom_env = 'custom value'" >> Local_config.ps1
```

---

### 禁用 powershell 检查更新

```powershell
[System.Environment]::SetEnvironmentVariable("POWERSHELL_UPDATECHECK", "off", "user")
```

---

## Git

版本管理

> [官网](https://git-scm.com/)

安装：`winget install --id Git.Git`

配置：

```powershell
# 切换到 dotfiles 路径下
cd <dotfiles_root>

cp "$((Get-Location).Path)\git\gitconfig" $ENV:USERPROFILE\.gitconfig

# 配置用户名和邮箱
git config --global user.name "your name"
git config --global user.email  "your email"
```

---

## lazygit

git tui 软件

> [Github 仓库](https://github.com/jesseduffield/lazygit)

安装：`scoop install lazygit`

配置：

> 使用管理员权限打开 powershell

```powershell
# 切换到 dotfiles 路径下
cd <dotfiles_root>

# 创建配置文件
mkdir $ENV:APPDATA\lazygit

# 创建软链接
New-Item -ItemType SymbolicLink -Path "$ENV:APPDATA\lazygit\config.yml" -Target "$((Get-Location).Path)\lazygit\config.yml"
```

---

## fd

文件搜索

> [Github 仓库](https://github.com/sharkdp/fd)

安装：`scoop install fd`

---

## ripgrep

文件内容搜索

> [Github 仓库](https://github.com/BurntSushi/ripgrep)

安装：`scoop install ripgrep`

---

## fzf

模糊搜索器

> [Github 仓库](https://github.com/junegunn/fzf)

安装：`scoop install fzf`

添加环境变量配置：

默认 powershell 配置内已经添加

```powershell
echo '$ENV:FZF_DEFAULT_OPTS = "--height 70% --layout=reverse --info=inline --preview-window=down:60%"' >> $PROFILE
```

---

## Neovim

> [官网](https://neovim.io/) | [Github 仓库](https://github.com/neovim/neovim)

安装：`scoop install neovim`

配置：

```powershell
# 切换到配置文件目录
cd $ENV:LOCALAPPDATA

# 下载配置
git clone https://github.com/follow1123/nvim.git
```

---

## bat

cat 替代命令

> [Github 仓库](https://github.com/sharkdp/bat)

安装：`scoop install bat`

配置：

> 使用管理员权限打开 powershell

```powershell
# 切换到 dotfiles 路径下
cd <dotfiles_root>

# 创建配置文件
mkdir $ENV:APPDATA\bat

# 创建软链接
New-Item -ItemType SymbolicLink -Path "$ENV:APPDATA\bat\config" -Target "$((Get-Location).Path)\bat\config"
```

---

## zoxide

路径跳转

> [Github 仓库](https://github.com/ajeetdsouza/zoxide)

安装：`scoop install zoxide`

配置：

默认 powershell 配置内已经添加

```powershell
echo "Invoke-Expression (& { (zoxide init powershell | Out-String) })" >> $PROFILE
```

---

## btop

进程管理 tui 程序

> [Github 仓库](https://github.com/aristocratos/btop)

安装：`scoop install btop`

---

## Scoop

Windows 下的包管理器

安装 scoop 包管理器，参考[官网](https://scoop.sh/)首页文档

---

## xmllint

xml 管理

安装：`scoop install xmllint`

---

## Firefox

1. 地址栏输入 `about:profiles`
2. 找到正在使用的配置里面的根目录
3. 复制里面的 `根目录` 的文件夹

> 使用管理员权限打开 powershell

```powershell
# 修改复制的根路径
New-Item -ItemType SymbolicLink -Path "</path/to/firefox/>" -Target "$((Get-Location).Path)\firefox\user.js" -Force
```

## Visual Studio Code

---

> [官网](https://code.visualstudio.com/)下载安装

### 插件

> 手动安装

- vim - vim 插件
- path autocomplete - 路径补全
- editorconfig - 文件格式

### 配置

> 使用管理员权限打开 powershell

```powershell
New-Item -ItemType SymbolicLink -Path "$ENV:APPDATA\Code\User\settings.json" -Target "$((Get-Location).Path)\vscode\settings.json" -Force
New-Item -ItemType SymbolicLink -Path "$ENV:APPDATA\Code\User\keybindings.json" -Target "$((Get-Location).Path)\vscode\keybindings.json" -Force
```

---

## IntelliJ IDEA

> [官网](https://www.jetbrains.com/idea/)

安装：[官方下载地址](https://www.jetbrains.com/idea/download/)

配置

手动安装 `ideavim` 插件

手动导入 `idea\settings.zip` 文件

```powershell
# 复制 ideavim 插件配置
New-Item -ItemType SymbolicLink -Path "$ENV:USERPROFILE\.ideavimrc" -Target "$((Get-Location).Path)\idea\ideavimrc_win" -Force
```
