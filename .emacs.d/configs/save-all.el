;; Save All on focus out
(defun save-all ()
    (interactive)
    (save-some-buffers t))
(add-hook 'focus-out-hook 'save-all)

(provide' save-all)
