;; (use-package scala-mode
;;   :mode "\\.s\\(cala\\|bt\\)$")

;; (use-package sbt-mode
;;   :commands sbt-start sbt-command
;;   :config
;;   ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
;;   ;; allows using SPACE when in the minibuffer
;;   (substitute-key-definition
;;    'minibuffer-complete-word
;;    'self-insert-command
;;    minibuffer-local-completion-map))

;; (use-package lsp-mode
;;   :pin melpa-stable
;;   :ensure t)

;; (use-package lsp-ui
;;   :pin melpa-stable
;;   :ensure t
;;   :hook (lsp-mode . lsp-ui-mode))

;; (use-package lsp-scala
;;   :load-path "~/lib/emacs/lsp-scala"
;;   :after scala-mode
;;   :demand t
;;   :hook (scala-mode . lsp-scala-enable))

;;; scala-configs ends here
(provide 'scala-configs)
