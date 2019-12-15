
(use-package lsp-mode
  :ensure t)

(use-package lsp-ui
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))


(use-package lsp-haskell
  :config
  (add-hook 'haskell-mode-hook #'lsp)
  (add-hook 'haskell-mode-hook 'flycheck-mode)
  (setq lsp-haskell-process-path-hie "hie-wrapper"))
