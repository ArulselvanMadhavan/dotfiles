;;
(use-package racket-mode
  :ensure t
  :config
  (setq tab-always-indent 'complete)    ;Always indent on tab completion.
  (add-hook 'racket-mode-hook
            (lambda ()
              (setq show-trailing-whitespace t)
              (show-paren-mode)
              (prettify-symbols-mode)
              (flycheck-mode)
              (yas-minor-mode)
              (company-mode)
              (smartparens-strict-mode)
              (racket-unicode-input-method-enable)))
  (add-hook 'racket-repl-mode-hook #'racket-unicode-input-method-enable))

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (setq show-trailing-whitespace t)
            (show-paren-mode)
            (prettify-symbols-mode)
            (eldoc-mode)
            (flycheck-mode)
            (yas-minor-mode)
            (company-mode)
            (smartparens-strict-mode)))

(provide 'racket-configs)
