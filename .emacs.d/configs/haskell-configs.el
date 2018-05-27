;; via https://github.com/tibbe/haskell-style-guide/blob/master/haskell-style.el
(defun haskell-style-tibbe ()
  (interactive)
  (setq tab-width 4
        haskell-indentation-layout-offset 4
        haskell-indentation-left-offset 4
        haskell-indentation-ifte-offset 4
        haskell-indentation-where-pre-offset 4
        haskell-indentation-where-post-offset 4))

;; Haskell Intero
;; hindent needs to be installed via stack install hindent
;; stylish-haskell needs to be installed via stack install stylish-haskell
(use-package intero
  :ensure hindent
  :config
  (haskell-style-tibbe)
  (setq haskell-stylish-on-save t
        haskell-tags-on-save    t)
  (add-hook 'haskell-mode-hook 'intero-mode)
  (add-hook 'haskell-mode-hook 'hindent-mode))

;; Add Cabal bin to emacs path
(setenv "PATH" (concat (getenv "PATH") ":" (getenv "HOME") "/.cabal/bin" ":" (getenv "HOME") "/.local/bin"))
(setq exec-path (append exec-path (list (concat (getenv "HOME") "/.cabal/bin") (concat (getenv "HOME") "/.local/bin"))))

(provide 'haskell-configs)
