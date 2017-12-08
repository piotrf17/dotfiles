;; Org-mode configuration.

(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cs" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cb" 'org-iswitchb)
(define-key global-map "\C-cc" 'org-capture)
(setq org-log-done t)

(setq org-agenda-files '("/home/piotrf/pim/todo/inbox.org"
                         "/home/piotrf/pim/todo/gtd.org"
                         "/home/piotrf/pim/todo/tickler.org"))

(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "/home/piotrf/pim/todo/inbox.org" "Tasks")
                               "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline "/home/piotrf/pim/todo/tickler.org" "Tickler")
                               "* %i%? \n %U")))

(setq org-refile-targets '(("/home/piotrf/pim/todo/gtd.org" :maxlevel . 3)
                           ("/home/piotrf/pim/todo/someday.org" :level . 1)
                           ("/home/piotrf/pim/todo/tickler.org" :maxlevel . 2)))

(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

(setq org-agenda-custom-commands 
      '(("t" "All tasks" todo ""
         ((org-agenda-overriding-header "All tasks")
          (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first)))))

(defun my-org-agenda-skip-all-siblings-but-first ()
  "Skip all but the first non-done entry."
  (let (should-skip-entry)
    (unless (org-current-is-todo)
      (setq should-skip-entry t))
    (save-excursion
      (while (and (not should-skip-entry) (org-goto-sibling t))
        (when (org-current-is-todo)
          (setq should-skip-entry t))))
    (when should-skip-entry
      (or (outline-next-heading)
          (goto-char (point-max))))))
		  
(defun org-current-is-todo ()
  (string= "TODO" (org-get-todo-state)))

(provide 'my-org)
