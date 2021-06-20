;; Font customizations.

;; face color properties
(set-background-color "black")
(set-border-color "blue")
(set-cursor-color "red")
(set-foreground-color "white")
(set-mouse-color "red")
(set-face-foreground `highlight "white")

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(bold ((t (:bold t :foreground "NavyBlue"))))
 '(region ((t (:foreground "black" :background "yellow")))))

;; set my startup font
(set-frame-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-13-*-*-*-m-0-iso10646-1")
(set-fontset-font "fontset-default" '(#xe03b . #xe076) "quickscript")

(provide 'my-fonts)
