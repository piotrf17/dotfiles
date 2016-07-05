;; Org-mode configuration.

(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cs" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cb" 'org-iswitchb)
(define-key global-map "\C-cc" 'org-capture)
(setq org-log-done t)
(setq org-agenda-files (list "~/pim/todo/todo.org"))

;; setup capture
(setq org-default-notes-file "~/pim/todo/todo.org")
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-ct"
  (lambda () (interactive) (org-capture nil "t")))

(provide 'my-org)
