- 终端模拟器：[ghostty](#ghostty) • [alacritty](#alacritty) • [wezterm](#wezterm)
- Shell：[zsh](#zsh) • [bash](#bash)
- Git：[git](#git) • [lazygit](#lazygit)
- 搜索：[fd](#fd) • [ripgrep](#ripgrep) • [fzf](#fzf)
- IDE：[Neovim](#neovim) • [Visual Studio Code](#visual-studio-code) • [IntelliJ IDEA](#intellij-idea)
- 其他：[bat](#bat) • [zoxide](#zoxide) • [btop](#btop) • [firefox](#firefox)

---

### 平台

Linux | [Windows](/README_win.md)

---

## Ghostty

> [官网](https://ghostty.org) • [Github 仓库](https://github.com/ghostty-org/ghostty)

安装：参考[官方文档](https://ghostty.org/docs/install/binary)

配置：

```bash
# 切换到 dotfiles 路径下
cd <dotfiles_root>

# 创建配置目录
mkdir -p $HOME/.config/ghostty

# 创建配置软链接
ln -s "$(pwd)/ghostty/config" $HOME/.config/ghostty/config
```

---

## Alacritty

> [Github 仓库](https://github.com/alacritty/alacritty)

安装：参考[官方文档](https://github.com/alacritty/alacritty/blob/master/INSTALL.md)

配置：

```bash
# 切换到 dotfiles 路径下
cd <dotfiles_root>

# 创建配置目录
mkdir -p $HOME/.config/alacritty

# 创建配置软链接
ln -s "$(pwd)/alacritty/alacritty_linux.toml" $HOME/.config/ghostty/alacritty.toml
```

---

## Wezterm

> [官网](https://wezterm.org/) | [Github 仓库](https://github.com/wezterm/wezterm)

安装：参考[官方文档](https://wezterm.org/installation.html)

配置：

```bash
# 切换到 dotfiles 路径下
cd <dotfiles_root>

# 创建配置目录
mkdir -p $HOME/.config/wezterm

# 创建配置软链接
ln -s "$(pwd)/wezterm/wezterm_linux.lua" $HOME/.config/wezterm/wezterm.lua
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

## zsh

> [官网](https://www.zsh.org/)

安装：`sudo apt install zsh zsh-autosuggestions -y`

配置：

```bash
# 切换到 dotfiles 路径下
cd <dotfiles_root>

# 创建配置软链接
ln -s "$(pwd)/zsh/zshrc" $HOME/.zshrc

# 设置当前用户 shell
chsh -s /bin/zsh

# 设置 root 用户 shell
sudo chsh -s /bin/zsh
```

---

## bash

安装：系统自带

配置：

```bash
# 切换到 dotfiles 路径下
cd <dotfiles_root>

cp "$(pwd)/bash/.bashrc" $HOME/.bashrc
cp "$(pwd)/bash/.bash_aliases" $HOME/.bash_aliases
```

---

## Git

版本管理

> [官网](https://git-scm.com/)

安装：`sudo apt install git -y`

配置：

```bash
# 切换到 dotfiles 路径下
cd <dotfiles_root>

# 创建配置软链接
cp "$(pwd)/git/gitconfig" $HOME/.gitconfig

# 配置用户名和邮箱
git config --global user.name "your name"
git config --global user.email  "your email"
```

---

## lazygit

git tui 软件

> [Github 仓库](https://github.com/jesseduffield/lazygit)

安装：参考[官方文档](https://github.com/jesseduffield/lazygit?tab=readme-ov-file#installation)

配置：

```bash
# 切换到 dotfiles 路径下
cd <dotfiles_root>

# 创建配置目录
mkdir -p $HOME/.config/lazygit

# 创建配置软链接
ln -s "$(pwd)/lazygit/config.yml" $HOME/.config/lazygit/config.yml
```

---

## fd

文件搜索

> [Github 仓库](https://github.com/sharkdp/fd)

安装：参考[官方文档](https://github.com/sharkdp/fd?tab=readme-ov-file#installation)

---

## ripgrep

文件内容搜索

> [Github 仓库](https://github.com/BurntSushi/ripgrep)

安装：参考[官方文档](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation)

---

## fzf

模糊搜索器

> [Github 仓库](https://github.com/junegunn/fzf)

安装：参考[官方文档](https://junegunn.github.io/fzf/installation/)

---

## Neovim

> [官网](https://neovim.io/) | [Github 仓库](https://github.com/neovim/neovim)

安装：包管理器不是最新的，推荐从源码构建，参考[官方构建文档](https://github.com/neovim/neovim/blob/master/BUILD.md)

配置：

```bash
# 切换到配置文件目录
cd $HOME/.config

# 下载配置
git clone https://github.com/follow1123/nvim.git
```

---

## bat

cat 替代命令

> [Github 仓库](https://github.com/sharkdp/bat)

安装：参考[官方文档](https://github.com/sharkdp/bat?tab=readme-ov-file#installation)

配置：

```bash
# 切换到 dotfiles 路径下
cd <dotfiles_root>

# 创建配置目录
mkdir -p $HOME/.config/bat

# 创建配置软链接
ln -s "$(pwd)/bat/config" $HOME/.config/bat/config
```

---

## zoxide

路径跳转

> [Github 仓库](https://github.com/ajeetdsouza/zoxide)

安装：参考[官方文档](https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#installation)

配置：

默认 zsh 配置内已经添加

```bash
eval "$(zoxide init zsh)"
```

---

## btop

进程管理 tui 程序

> [Github 仓库](https://github.com/aristocratos/btop)

安装：`sudo apt install btop`

---

## Firefox

1. 地址栏输入 `about:profiles`
2. 找到正在使用的配置里面的根目录
3. 复制里面的 `根目录` 的文件夹

```bash
# 修改复制的根路径
ln -s "$(pwd)/firefox/user.js"  <path_to_firefox>/user.js
```

---

## Visual Studio Code

> [官网](https://code.visualstudio.com/)下载安装

### 插件

> 手动安装

- `vim` - vim 插件
- `path autocomplete` - 路径补全
- `editorconfig` - 文件格式

### 配置

```bash
ln -s "$(pwd)/vscode/settings.json" $HOME/.config/Code/User/settings.json
ln -s "$(pwd)/vscode/keybindings.json" $HOME/.config/Code/User/keybindings.json
```

---

## IntelliJ IDEA

> [官网](https://www.jetbrains.com/idea/)

安装：[官方下载地址](https://www.jetbrains.com/idea/download/)

配置

手动安装 `ideavim` 插件

手动导入 `idea\settings.zip` 文件

```bash
# 复制 ideavim 插件配置
ln -s "$(pwd)/idea/ideavimrc" $HOME/.ideavimrc
```
