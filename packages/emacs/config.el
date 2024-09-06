(global-display-line-numbers-mode 1)

(use-package doom-themes
 :ensure t
 :config
 ;; Global settings (defaults)
 (setq doom-themes-enable-bold t
       doom-themes-enable-italic t)
 (load-theme 'doom-ayu-dark t)
 (doom-themes-treemacs-config))

(use-package all-the-icons
 :if (display-graphic-p))
