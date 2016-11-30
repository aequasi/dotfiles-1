#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_apps() {

    # Install tools for compiling/building software from source.

    install_package "Build Essential" "build-essential"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # GnuPG archive keys of the Debian archive.

    install_package "GnuPG archive keys" "debian-archive-keyring"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Software which is not included by default
    # in Ubuntu due to legal or copyright reasons.

    #install_package "Ubuntu Restricted Extras" "ubuntu-restricted-extras"

    printf "\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Brotli" "brotli"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "cURL" "curl"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Flash" "flashplugin-installer"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "GIMP" "gimp"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Git" "git"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "GNOME Vim" "vim-gnome"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "ImageMagick" "imagemagick"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! package_is_installed "opera"; then

        add_key "https://deb.opera.com/archive.key" \
            || print_error "Opera (add key)"

        add_to_source_list "https://deb.opera.com/opera-stable/ stable non-free" "opera.list" \
            || print_error "Opera (add to package resource list)"

        update &> /dev/null \
            || print_error "Opera (resync package index files)" \

    fi

    # Automatically answer `Yes` to the `package configuration` prompt.
    # https://github.com/alrra/dotfiles/issues/17

    printf "opera-stable opera-stable/add-deb-source boolean true\n" \
        | sudo debconf-set-selections

    install_package "Opera" "opera-stable"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "ShellCheck" "shellcheck"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "tmux" "tmux"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Transmission" "transmission"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "VLC" "vlc"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "xclip" "xclip"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Zopfli" "zopfli"

}

main() {

    print_in_purple "   Miscellaneous\n\n"

    update
    upgrade
    printf "\n"
    install_apps
    printf "\n"
    autoremove

}

main
