
(use-package lsp-mode
  :ensure t)

(use-package lsp-ui
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))
