;;Load Theme
(add-hook 'after-init-hook
          (lambda() (load-theme 'leuven t)
            (setq org-fontify-whole-heading-line t)))

(provide 'theme-configs)
