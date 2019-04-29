;; Rust Setup

;; toml setup
(use-package toml-mode)

;; Cargo setup
(use-package cargo
  :config
  (add-hook 'toml-mode-hook #'cargo-minor-mode))

;; Racer setup - https://github.com/racer-rust/emacs-racer
(use-package racer
  :requires rust-mode
  :init (setq racer-rust-src-path
              (concat (string-trim
                       (shell-command-to-string "rustc --print sysroot"))
                      "/lib/rustlib/src/rust/src")) 
  :config
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)
  (setq company-tooltip-align-annotations t)
  :bind (:map rust-mode-map
              ("TAB" . company-indent-or-complete-common)
              ("C-c C-d" . racer-describe)))

;; FlyCheck for rust
(use-package flycheck-rust
  :config
  (with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

;; Enable flycheck inline error reporting.
;; (use-package flycheck-inline
;;   :config
;;   (with-eval-after-load 'flycheck
;;     (flycheck-inline-mode)))

(use-package rust-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
  (setq rust-format-on-save t)
  (add-hook 'rust-mode-hook (lambda()
                              (cargo-minor-mode)
                              (racer-mode))))
