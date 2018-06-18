(use-package exec-path-from-shell 
  :ensure t
  :config
  (exec-path-from-shell-initialize))

;; Eshell extras
(with-eval-after-load "esh-opt"
  (autoload 'epe-theme-dakrone "eshell-prompt-extras")
  (setq eshell-highlight-prompt nil
        eshell-prompt-function 'epe-theme-dakrone))

(provide 'eshell-configs)
