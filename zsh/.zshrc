# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
# 加载环境变量
if [ -f ~/.zsh/.zsh_aliases ]; then
    . ~/.zsh/.zsh_aliases
fi
# 加载别名
if [ -f ~/.zsh/.zsh_profile ]; then
    . ~/.zsh/.zsh_profile
fi

alias sw='sudo sh $HOME/scripts/wifi/switch_wifi.sh'
alias sb='sudo sh $HOME/bluetooth/switch_bluetooth.sh'
# 主题
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
# 语法高亮
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# 自动提示
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# 目录跳转
source ~/.zsh/z/z.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

xset r rate 250 60

. "$HOME/.cargo/env"

# ctrl+j  接受一段 接受到最后一个单词有bug
bindkey '^j' autosuggest-accept
# alt+j  接受全部
bindkey '\ej' forward-word

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
