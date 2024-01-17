set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# git
set -g __fish_git_prompt_char_cleanstate '✔'
set -g __fish_git_prompt_char_dirtystate '✚'
set -g __fish_git_prompt_char_invalidstate '✖'
set -g __fish_git_prompt_char_stagedstate '●'
set -g __fish_git_prompt_char_stashstate '⚑'
set -g __fish_git_prompt_char_untrackedfiles '?'
set -g __fish_git_prompt_char_upstream_ahead ''
set -g __fish_git_prompt_char_upstream_behind ''
set -g __fish_git_prompt_char_upstream_diverged ﱟ
set -g __fish_git_prompt_char_upstream_equal ''

alias ll 'eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld 'eza -lhD --icons=auto' # long list dirs
alias un '$aurhelper -Rns' # uninstall package
alias up '$aurhelper -Syu' # update system/package/aur
alias pl '$aurhelper -Qs' # list installed package
alias pa '$aurhelper -Ss' # list available package
alias pc '$aurhelper -Sc' # remove unused cache
alias po '$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -
alias vc 'code --disable-gpu' # gui code editor
alias gd "git diff --name-only --relative --diff-filter=d | xargs bat --diff"


# aliases
alias ls 'eza -1   --icons=auto' # short list
alias la "ls -A"
alias lla "ll -A"

alias l 'eza -lh  --icons=auto' # long list
alias ll "eza -l -g --icons"
alias g git
alias cat bat
alias py python
alias pn pnpm

command -qv nvim && alias v nvim

set -gx EDITOR nvim
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
    status --is-command-substitution; and return

    if test -f .nvmrc; and test -r .nvmrc
        nvm use
    else
    end
end


# chips
if [ -e ~/.config/chips/build.fish ]
    . ~/.config/chips/build.fish
end

# fly.io
set -x FLYCTL_INSTALL "/home/bmo/.fly"
set -x PATH "$FLYCTL_INSTALL/bin" $PATH

function fish_greeting

    # choose the node version
    nvm use lts/hydrogen >/dev/null

    # show some pokemons at the start up
    pokemon-colorscripts --no-title -r 1,3,6

    # add rust to global variable
    source "$HOME/.cargo/env"
end
