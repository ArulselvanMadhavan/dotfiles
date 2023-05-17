;; Rust Setup

;; toml setup
(use-package toml-mode)

;; Cargo setup
(use-package cargo
  :config
  (add-hook 'toml-mode-hook #'cargo-minor-mode))

;; Racer setup - https://github.com/racer-rust/emacs-racer
;; (use-package racer
;;   :config
;;   (add-hook 'racer-mode-hook #'eldoc-mode)
;;   (add-hook 'racer-mode-hook #'company-mode)
;;   (setq company-tooltip-align-annotations t)
;;   :bind (:map rust-mode-map
;;               ("TAB" . company-indent-or-complete-common)
;;               ("C-c C-d" . racer-describe)))

;; FlyCheck for rust
;; (use-package flycheck-rust
;;   :config
;;   (with-eval-after-load 'rust-mode
;;     (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

;; Enable flycheck inline error reporting.
;; (use-package flycheck-inline
;;   :config
;;   (with-eval-after-load 'flycheck
;;     (flycheck-inline-mode)))

(use-package tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package cargo-mode
  :config
  (add-hook 'rust-mode-hook 'cargo-minor-mode))

(use-package rust-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
  (setq rust-format-on-save t)
  (add-hook 'rust-mode-hook 'cargo-minor-mode)
  (add-hook 'rust-mode-hook 'eglot-ensure)
  (add-hook 'rust-mode-hook (lambda()
                              (prettify-symbols-mode)
                              (setq indent-tabs-mode nil)
                              (cargo-minor-mode))))

(use-package rustic
  :custom
  (rustic-analyzer-command '("rustup" "run" "stable" "rust-analyzer"))
  :config
  (setq rustic-lsp-client 'eglot)
  (add-hook 'eglot--managed-mode-hook (lambda () (flymake-mode -1))))

(provide 'rust-configs)
