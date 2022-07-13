(use-package multiple-cursors
  :commands (mc/mark-next-like-this mc/mark-previous-like-this mc/mark-all-like-this)
  :bind
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this)
  ("C-c C-<" . mc/mark-all-like-this))

(provide 'cursor-configs)
