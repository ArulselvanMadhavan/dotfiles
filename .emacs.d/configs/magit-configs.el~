;; https://github.com/inkel/emacs-d/blob/master/init.el
(use-package magit
  :commands magit-status
  :bind
  ("C-c g m" . magit-status)
  :config
  (setq magit-view-git-manual-method 'man)
  (progn
    (defun inkel/magit-log-edit-mode-hook ()
      (setq fill-column 72)
      (flyspell-mode t)
      (turn-on-auto-fill))
    (add-hook 'magit-log-edit-mode-hook 'inkel/magit-log-edit-mode-hook)))
