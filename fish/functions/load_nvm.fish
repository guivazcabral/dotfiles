function load_nvm --on-variable="PWD"
    if test -e ".nvmrc"
        nvm use
    else if test -e "app/.nvmrc"
        nvm use `cat app/.nvmrc`
    end
end
