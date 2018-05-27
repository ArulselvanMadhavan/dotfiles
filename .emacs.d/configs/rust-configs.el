;; Rust Setup
(use-package cargo
  :init
  (add-hook 'rust-mode-hook 'cargo-minor-mode)
  (add-hook 'toml-mode-hook 'cargo-minor-mode))

(use-package racer
  :init
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)
  :config
  (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
  (setq racer-cmd "~/.cargo/bin/racer"))

;; FlyCheck for rust
(use-package flycheck-rust
  :ensure t
  :init
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; (use-package rust-mode)
;; (add-hook 'rust-mode-hook (lambda()
;;                             (racer-mode)
;;                             (flycheck-rust-setup)
;;                             (flycheck-mode +1)
;;                             (setq flycheck-check-syntax-automatically '(mode-enabled save new-line idle-change) flycheck-idle-change-delay 0.8)
;;                             (local-set-key (kbd "C-c C-v F") #'rust-format-buffer)
;;                             (setq rust-format-on-save t)))

(provide 'rust-configs)
