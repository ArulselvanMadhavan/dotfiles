(use-package company
  :diminish company-mode
  :commands company-mode
  :init
  (setq company-tooltip-align-annotations t
        company-dabbrev-ignore-case nil
        company-dabbrev-code-ignore-case nil
        company-dabbrev-downcase nil
        company-idle-delay 0.5
        company-minimum-prefix-length 2)
  :config
  (define-key company-active-map [tab] nil)
  (define-key company-active-map (kbd "TAB") nil))

(provide 'company-configs)
