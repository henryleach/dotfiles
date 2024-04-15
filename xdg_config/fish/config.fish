if status is-interactive
    # Commands to run in interactive sessions can go here
    theme_gruvbox dark hard
end

# Like aliases
abbr emin 'emacs --no-site-lisp --no-splash -nw --init-directory ~/.dotfiles/emacsbasic'
abbr gnc 'git add . && git nccommit && git push'
abbr gup 'git fetch && git pull'
abbr du 'du -ch'
abbr df 'df -h'
abbr yank 'xclip -i -r -selection "clipboard"'
abbr xpaste 'xclip -o -selection "clipboard"'

function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function multicd

function fish_greeting
	 set -f os (set_color brred; uname; set_color normal)
	 set -f now_date (date)
	 echo Welcome to Fish! on $os $now_date
end

switch (uname)
       case FreeBSD
       	    abbr goodnight 'doas shutdown -p now'
end
