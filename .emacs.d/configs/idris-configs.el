;; Idris
(use-package idris-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.idr\\'" . idris-mode))
  (defun my-idris-mode-hook ()
  (add-to-list 'display-buffer-alist
               '(".*". (display-buffer-reuse-window . ((reusable-frames . t)))))
  (setq idris-stay-in-current-window-on-compiler-error t)
  (setq idris-prover-restore-window-configuration t)

  (add-to-list 'frames-only-mode-kill-frame-when-buffer-killed-buffer-list "*idris-repl*")
  (add-to-list 'frames-only-mode-kill-frame-when-buffer-killed-buffer-list "*idris-notes*")
  (add-to-list 'frames-only-mode-kill-frame-when-buffer-killed-buffer-list "*idris-info*")
  (add-to-list 'frames-only-mode-kill-frame-when-buffer-killed-buffer-list "*idris-holes*")
  (add-hook 'idris-mode-hook #'my-idris-mode-hook)))

(provide 'idris-configs)
