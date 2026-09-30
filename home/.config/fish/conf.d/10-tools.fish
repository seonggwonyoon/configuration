if status is-interactive
    type -q mise; and mise activate fish | source
    type -q zoxide; and zoxide init fish | source
    type -q fzf; and fzf --fish | source
    type -q starship; and starship init fish | source
else
    type -q mise; and mise activate fish --shims | source
end
