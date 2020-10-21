#!/bin/bash

# set -e

# Setting up in HOME directory
cd ~ || exit 1

DOTFILE_GITHUB_REPO="https://github.com/thuongleit/.dotfiles.git"
DOTFILES_ROOT="$(pwd -P)/.dotfiles"
export DOTFILES_ROOT
export DOTFILES_PLUGIN="$DOTFILES_ROOT/plugins"

info () {
    printf '\r  [ \033[00;34m->\033[0m ] %s\n' "$1"
}

ask () {
    printf '\r  [ \033[0;33m??\033[0m ] %s\n' "$1"
}

success () {
    printf '\r\033[2K  [ \033[00;32mOK\033[0m ] %s\n' "$1"
}

fail () {
    printf '\r\033[2K  [\033[0;31mFAIL\033[0m] %s\n' "$1"
}

is_admin() {
   (id -Gn "$1" | grep -q -w admin) >/dev/null 2>&1
}

is_macos() {
    test "$(uname -s)" = "Darwin"
}

check() {
    command -v "$1" >/dev/null 2>&1
}

help() {
    echo The script provides a simple stupid automated tool to auto-configure/update your Mac env from CLI.
    echo
    echo Commands:
    echo
    echo \[install\] $'\t\t' installs the given plugin \(or preconfigured plugins if no plugins provides\)
    echo \[uninstall\] $'\t\t' uninstalls the given plugin \(or preconfigured plugins if no plugins provides\)
    echo \[upgrade\] $'\t\t' upgrades the given plugin \(or preconfigured plugins if no plugins provides\)

    echo
    echo See also \"loading_plugins\" file to check/configure preconfigured plugins.
    echo
}

clone_dotfiles_repo() {
    cd ~ | exit 1
    git clone "$DOTFILE_GITHUB_REPO" "$DOTFILES_ROOT" >/dev/null 2>&1
    success "Cloned $DOTFILE_GITHUB_REPO into $DOTFILES_ROOT"
}
update_dotfiles_repo() {
    cd "$DOTFILES_ROOT" || exit 1
    git pull origin master >/dev/null 2>&1
    success "dotfiles repo is up-to-date."
}

check_system() {
    info "Checking system..."
    if is_admin "$(whoami)"; then
        if ! check brew; then
            info "Homebrew is missing. Installing..."
            /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
            success "Homebrew is installed."
        fi

        if ! check "xcode-select"; then
            info "Xcode Command Line Tools is missing. Installing..."
            xcode-select --install >/dev/null
            success "Xcode Command Line Tools is installed."
        fi

        if ! check git; then
            info "git is missing. Installing..."
            brew install git >/dev/null
            success "git is intalled." 
        fi
    fi

    # Check there is a cloned of dotfile repository?
    if [ ! -d "$DOTFILES_ROOT" ]; then
        clone_dotfiles_repo
    else
        # if the dotfiles folder is mine
        cd "$DOTFILES_ROOT"; git remote show origin | grep "thuongleit/.dotfiles.git" >/dev/null
        local repo_exists=$?
        if [ $repo_exists -eq 0 ]; then
            update_dotfiles_repo
        else
            fail "Another dotfiles folder exists. Aborting..."
            exit 1
        fi
    fi

    success "System OK"
}

link_file () {
    local src=$1 dst=$2

    local overwrite=backup=skip=
    local action=

    if [ -f "$dst" ] || [ -d "$dst" ] || [ -L "$dst" ]; then
        if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]; then
            local currentSrc=
            currentSrc="$(readlink "$dst")"

            if [ "$currentSrc" == "$src" ]; then
                skip=true
            else
                ask "File already exists: $dst ($(basename "$src")), what do you want to do?\\n\
                    [s]kip, [S]kip all, [o]verwite, '[O]verwrite all, [b]ack up, [B]ackup all?"

                read -r -n 1 action

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
            info "removed $dst"
        fi

        if [ "$backup" == "true" ]; then
            mv "$dst" "${dst}.backup"
            info "moved $dst to ${dst}.backup"
        fi

        if [ "$skip" == "true" ]; then
            info "skipped $src"
        fi
    fi

    if [ "$skip" != "true" ]; then
        ln -s "$src" "$dst"
        success "linked $1 to $2"
    fi
}

