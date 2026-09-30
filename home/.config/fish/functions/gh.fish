function gh --wraps gh --description '1Password-backed GitHub CLI'
    if type -q op
        op plugin run -- gh $argv
    else
        command gh $argv
    end
end
