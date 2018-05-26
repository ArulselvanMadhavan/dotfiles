(use-package helm-config
  :ensure helm
  :init
  (global-unset-key (kbd "C-x c"))
  :bind (("M-x" . helm-M-x)
         ("M-y" . helm-show-kill-ring)
         ("M-s o" . helm-occur)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-mini)
         ("C-c h" . helm-command-prefix)
         :map helm-map
         ("C-j" . helm-select-action)
         ("C-i" . helm-execute-persistent-action)
         ("C-j" . helm-select-action))
  :config
  (setq helm-ff-skip-boring-files t)
  (use-package helm-mode
    :diminish helm-mode
    :init
    (helm-mode 1)
    ;; (helm-autoresize-mode 1)
    :config
    (setq helm-ff-file-name-history-use-recentf t)
    (setq helm-split-window-in-side-p           t)
    (setq helm-move-to-line-cycle-in-source     t)
    (setq helm-ff-search-library-in-sexp        t)
    (setq helm-scroll-amount                    8)
    (setq helm-echo-input-in-header-line        t)
    (setq helm-buffers-fuzzy-matching           t)
    (setq helm-recentf-fuzzy-match              t)
    (setq helm-autoresize-max-height 0)
    (setq helm-autoresize-min-height 20)
    ;; Add word at point as default to helm-man-woman
    (add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)))
(provide 'helm-configs)
