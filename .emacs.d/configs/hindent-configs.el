(defvar am-haskell-format-on-save t)
(defvar haskell-stylish-on-save)
(defvar hindent-reformat-buffer-on-save)

(defun amToggleHaskellFormatOnSave () "."
       (interactive)
       (setq am-haskell-format-on-save (not am-haskell-format-on-save))
       (custom-set-variables
        '(haskell-stylish-on-save am-haskell-format-on-save)
        '(hindent-reformat-buffer-on-save nil))
       (message "haskell-stylish-on-save: %s; hindent-reformat-buffer-on-save: %s"
                haskell-stylish-on-save hindent-reformat-buffer-on-save))

(use-package hindent
  :ensure t
  :config
  (progn
    (add-hook 'haskell-mode-hook 'hindent-mode)
    (custom-set-variables
     '(hindent-indent-size 4)
     '(hindent-line-length 100)
     '(hindent-style "johan-tibell")
     '(haskell-stylish-on-save am-haskell-format-on-save)
     '(hindent-reformat-buffer-on-save nil))))

(provide 'am-haskell-format)
