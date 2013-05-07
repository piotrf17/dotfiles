;; .emacs 

;;; PATH SETUP
(defconst my-home "/home/piotrf/")
(defconst local-bin "/usr/local/bin/")
(defconst emacs-root (concat my-home ".emacs.d/"))
(defconst emacs-site-lisp "/usr/share/emacs/site-lisp/")

(let ((default-directory emacs-root))
  (setq load-path (cons emacs-root load-path))
  (normal-top-level-add-subdirs-to-load-path))

;; Add all the elisp directories under ~/.emacs.d to my load path.
(defun local-path (p)
  (add-to-list 'load-path (concat emacs-root p)))
(defun site-lisp-path (p)
  (add-to-list 'load-path (concat emacs-site-lisp p)))

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
(load-library "my-org")
