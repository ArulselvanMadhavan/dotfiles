(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  :config
  (setq flycheck-check-syntax-automatically '(mode-enabled save idle-change new-line))
  (setq flycheck-idle-change-delay 0.8))

(provide 'flycheck-configs)
