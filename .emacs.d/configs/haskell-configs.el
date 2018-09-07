;; Copied from here: http://haroldcarr.com/posts/2017-10-24-emacs-haskell-dev-env.html
(use-package haskell-mode
  :ensure t
  :defer t
  :config
  (setq haskell-stylish-on-save t))

(use-package haskell-snippets
  :ensure t
  :defer t)

(provide 'haskell-configs)
