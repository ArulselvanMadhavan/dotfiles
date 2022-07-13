;; Save All on focus out

(defun save-all ()
    (interactive)
    (save-some-buffers t))
(add-hook 'focus-out-hook 'save-all)

;; Turn off auto-save.
(setq auto-save-default t)
(setq auto-save-visited-file-name t)

(provide' save-configs)
