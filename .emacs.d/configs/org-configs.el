(use-package org
  :config
  (add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
  (setq org-todo-keywords
	(quote ((sequence "TODO(t)" "INPROGRESS(n)" "|" "DONE(d)")
          (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)"))))
  (setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("INPROGRESS" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold))))
  (setq org-log-into-drawer t)
  (add-to-list 'org-src-lang-modes '("idris" . "idris")))

(provide 'org-configs)
