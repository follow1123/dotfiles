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