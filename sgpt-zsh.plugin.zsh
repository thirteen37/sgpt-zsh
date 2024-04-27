#!/usr/bin/env zsh

if ! (( $+commands[sgpt] )); then
    echo 'sgpt command not found: please install via https://github.com/TheR1D/shell_gpt'
    exit
fi

# Shell-GPT integration ZSH v0.2
_sgpt_zsh() {
if [[ -n "$BUFFER" ]]; then
    _sgpt_prev_cmd=$BUFFER
    BUFFER+="⌛"
    zle -I && zle redisplay
    BUFFER=$(sgpt --shell <<< "$_sgpt_prev_cmd" --no-interaction)
    zle end-of-line
fi
}
zle -N _sgpt_zsh
bindkey '^l' _sgpt_zsh
