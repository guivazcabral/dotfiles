function load_nvm --on-variable="PWD"
    if test -e ".nvmrc"
        fnm use >/dev/null 2>&1
    end
end
