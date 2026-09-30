if test -x /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv fish | source
end

fish_add_path -g ~/.local/bin

set -g fish_greeting

if type -q nvim
    set -gx EDITOR nvim
    set -gx VISUAL nvim
end
