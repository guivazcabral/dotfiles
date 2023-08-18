## Dotfiles

Welcome to my dotfiles 🎉 here you'll find (some of) the configuration I use in my personal dev env.
This is very personal, as it relies heavily on my preferences.
It is also ever-changing so don't expect this to be super up to date.

<details>
  <summary>Kitty</summary>
  
  - Install [kitty](https://sw.kovidgoyal.net/kitty/binary/) 

  - Symlink `.config` folders:
    ```sh
    ln -s `dotfiles/kitty`
    ```

</details>


<details>
  <summary>Terminal things</summary>
  
  - Install fish
    ```sh
    brew install fish
    ```

  - Install [Zellij](https://zellij.dev/documentation/installation.html) 
    ```sh
    brew install zellij
    ```

  - Install [Exa](https://github.com/ogham/exa) 
    ```sh
    brew install exa
    ```

  - Symlink `.config` folders:
    ```sh
    ln -s `dotfiles/fish`
    ln -s `dotfiles/omf`
    ln -s `dotfiles/zellij`
    ```
  
</details>


<details>
  <summary>Karabiner</summary>
  
  - Download binary from [Karabiner](https://karabiner-elements.pqrs.org/) and install

  - Symlink `.config` folder:
    ```sh
    ln -s `dotfiles/karabiner`
    ```
  
</details>


<details>
  <summary>Neovim</summary>
  
  - Install [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) 
  
  - Symlink `.config` folder:
    ```sh
    ln -s `dotfiles/nvim`
    ```
  
  - Install utilities:
  
    ```sh
    brew install ripgrep
    brew install fzf
    npm install jsonlint -g
    ```
</details>

<details>
  <summary>Lazygit</summary>
  
  - Install Lazygit

    ```sh
    brew install lazygit
    ```

  - Create symlink for `/Users/guilherme/Library/Application\ Support/lazygit/config.yml` -> `dotfiles/lazygit/config.yml`
</details>

<details>
  <summary>Misc</summary>
  
  - Slack theme: 
    ```
    #11111B,#F8F8FA,#6C7086,#B4BEFE,#181825,#CDD6F4,#A6E3A1,#F38BA8,#11111B,#FAB387
    ```
  
</details>
