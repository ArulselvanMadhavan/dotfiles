(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  :config
  (setq flycheck-check-syntax-automatically '(mode-enabled save idle-change new-line))
  (setq flycheck-idle-change-delay 0.8))

(use-package hydra
  :defer 2
  :bind ("C-c f" . hydra-flycheck/body))

(defhydra hydra-flycheck (:color blue)
  "
  ^
  ^Errors^
  ^──────^
  _<_ previous
  _>_ next
  _l_ list
  _q_ quit
  ^^
  "
  ("q" nil)
  ("<" flycheck-previous-error :color pink)
  (">" flycheck-next-error :color pink)
  ("l" flycheck-list-errors))

(use-package flycheck-inline
  :ensure t)

(use-package flycheck-pos-tip
  :ensure t)

(use-package flycheck-popup-tip
  :ensure t)

(provide 'flycheck-configs)