make_symlinks() {
    if [ $# -eq 0 ]; then
        fail "make_symlinks: Missing input"
    fi

    for src in $(find -H "$1" -name '*.symlink' -not -path '*.git*')
    do
        dst="$HOME/$(basename "${src%.*}")"
        link_file "$src" "$dst"
    done
}

change_shell() {
    local current_shell_path=
    current_shell_path="$(command -v zsh)"
    if [ "$SHELL" != "$current_shell_path" ]; then
        sudo sh -c "echo $(which zsh) >> /etc/shells"
        chsh -s "$current_shell_path"
        success "Changed shell to $1."
    fi
}

install_plugin() {
    if [ $# -eq 0 ]; then
        fail "install_plugin: Missing input"
        return 1
    fi

    local plugin_path="$DOTFILES_ROOT/plugins/$1"

    if [ ! -d "$plugin_path" ]; then
        fail "Plugin $1 does not exist."
        return 1
    else
        info "Install plugin $1..."
        make_symlinks "$plugin_path"

        local executing_script_path="${plugin_path}/install.sh"
        if [ -f "$executing_script_path" ]; then
            if [ ! -x "$executing_script_path" ]; then
                chmod +x "$executing_script_path"
            fi

            sh -c "$executing_script_path"
        fi

        success "Installed"
    fi
}

update_plugin() {
    if [ $# -eq 0 ]; then
        fail "update_plugin: Missing input"
        return 1
    fi

    local plugin_path="$DOTFILES_ROOT/plugins/$1"

    if [ ! -d "$plugin_path" ]; then
        fail "Plugin $1 does not exist."
        return 1
    else
        info "Update plugin $1..."
        make_symlinks "$plugin_path"

        local executing_script_path="${plugin_path}/update.sh"
        if [ -f "$executing_script_path" ]; then
            if [ ! -x "$executing_script_path" ]; then
                chmod +x "$executing_script_path"
            fi

            sh -c "$executing_script_path"
        fi

        success "Updated"
    fi
}

uninstall_plugin() {
    if [ $# -eq 0 ]; then
        fail "update_plugin: Missing input"
        return 1
    fi

    local plugin_path="$DOTFILES_ROOT/plugins/$1"

    if [ ! -d "$plugin_path" ]; then
        fail "Plugin $1 does not exist."
        return 1
    else
        info "Uninstall plugin $1..."
        # make_symlinks "$plugin_path"
        local executing_script_path="${plugin_path}/uninstall.sh"
        if [ -f "$executing_script_path" ]; then
            if [ ! -x "$executing_script_path" ]; then
                chmod +x "$executing_script_path"
            fi

            sh -c "$executing_script_path"
        fi

        success "Uninstalled"
    fi
}

update_homebrew() {
    info "Updating apps and dependencies..."

    brew update
    brew upgrade
    brew doctor

    if ! brew bundle check; then
        brew bundle install
    fi

    success "Apps and dependencies is up-to-date."
}

if ! is_macos; then
    fail "Sorry, we only support macOS at the moment."
    exit 1
fi

is_success_command=false
if [ "$1" = "help" ]; then
    help
else 
    loading_plugins=$(< "$DOTFILES_ROOT"/loading_plugins)

    overwrite_all=false backup_all=false skip_all=false
    if [ $# -eq 0 ] || [ "$1" = "install" ]; then
        is_success_command=true
        # check our system first to see whether dependencies have been installed or not
        check_system

        # install plugins
        if [ -z "$2" ]; then
            for plugin in ${loading_plugins[*]}
            do
                install_plugin "$plugin"
            done
        else
            if ! install_plugin "$2"; then
                is_success_command=false
            fi
        fi

        # Change shell to zsh if need
        # info "Changing default shell..."
        # change_shell
        # success "Default shell changed."
        update_homebrew
    elif [ "$1" = "update" ]; then
        is_success_command=true

        update_dotfiles_repo

        if [ -z "$2" ]; then
            for plugin in ${loading_plugins[*]}
            do
                update_plugin "$plugin"
            done
        else
            if ! update_plugin "$2"; then
                is_success_command=false
            fi
        fi

        update_homebrew 
    elif [ "$1" = "uninstall" ]; then
        is_success_command=true
        if [ -z "$2" ]; then
            for plugin in ${loading_plugins[*]}
            do
                uninstall_plugin "$plugin"
            done
        else
            if ! uninstall_plugin "$2"; then
                is_success_command=false
            fi
        fi

        update_homebrew 
    else
        help
    fi
fi

if [ "$is_success_command" = "true" ]; then
    echo "Done. Note that some of these changes require a logout/restart to take effect."
    echo "---------- YAY! Enjoy your new workspace!!! ----------"
fi
