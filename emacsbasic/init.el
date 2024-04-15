;; Very basic config for use on the command line
;; as of Emacs 29 load with --init-directory

(setq
     inhibit-startup-screen t
     ;; Get rid of all noises
     ring-bell-function 'ignore
     ;; I might be a beginner, but I know what the scratch buffer is.
     initial-scratch-message nil
     ;; One space should be enough for anyone 
     sentence-end-double-space nil
     ;; Delete the whole line and following newline
     kill-whole-line t
)

;; Accept 'y' in lieu of 'yes'.
(defalias 'yes-or-no-p 'y-or-n-p)
;; Overwrite selected text
(delete-selection-mode t)
;; Line numbers everywhere
(global-display-line-numbers-mode t)
;; Soft line wrapping - only in text modes?
(global-visual-line-mode 1)
;; Show the matching brackets
(show-paren-mode)
;; Also show the column/character position in the modeline
(column-number-mode)
;; No need for tool or menu bar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Prefer a cursor bar to block, guess it's what I'm used to.
(setq-default cursor-type 'bar)

;; Make sure it's all UTF8
(set-charset-priority 'unicode)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

;; Don't keep accidental changes
(setq custom-file null-device)

;; Don't leave backups scattered about
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
