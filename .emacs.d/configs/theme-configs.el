;;Load Theme
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (doom-themes-visual-bell-config)
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

(add-hook 'after-init-hook
          (lambda() (load-theme 'doom-vibrant t)))

(provide 'theme-configs)
