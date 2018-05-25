(use-package helm
  :requires helm-config
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-mini)
         ("C-c h" . helm-command-prefix)
         :map helm-command-map
         ("<tab>" . helm-execute-persistent-action)
         ("C-i" . helm-execute-persistent-action)
         ("C-b" . helm-select-action)))

(provide 'helm-configs)
