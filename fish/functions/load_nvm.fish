function load_nvm --on-variable="PWD"
    if test -e ".nvmrc"
        nvm use >/dev/null 2>&1
    else if test -e "app/.nvmrc"
        nvm use `cat app/.nvmrc` >/dev/null 2>&1
    end
end
