status is-interactive; or return

if type -q nvim
    abbr -a vi nvim
    abbr -a vim nvim
end
abbr -a bu 'brew update; and brew upgrade'
