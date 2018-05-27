;; PDF tools install
;; (use-package pdf-tools
;;   :ensure t
;;   :config
;;   (custom-set-variables
;;     '(pdf-tools-handle-upgrades nil)) ; Use brew upgrade pdf-tools instead.
;;   (setq pdf-info-epdfinfo-program "/usr/local/bin/epdfinfo"))
;; (pdf-tools-install) ;; On Ubuntu, I built it from source

;; https://github.com/jwiegley/use-package
(use-package pdf-tools
  :load-path "~/pdf-tools/lisp"
  :config
  (pdf-tools-install))
