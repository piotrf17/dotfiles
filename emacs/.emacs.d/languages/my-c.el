;; C

(require 'google-c-style)
(require 'whitespace)

(add-hook 'c-mode-common-hook 
	  '(lambda ()
	     (setq indent-tabs-mode nil)
	     (setq comment-style 'multi)
	     (setq whitespace-style '(face lines))
	     (setq whitespace-line-column 80)
	     (whitespace-mode 1)
	     (google-set-c-style)
	     (google-make-newline-indent)))