;; Avy
(use-package avy
  :ensure t
  :bind
  ("M-g f" . avy-goto-line)
  ("M-g w" . avy-goto-word-1))


(use-package origami
  :init
  :config
  (add-hook 'origami-mode-hook
          (lambda()
             ;; (add-to-list 'origami-parser-alist '(typescript-mode . origami-c-style-parser))
            (define-key origami-mode-map (kbd "C-c C-c f") 'origami-recursively-toggle-node)
            (define-key origami-mode-map (kbd "C-c C-c a") 'origami-toggle-all-nodes)
            (define-key origami-mode-map (kbd "C-c C-c s") 'origami-show-only-node)
            (define-key origami-mode-map (kbd "C-c C-c o") 'origami-open-node)
            (define-key origami-mode-map (kbd "C-c C-c p") 'origami-open-node-recursively)
            (define-key origami-mode-map (kbd "C-c C-c k") 'origami-close-node-recursively)
            (define-key origami-mode-map (kbd "C-c C-c c") 'origami-close-node))))

(provide 'navigation-configs)
