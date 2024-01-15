
;; (use-package lsp-mode
;;   :ensure t)

;; (use-package lsp-ui
;;   :config
;;   (add-hook 'lsp-mode-hook 'lsp-ui-mode))

;; (setq package-selected-packages '(lsp-mode yasnippet lsp-treemacs helm-lsp
;;     projectile hydra flycheck company avy which-key helm-xref dap-mode))

;; (when (cl-find-if-not #'package-installed-p package-selected-packages)
;;   (package-refresh-contents)
;;   (mapc #'package-install package-selected-packages))

;; ;; sample `helm' configuration use https://github.com/emacs-helm/helm/ for details
;; (helm-mode)
;; (require 'helm-xref)
;; (define-key global-map [remap find-file] #'helm-find-files)
;; (define-key global-map [remap execute-extended-command] #'helm-M-x)
;; (define-key global-map [remap switch-to-buffer] #'helm-mini)

;; (which-key-mode)
;; (add-hook 'c-mode-hook 'lsp)
;; (add-hook 'c++-mode-hook 'lsp)

;; (setq gc-cons-threshold (* 100 1024 1024)
;;       read-process-output-max (* 1024 1024)
;;       treemacs-space-between-root-nodes nil
;;       company-idle-delay 0.0
;;       company-minimum-prefix-length 1
;;       lsp-idle-delay 0.1)  ;; clangd is fast

;; (with-eval-after-load 'lsp-mode
;;   (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
;;   (require 'dap-cpptools)
;;   (yas-global-mode))

;; (require 'eglot)
;; (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
;; (add-hook 'c-mode-hook 'eglot-ensure)
;; (add-hook 'c++-mode-hook 'eglot-ensure)
;; (add-hook 'before-save-hook 'eglot-format-buffer -10 t)
;; (add-hook 'after-save-hook 'eglot-format-buffer)
;; ;; FORTRAN - fortls
;; (add-to-list
;;  'eglot-server-programs
;;  '(f90-mode . ("fortls" "--notify_init" "--nthreads=4")))

;; (require 'yasnippet)
;; (yas-global-mode 1)

;; (provide 'lsp-configs)

;; ONE-KEY
(add-to-list 'load-path "~/.emacs.d/site-lisp/one-key")
(require 'one-key)
(setq one-key-popup-window nil)
;;;###autoload
(defmacro lazy-one-key-create-menu (title &rest keybinds)
  (let (one-key-key-alist)
    (dolist (ele keybinds)
      (autoload (plist-get ele :command) (plist-get ele :filename) nil t)
      (push
       (cons (cons (plist-get ele :key) (plist-get ele :description)) (plist-get ele :command))
       one-key-key-alist))
    `(one-key-create-menu ,title (quote ,one-key-key-alist))))


;; LSP-BRIDGE
;; https://github.com/EvanMeek/.emacs.d/blob/e1ceef48f03358b4c262c5b983702d114e5498b2/site-lisp/config/init-lsp-bridge.el
(add-to-list 'load-path "~/.emacs.d/site-lisp/lsp-bridge")
(require 'lsp-bridge)
(require 'yasnippet)
(setq lsp-bridge-c-lsp-server "clangd")

(setq acm-enable-icon t
      acm-enable-doc t
      acm-enable-yas t
      acm-enable-tempel nil
      acm-enable-quick-access nil
      acm-enable-search-file-words nil
      acm-enable-telega nil
      acm-enable-tabnine nil
      acm-enable-codeium nil
      lsp-bridge-enable-signature-help t
      lsp-bridge-enable-hover-diagnostic t
      lsp-bridge-enable-diagnostics t
      lsp-bridge-enable-mode-line nil
      lsp-bridge-signature-show-function 'message
      lsp-bridge-signature-posframe-params  '(:poshandler posframe-poshandler-point-bottom-left-corner-upward :internal-border-width 1 :max-width 30 :max-height 12)
      lsp-bridge-lookup-doc-tooltip-max-width 60
      lsp-bridge-lookup-doc-tooltip-max-height 20
      )

(setq lsp-zig-zls-executable "/snap/bin/zls")
(setq lsp-bridge-c-lsp-server "clangd")
(setq lsp-bridge-python-lsp-server "pyright")
(setq lsp-bridge-multi-lang-server-extension-list nil)
(setq lsp-bridge-single-lang-server-extension-list nil)
(add-to-list 'lsp-bridge-single-lang-server-extension-list '(("jsx" "ts" "js" "tsx") . "typescript"))
(add-to-list 'lsp-bridge-single-lang-server-extension-list '(("vue") . "volar"))
(add-hook 'before-save-hook 'lsp-bridge-code-format t)

(one-key-create-menu "Diagnostic"
		     '((("n" . "Next diagnostic") . lsp-bridge-diagnostic-jump-next)
		       (("p" . "Previous diagnostic") . lsp-bridge-diagnostic-jump-prev)
		       (("l" . "Show all diagnostic") . lsp-bridge-diagnostic-list)))


(defun lsp-bridge-toggle-debug ()
  (interactive)
  (setq lsp-bridge-enable-debug (not lsp-bridge-enable-debug)
	lsp-bridge-enable-log (not lsp-bridge-enable-log)))

(defun lsp-bridge-toggle-diagnostics ()
  (interactive)
  (setq-local lsp-bridge-enable-diagnostics (not lsp-bridge-enable-diagnostics))
  (message "lsp-bridge-enable-diagnostics: %s" lsp-bridge-enable-diagnostics))

(add-hook 'lsp-bridge-mode-hook '(lambda ()
				   (yas-minor-mode t)
				   (electric-pair-mode t)
				   (electric-quote-mode t)
				   (keymap-set lsp-bridge-mode-map "M-n" '("Scroll doc down" . lsp-bridge-popup-documentation-scroll-down))
				   (keymap-set lsp-bridge-mode-map "M-p" '("Scroll doc up" . lsp-bridge-popup-documentation-scroll-up))))

(lazy-one-key-create-menu "Code"
			  (:key "h" :description "Show document" :command lsp-bridge-popup-documentation :filename "init-lsp-bridge")
			  (:key "j" :description "Scroll doc up" :command lsp-bridge-popup-documentation-scroll-up :filename "init-lsp-bridge")
			  (:key "k" :description "Scroll doc down" :command lsp-bridge-popup-documentation-scroll-down :filename "init-lsp-bridge")
			  (:key "s" :description "Toggle sdcv" :command lsp-bridge-toggle-sdcv-helper :filename "init-lsp-bridge")
			  (:key "f" :description "Format code" :command apheleia-format-buffer :filename "init-format")
			  (:key "d" :description "Lsp Bridge jump to def" :command lsp-bridge-find-def :filename "init-lsp-bridge")
			  (:key "D" :description "Lsp Bridge jump to def other window" :command lsp-bridge-find-def-other-window :filename "init-lsp-bridge")
			  (:key "b" :description "Lsp Bridge jump back" :command lsp-bridge-find-def-return :filename "init-lsp-bridge")
			  (:key "r" :description "Lsp Bridge find reference" :command lsp-bridge-find-references :filename "init-lsp-bridge")
			  (:key "n" :description "Lsp Bridge rename" :command lsp-bridge-rename :filename "init-lsp-bridge")
			  (:key "i" :description "Lsp Bridge find impl" :command lsp-bridge-find-impl :filename "init-lsp-bridge")
			  (:key "I" :description "Lsp Bridge find impl other window" :command lsp-bridge-find-impl-other-window :filename "init-lsp-bridge")
			  (:key "a" :description "Lsp Bridge code action" :command lsp-bridge-code-action :filename "init-lsp-bridge")
			  (:key "E" :description "Lsp Bridge toggle diagnostics" :command lsp-bridge-toggle-diagnostics :filename "init-lsp-bridge")
			  (:key "`" :description "Add Fold code" :command vimish-fold :filename "init-vimish-fold")
			  (:key "~" :description "Delete Fold code" :command vimish-fold-delete :filename "init-vimish-fold"))

;; (call-interactively 'global-lsp-bridge-mode)
(provide 'lsp-configs)
