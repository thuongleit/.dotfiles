#!/bin/sh

# Setting up in HOME folder
cd ~
DOTFILE_ROOT="$(pwd -P)/.dotfiles"

set -e
export DOTFILE_ROOT="$DOTFILE_ROOT"

echo "Setting up your Mac"

check_system (){
    # Check Homebrew and install it if need
    # if whoami is admin
    if [ $(is_admin "$(whoami)") ]; then
        if [ ! $(which brew) ]; then
            echo "Installing Homebrew..."
            /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
            brew doctor
            echo
        else
            echo "Updating Homebrew..."
            brew update; brew upgrade
            echo
        fi

        # Check Xcode Command Line Tools and install it if need
        if [ ! $(xcode-select -p) ]; then
            echo "Installing Xcode Command Line Tools..."
            xcode-select --install
            echo
        fi

        # Check git
        if [ ! $(which git) ]; then
            echo "Installing git..."
            brew install git
            echo
        fi
    fi

    # Check there is a cloned of dotfile repository?
    local dotfile_github_repo="https://github.com/thuongleit/.dotfiles.git"
    if [ ! -d "$DOTFILE_ROOT" ]; then
        echo "Clone dotfiles repositoty..."
        git clone "$dotfile_github_repo" "$DOTFILE_ROOT"
        cd "$DOTFILE_ROOT"
        echo
    else
        # if the dotfiles folder is mine
        if [ -f "$DOTFILE_ROOT/.thuongleit" ]; then
            echo "Updating your dotfiles repository..."
            cd "$DOTFILE_ROOT"
            git pull origin master
            echo
        else
            echo "Another dotfiles folder exists. Backing it up..."
            mv "$DOTFILE_ROOT" "${DOTFILE_ROOT}.backup"
            echo "Clone dotfiles repository..."
            git clone "$dotfile_github_repo" "$DOTFILE_ROOT"
            cd "$DOTFILE_ROOT"
            echo
        fi
    fi
}

link_file () {
    local src=$1 dst=$2

    local overwrite= backup= skip=
    local action=

    if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]; then
        if [ "$overwrite_all" == "false" -a "$backup_all" == "false" -a "$skip_all" == "false" ]; then
            local currentSrc="$(readlink $dst)"

            if [ "$currentSrc" == "$src" ]; then
                skip=true
            else
                user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
                    [s]kip, [S]kip all, [o]verwite, '[O]verwrite all, [b]ack up, [B]ackup all?"

                read -n 1 action

                case "$action" in
                    o )
                        overwrite=true
                        ;;
                    O )
                        overwrite_all=true
                        ;;
                    b )
                        backup=true
                        ;;
                    B )
                        backup_all=true
                        ;;
                    s )
                        skip=true
                        ;;
                    S )
                        skip_all=true
                        ;;
                    * )
                        ;;
                esac
            fi
        fi

        overwrite=${overwrite:-$overwrite_all}
        backup=${backup:-$backup_all}
        skip=${skip:-$skip_all}

        if [ "$overwrite" == "true" ]; then
            rm -rf "$dst"
            success "removed $dst"
        fi

        if [ "$backup" == "true" ]; then
            mv "$dst" "${dst}.backup"
            success "moved $dst to ${dst}.backup"
        fi

        if [ "$skip" == "true" ]; then
            success "skipped $src"
        fi
    fi

    if [ "$skip" != "true" ]; then
        ln -s "$src" "$dst"
        success "linked $1 to $2"
    fi
}

install_dotfiles (){
    info "Installing dotfiles..."

    if [ "$(uname -s)" == "Darwin" ]; then
        # Link symlink files
        local overwrite_all=false backup_all=false skip_all=false

        echo "Make symlink..."
        for src in $(find -H "$DOTFILE_ROOT" -name '*.symlink' -not -path '*.git*')
        do
           dst="$HOME/$(basename "${src%.*}")"
           link_file "$src" "$dst"
        done

        # Run install scripts of all modules
        echo "Run installation scripts from modules..."
        find ./modules -name install.sh | while read installer ; do sh -c "${installer}" ; done
    fi
}

# active global functions when executing the script
source $DOTFILE_ROOT/global_functions.sh

check_system
install_dotfiles

# Change shell to zsh if need
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Changing shell to zsh..."
    chsh -s $(which zsh)
fi

# Active the env
source ~/.zshrc

echo ---------- YAY! Enjoy your MAC ----------
