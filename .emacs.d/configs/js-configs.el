(use-package rjsx-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.jsx" . rjsx-mode))
  (add-to-list 'interpreter-mode-alist '("node" . rjsx-mode)))
