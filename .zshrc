ZSH_THEME="powerlevel10k/powerlevel10k"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export TEXMFHOME=~/texmf
zstyle ':omz:update' mode auto      # update automatically without asking

source $ZSH/oh-my-zsh.sh
source $HOME/antigen.zsh
antigen use oh-my-zsh
antigen bundle pip
antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

plugins=(chucknorris emotty )

source /home/lukas/miniconda3/bin/activate tf
source ~/.fzf-tab-completion/zsh/fzf-zsh-completion.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(thefuck --alias)
alias tlmgr=/usr/local/texlive/2023/bin/x86_64-linux/tlmgr --usermode
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias fzfb="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

export FZF_DEFAULT_COMMAND="fdfind -H"
export FZF_CTRL_T_COMMAND="fdfind -H"
export FZF_ALT_C_COMMAND="fdfind . $HOME -t d -H"

export FZF_CTRL_T_OPTS="--ansi --preview-window 'hidden' --preview 'bat --color=always --style=header,grid --line-range :300 {}' --bind 'ctrl-space:change-preview-window(up|right:60%|)'"

# ------------------ SHORTCUTS ------------------
zle -N cd_with_fzf
bindkey ^f cd_with_fzf

zle -N search_home_with_fzf
bindkey ^b search_home_with_fzf

zle -N open_with_fzf
bindkey ^o open_with_fzf

zle -N nvim_with_fzf
bindkey ^v nvim_with_fzf

zle -N cd_home
bindkey ^h cd_home
# ------------------ FUNCTIONS ------------------
cd_with_fzf() {
    local selected_file=$(fdfind -t d -H | eval fzf $FZF_CTRL_T_OPTS) 
    if [ -n "$selected_file" ]; then
        BUFFER="cd $selected_file"
        zle accept-line
    fi
    zle reset-prompt
}

search_home_with_fzf() {
    local selected_file=$(fdfind . $HOME/ -H | eval fzf $FZF_CTRL_T_OPTS) 
    if [ -n "$selected_file" ]; then
        LBUFFER+=${selected_file}    
    fi
    zle reset-prompt
}

open_with_fzf() {
    fdfind -t f -H -I | fzf -m --preview="xdg-mime query filetype {} | xargs -I {} xdg-mime query default {}" --preview-window 'down:5%' --bind 'ctrl-space:change-preview-window(hidden|)' | xargs -ro -d "\n" xdg-open 2>&-
}

nvim_with_fzf() {
    local selected_file=$(fdfind -H | eval fzf $FZF_CTRL_T_OPTS) 
    if [ -n "$selected_file" ]; then
        BUFFER="nvim $selected_file"
        zle accept-line
    fi
    zle reset-prompt
}

cd_home() {
  cd $HOME
  zle accept-line
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/lukas/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/lukas/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/lukas/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/lukas/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# <<< conda initialize <<<
