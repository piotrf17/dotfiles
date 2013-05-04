;; Custom Keys

(global-set-key "\C-cl" 'goto-line)
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\M-h" 'backward-kill-word)
(global-set-key "\M-n" 'other-window)

(global-set-key [f2] 'compile)
(global-set-key [f5] 'revert-all-buffers)
(global-set-key [f11] 'fullscreen)

(global-set-key [(mouse-5)] 'scroll-up-half)
(global-set-key [(mouse-4)] 'scroll-down-half)

(provide 'my-keys)