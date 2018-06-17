;;; purescript-configs.el --- Arul's purescript configs

;;     _____
;;    (, /   )                        ,
;;     _/__ /     __   _  _   _  __    __  _/_
;;     /     (_(_/ (__(/_/_)_(__/ (__(_/_)_(__
;;  ) /                             .-/
;; (_/                             (_/

;;; Commentary:
;;; Code:
(use-package purescript-mode
  :commands (purescript-mode turn-on-purescript-indentation)
  :ensure t
  :mode "\\.purs\\'"
  :config
  (add-hook 'purescript-mode-hook 'turn-on-purescript-indentation)
  (with-eval-after-load 'purescript-indentation
    '(diminish 'purescipt-indentation-mode))
  :bind ("C-c C-c" . purescript-compile))

(use-package psc-ide
  :after purescript-mode
  :commands psc-ide-mode
  :diminish psc-ide-mode
  :config
  (add-hook 'purescript-mode-hook 'psc-ide-mode))

(use-package psci
  :after purescript-mode
  :ensure t
  :config
  (add-hook 'purescript-mode-hook 'inferior-psci-mode))

(provide 'purescript-configs)
;;; purescript-configs.el ends here
