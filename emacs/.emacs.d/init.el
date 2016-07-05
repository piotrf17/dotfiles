;; .emacs 

;;; PATH SETUP
(defconst my-home "/home/piotrf/")
(defconst local-bin "/usr/local/bin/")
(defconst emacs-root (concat my-home ".emacs.d/"))
(defconst emacs-site-lisp "/usr/share/emacs/site-lisp/")

(defun local-path (p)
  (let ((default-directory (concat emacs-root p)))
    (add-to-list 'load-path default-directory)
    (normal-top-level-add-subdirs-to-load-path)))
(defun site-lisp-path (p)
  (let ((default-directory (concat emacs-site-lisp p)))
    (add-to-list 'load-path default-directory)
    (normal-top-level-add-subdirs-to-load-path)))

(local-path "libs")      ;; Personal elisp setup stuff
(local-path "languages") ;; Language-specific configs
(local-path "site-lisp") ;; elisp stuff I find on the tubes

;;; LIBRARIES

;; Basic customization.
(load-library "my-utilities")
(load-library "my-keys")
(load-library "my-fonts")
(load-library "my-options")

;; Languages.
(load-library "my-c")
(load-library "my-c++")
(load-library "my-javascript")
(load-library "my-python")
(load-library "my-scala")

;; Other tools.
(load-library "my-ido")
(load-library "my-org")
