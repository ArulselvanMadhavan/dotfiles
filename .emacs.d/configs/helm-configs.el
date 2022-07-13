(use-package elscreen
  :ensure t)

(use-package helm
  :ensure t
  :pin melpa-stable
  :after
  (elscreen)
  :init
  (helm-mode 1)
  (helm-autoresize-mode 1)
  :commands
  (helm-M-x
   helm-find-files
   helm-mini
   helm-elscreen)
  :config
  (setq helm-autoresize-max-height 0)
  (setq helm-autoresize-min-height 30)
  ;; Fuzzy match
  (setq helm-mode-fuzzy-match t)
  (setq helm-M-x-fuzzy-match t)
  (setq helm-recentf-fuzzy-match t)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-mini-fuzzy-match t)
  (setq helm-imenu-fuzzy-match t)
  (setq helm-apropos-fuzzy-match t)
  (setq helm-semantic-fuzzy-match t)
  (setq helm-ff-skip-boring-files t)
  (setq helm-split-window-in-side-p       t
    helm-move-to-line-cycle-in-source     t
    helm-ff-search-library-in-sexp        t
    helm-scroll-amount                    8
    helm-ff-file-name-history-use-recentf t
    helm-echo-input-in-header-line        t)
  (require 'helm-config)
  :bind
  (("M-x" . helm-M-x)
  ("C-x C-f" . helm-find-files)
  ("C-x C-b" . helm-mini)
    :map helm-map
    ;Ergo keys
    ("<tab>" . helm-execute-persistent-action)
    :map helm-buffer-map
    ("C-k" . helm-delete-current-selection)
    ("C-c C-k" . helm-delete-current-selection)
    ;Ergo keys
    ("<tab>" . helm-execute-persistent-action)
    :map helm-etags-map
    ;Ergo keys
    ("<tab>" . helm-execute-persistent-action)
    :map helm-generic-files-map
    ;Ergo keys
    ("<tab>" . helm-execute-persistent-action)
    :map helm-grep-map
    ;Ergo keys
    ("<tab>" . helm-execute-persistent-action)
    :map helm-find-files-map
    ("C-/" . helm-ff-run-find-sh-command)
    ("M-g" . helm-ff-run-grep)
    ;Ergo keys
    ("<tab>" . helm-execute-persistent-action)))

(use-package helm-projectile
  :ensure t)

(provide 'helm-configs)
