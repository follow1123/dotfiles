# colorscheme -----------------------------------------------------------------

$PSStyle.FileInfo.Directory = "`e[34;1m"

# function --------------------------------------------------------------------

# 自定义 Prompt
function prompt {
 "
$($ExecutionContext.SessionState.Path.CurrentLocation) `e[1;31m>`e[m "
}

# alias -----------------------------------------------------------------------

# 移除powershell自带的别名
Remove-Alias -Name "sl" -Force # 默认是Set-Location
Remove-Alias -Name "where" -Force # 默认是Where-Object，移除后使用系统自带的where程序

Set-Alias -Name lg -Value lazygit
Set-Alias -Name make -Value mingw32-make.exe

# keymap ----------------------------------------------------------------------

Set-PSReadLineOption -EditMode Emacs # 可选的，选择编辑模式
Set-PSReadlineOption -BellStyle None # 禁用铃声

# env -------------------------------------------------------------------------

# plugins ---------------------------------------------------------------------

# 安装 z 插件
Invoke-Expression (& { (zoxide init powershell | Out-String) })

$LocalConfigPath = "$(Split-Path $PROFILE)\Local_config.ps1"
if (Test-Path $LocalConfigPath) {
	. $LocalConfigPath
}
