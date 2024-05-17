function load_nvm --on-variable="PWD"
    if test -e ".nvmrc"
        fnm use
    end
end
