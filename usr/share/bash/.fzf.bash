# Setup fzf
# ---------
if [[ ! "$PATH" == */pri/veen/tmp/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/pri/veen/tmp/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/pri/veen/tmp/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/pri/veen/tmp/fzf/shell/key-bindings.bash"
