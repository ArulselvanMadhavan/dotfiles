;;; purescript-configs.el --- Arul's purescript configs

;;     _____
;;    (, /   )                        ,
;;     _/__ /     __   _  _   _  __    __  _/_
;;     /     (_(_/ (__(/_/_)_(__/ (__(_/_)_(__
;;  ) /                             .-/
;; (_/                             (_/

;;; Commentary:
;;; Code:

(add-to-list 'load-path "~/lib/emacs/purescript-mode/")
(require 'purescript-mode-autoloads)
(add-to-list 'Info-default-directory-list "~/lib/emacs/purescript-mode")


(use-package purescript-mode
  :ensure t
  :mode ("\\.purs$" . purescript-mode)
  :config
  (add-hook 'purescript-mode-hook 'turn-on-purescript-indentation)
  (with-eval-after-load 'purescript-indentation
    '(diminish 'purescript-indentation-mode)))

(use-package psc-ide
  :after purescript-mode
  :commands (psc-ide-mode psc-ide-server-start)
  :diminish psc-ide-mode
  :config
  (add-hook 'purescript-mode-hook (lambda()
                                    (psc-ide-mode)
                                    (company-mode)
                                    (flycheck-mode)
                                    (setq psc-ide-rebuild-on-save t)
                                    (psc-ide-server-start (locate-dominating-file default-directory "bower.json")))))

(use-package psci
  :after purescript-mode
  :ensure t
  :config
  (add-hook 'purescript-mode-hook 'inferior-psci-mode))

(provide 'purescript-configs)
;;; purescript-configs.el ends here
