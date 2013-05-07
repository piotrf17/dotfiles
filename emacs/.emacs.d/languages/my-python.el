;; Python

;; Python Hook
(add-hook 'python-mode-hook
	  '(lambda ()
	     (setq indent-tabs-mode nil)
	     (setq tab-width 2)
	     (setq python-indent 2)))
