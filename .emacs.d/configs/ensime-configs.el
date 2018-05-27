;; Scala Mode newline comments
(defun scala-mode-newline-comments ()
  "Custom newline appropriate for `scala-mode'."
  ;; shouldn't this be in a post-insert hook?
  (interactive)
  (newline-and-indent)
  (scala-indent:insert-asterisk-on-multiline-comment))

(use-package ensime
  :ensure t
  :pin melpa-stable)

(defun ensime-sbt-do-fmt ()
  "WORKAROUND"
  (interactive)
  (sbt:command "scalafmt"))

(bind-key "C-c C-v F" 'ensime-sbt-do-fmt scala-mode-map)

;; Scala Mode hook
(add-hook 'scala-mode-hook
          (lambda ()
            (show-paren-mode)
            (smartparens-mode)
            (yas-minor-mode)
            (company-mode)
            (ensime-mode)
            (scala-mode:goto-start-of-code)))

(bind-key "RET" 'scala-mode-newline-comments scala-mode-map)
(provide 'ensime-configs)
