;; Copied from here: http://haroldcarr.com/posts/2017-10-24-emacs-haskell-dev-env.html

(use-package haskell-mode
  :ensure t
  :defer t
  ;; :commands (haskell-interactive-switch
  ;;            haskell-process-do-type
  ;;            haskell-process-do-info
  ;;            haskell-process-cabal-build
  ;;            haskell-compile)
  ;; :bind (:map haskell-mode-map
  ;;             ("C-c C-z" . haskell-interactive-switch)
  ;;             ("C-c C-n C-t" . haskell-process-do-type)
  ;;             ("C-c C-n C-i" . haskell-process-do-info)
  ;;             ("C-c C-n C-c" . haskell-process-cabal-build)
  ;;             ("C-c C-o" . haskell-compile))
  :config (custom-set-variables '(haskell-tags-on-save t)
                                ;; '(haskell-process-suggest-remove-import-lines t)
                                ;; '(haskell-process-auto-import-loaded-modules t)
                                ;; '(haskell-process-log t)
                                ))

(use-package haskell-snippets
  :ensure t
  :defer t)

(provide 'haskell-configs)
