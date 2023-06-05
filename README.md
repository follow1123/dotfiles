# 配置文件

## visual studio code

* `ctrl + p` 输入 import 找到 `profiles: imports profile...`
* 选择[vsCode.code-profile](./visual_studio_code/vsCode.code-profile)文件导入

## LF

* 使用管理员打开cmd
* 执行`mklink /D  ~\AppData\Local\lf ~\dotfiles\lf`

## powershell

* 在powershell内输出powershell配置文件`echo $PROFILE`
* 使用管理员打开cmd
* `mklink powershell的配置文件路径 ~\dotfiles\Microsoft.PowerShell_profile.ps1`

## lsd

* 安装
    * `scoop install lsd`
* 配置
    * 使用管理员打开cmd
    * `mklink C:\Users\YF\AppData\Roaming\lsd C:\Users\YF\dotfiles\lsd`

## fd 

* 安装
    * `scoop install fd`

## ripgrep 

* 安装
    * `scoop install ripgrep`

## bat 

* 安装
    * `scoop install bat`

## zoxide 

* 安装
    * `scoop install zoxide`
* 配置
    * 打开powershell配置文件：`nvim $PROFILE`
    * `Invoke-Expression (& { (zoxide init powershell | Out-String) })`
