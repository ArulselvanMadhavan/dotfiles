

;; Just basic package requires.
;; Rest of the config is handled in opam-user-setup
(use-package tuareg
  :ensure t
  :mode (("\\.ml[ily]?$" . tuareg-mode)
         ("\\.topml$" . tuareg-mode)))

(use-package utop
  :ensure t)

(use-package merlin
  :ensure t)
