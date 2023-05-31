# 别名
function vf { nvim $(fzf) }
function nf { npp $(fzf) }
function o { explorer .}
function lg { lazygit.exe }

# powershell 主题配置
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/powerlevel10k_lean.omp.json" | Invoke-Expression

# Set-PSReadLineOption -Colors @{ InlinePrediction = "`e[38;5;238m" }
# ctrl+j 接收全部建议
Set-PSReadLineKeyHandler -Chord "Ctrl+j" -Function ForwardChar
# alt+j 接收下一个建议
Set-PSReadLineKeyHandler -Chord "Alt+j" -Function ForwardWord

# Get-ChildItem . -Recurse -Attributes Directory | Invoke-Fzf | Set-Location
# $FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border  --preview 'cat {}'"
Set-Item -Path 'Env:\FZF_DEFAULT_OPTS' -Value "--height 95% --layout=reverse --preview 'bat --color=always --style=numbers --line-range=:500 {}' --prompt='❯ ' --info=inline:' ' --preview-window=down:60%"
# Set-Item -Path 'Env:\FZF_DEFAULT_COMMAND' -Value "es"

# 安装 z 插件
# Install-Module -Name z 
# lf配置
Set-Item -Path 'Env:\SHELL' -Value "pwsh"
Set-Item -Path 'Env:\EDITOR' -Value "nvim"
Set-Item -Path 'Env:\PAGER' -Value "~/dotfiles/lf/pv.cmd"
