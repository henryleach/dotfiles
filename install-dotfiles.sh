#!/bin/sh

# Creates hidden symlinks to all regular files found in
# the sub-directory 'common', plus any sub-folder that matches
# the system's 'uname'
# Hidden files from the source dir are ignored.
# WARNING: It will OVERWRITE files with matching names in the home dir.

createFileSymLinks(){
# Create the symlinks for files in dir $1

    find "$1" -maxdepth 1 -type f -not -name '*.' |
	while read -r file; do
	    ln -sf "$(realpath "$file")" "$HOME/.$(basename "$file")" && \
	    echo "Linked $(realpath "$file") $HOME/.$(basename "$file")";
	done
}

echo "Common:"
createFileSymLinks "common"

system=$(uname)
echo "$system specific:"
createFileSymLinks "$system"

# Default to $HOME/.config if no XDG_CONFIG_HOME is set
# for things like fish that expect their config there.
xdg_config_dir="${XDG_CONFIG_HOME-$HOME/.config}"


createDirSymLinks(){
    find "xdg_config" ! -path "$1" -maxdepth 1 -type d -or -type f -not -name '.*' |
	while read -r dir; do
	    ln -sf "$(realpath "$dir")" "$xdg_config_dir/$(basename "$dir")" && \
	    echo "Linked $(realpath "$dir") $xdg_config_dir/$(basename "$dir")";
	done
}

echo "Linking XDG Config files into $xdg_config_dir :"
createDirSymLinks "xdg_config"

