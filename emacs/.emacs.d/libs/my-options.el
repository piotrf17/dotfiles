;; General emacs options.

;; Generic behavior options.
(setq inhibit-startup-message t)
(auto-compression-mode 1)  ;; Allows editing .gz, etc. files on the fly.
(delete-selection-mode t)  ;; Deletes selection instead of killing it.
(setq x-select-enable-clipboard t) ;; Play nicely with clipboard.

;; GUI customization.
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode t)  ;; Display column number as well as line number.
(setq frame-title-format "%b")  ;; Show buffer filename in titlebar.

;; GUI colors.
(set-background-color "black")
(set-border-color "blue")
(set-cursor-color "red")
(set-foreground-color "white")
(set-mouse-color "red")
(set-face-foreground `highlight "white")

;; Prefer utf-8 everywhere.
(setq buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-file-name-coding-system 'utf-8)
(setq default-keyboard-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq default-sendmail-coding-system 'utf-8)
(setq default-terminal-coding-system 'utf-8)

;; Font-lock syntactic coloring.
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;; External comamnds.
(setq latex-run-command "pdflatex")  ;; Use pdflatex by default.

;; Matches balanced parenthesis.
(require 'paren)
(show-paren-mode 1)

;; Backup files.
(setq make-backup-files t)
(setq version-control t)
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

(provide 'my-options)