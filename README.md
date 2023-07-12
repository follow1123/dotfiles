# 配置文件

## 依赖
* 部分软件使用对应开发语言的包管理器安装，需要安装对应语言的环境
* rust
    * 参考[官网](https://www.rust-lang.org/)提供的脚本安装方式
    * `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
    * 配置环境变量，放在zshrc内：`. "$HOME/.cargo/env"`
* go
    * 从[官网](https://go.dev/)下载压缩包
    * 解压：`sudo tar -zxvf 压缩包 -C /usr/local`
    * 配置环境变量，放在系统环境变量下或zshrc内
    ```bash
    export GOROOT=/usr/local/go
    export GOPATH=$HOME/space/code/go
    export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
    ```
* zsh相关插件，nvim配置文件都在子模块内，需要下载子模块
    * `git submodule update --init`

## 系统包管理器安装的工具，debian
* zsh、dunst (通知管理)、picom (窗口渲染器)、rofi (程序启动器)、libnotify-bin (用于发送通知notify-send)
```bash
sudo apt install zsh dunst picom rofi libnotify-bin
```
* zsh安装完成后需要切换终端：`sudo chsh -s /bin/zsh`，重启后生效

## rust相关工具
* alacritty (终端模拟器)、bat (替换cat)、lsd (替换ls)、fd-find (替换find)、ripgrep (替换grep)、zoxide (模糊目录切换，类似cd)
```bash
cargo install alacritty bat lsd fd-find ripgrep zoxide
```
## go相关工具
* lf (文件管理器类似ranger)、lazygit (git客户端)
```bash
env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest # lf
go install github.com/jesseduffield/lazygit@latest # lazygit
```

## neovim安装
* 依赖
    * `sudo apt install cmake xclip`
* 克隆代码：`git clone https://github.com/neovim/neovim`
* 切换到稳定版：`git checkout stable`
* 进入neovim目录，执行：`make CMAKE_BUILD_TYPE=RelWithDebInfo`，检查是否缺少依赖，安提示安装
* 编译并安装：`sudo make install`

## 安装完后需要执行当前目录下的config.sh文件替换默认配置,(切换到当前目录下执行)
