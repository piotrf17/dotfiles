;; C++

(require 'google-c-style)

(add-hook 'c++-mode-hook
	  '(lambda ()
	     (setq c-default-style "google")))

(setq auto-mode-alist (cons '("\\.cu\\'" . c++-mode) auto-mode-alist ))