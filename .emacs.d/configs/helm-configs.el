;; A very different interface from IDO which is the default
;; Assumes elscreen is included first
;; (use-package helm
;;   ; get it from package.el
;;   :ensure t
;;   :after (
;;           elscreen
;;     ); after
;;   :commands (
;;     helm-mode
;;     helm-apropos
;;     helm-buffers-list
;;     helm-elscreen
;;     helm-find-files
;;     helm-imenu
;;     helm-M-x
;;     helm-mini
;;     helm-occur-from-isearch
;;     helm-resume
;;     helm-semantic-or-imenu
;;    ) ; end :commands
;;   :init
;;   (helm-mode 1)
;;   (helm-autoresize-mode 1)
;;   :config
;;     ;auto resize, and set resize limits
;;     (setq helm-autoresize-max-height 0)
;;     (setq helm-autoresize-min-height 20)

;;     (setq helm-buffer-max-length nil)

;;     ;fuzzy matching
;;     ;nearly everything (global helm mode)
;;     (setq helm-mode-fuzzy-match t)
;;     ;(setq helm-completion-in-region-fuzzy-match t)
;;     ;M-x commands
;;     (setq helm-M-x-fuzzy-match t)
;;     ;in the recentf
;;     (setq helm-recentf-fuzzy-match t)
;;     ;in buffer list
;;     (setq helm-buffers-fuzzy-matching t)
;;     ;in minibuffer (needs helm-buffers-fuzzy-matching also)
;;     (setq helm-mini-fuzzy-match t)
;;     ;in imenu
;;     (setq helm-imenu-fuzzy-match t)
;;     ;in apropos
;;     (setq helm-apropos-fuzzy-match t)
;;     ;in semantic
;;     (setq helm-semantic-fuzzy-match t)
;;     ; skip boring files in find-files
;;     (setq helm-ff-skip-boring-files t)

;;     ; settings that I copied over from previous version
;;     (setq helm-split-window-in-side-p       t
;;       helm-move-to-line-cycle-in-source     t
;;       helm-ff-search-library-in-sexp        t
;;       helm-scroll-amount                    8
;;       helm-ff-file-name-history-use-recentf t
;;       helm-echo-input-in-header-line        t)

;;     ;key to enter command
;;     ;this conflicts with almost everything, but since it's not the mechanism we use to access helm commands
;;     ;it works to simply change the default mapping that does have conflicts
;;     (setq helm-command-prefix "C-c m")

;;     ; May be used to move minibuffer to the top of helm window in helm mode
;;     (defun spacemacs//helm-hide-minibuffer-maybe ()
;;       "Hide minibuffer in Helm session if we use the header line as input field."
;;       (when (with-helm-buffer helm-echo-input-in-header-line)
;;         (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
;;           (overlay-put ov 'window (selected-window))
;;           (overlay-put ov 'face
;;                        (let ((bg-color (face-background 'default nil)))
;;                          `(:background ,bg-color :foreground ,bg-color)))
;;           (setq-local cursor-type nil))))

;;     ;This puts what we type in the minibuffer at the top of the helm window and keeps the minibuffer limited
;;     ;to one line without wrapping.  If used with the defun above, it simply moves the minibuffer to the top
;;     ;(setq helm-echo-input-in-header-line t)

;;     ;hide the minibuffer when in helm if we have it visible at the top of the helm window
;;     (add-hook 'helm-minibuffer-set-up-hook
;;               'spacemacs//helm-hide-minibuffer-maybe)

;;     ; MUST be done last
;;     (require 'helm-config)
;;  :bind (
;;     ;default helm keybinding is C-x c which is almost C-x C-c that's used to exit emacs.
;;     ("C-x c" . nil)
;;     ;override buffer list keys to use helm version
;;     ;; ("C-x C-b" . helm-buffers-list)
;;     ;use helm-mini instead of helm-buffers-list since it includes recently visited files also
;;     ("C-x C-b" . helm-mini)
;;     ;resume the last session again
;;     ("C-c C-c" . helm-resume)
;;     ;finding files uses helm
;;     ("C-x C-f" . helm-find-files)
;;     ;Map M-x to the helm version
;;     ("M-x" . helm-M-x)
;;     ; imenu is a code buffer org/completion engine
;;     ("C-;" . helm-semantic-or-imenu)
;;     ; use helm for the apropos help handling
;;     ("C-h a" . helm-apropos)

;;     ;override a key in the isearch map
;;     :map isearch-mode-map
;;     ;trigger multi-occur in the minibuffer
;;     ("C-o" . helm-occur-from-isearch)

;;     ;; ;add to elscreen map
;;     ;; :map elscreen-map
;;     ;; ("C-b" . helm-elscreen)

;;     ;swap these around so C-e says "do everything" and C-z brings up the action list
;;     ;rebind tab to run persistent actions
;;     :map helm-map
;;     ;Ergo keys
;;     ("M-i" . helm-previous-line)
;;     ("M-k" . helm-next-line)
;;     ("M-j" . helm-previous-source)
;;     ("M-l" . helm-next-source)
;;     ("M-I" . helm-previous-page)
;;     ("M-K" . helm-next-page)
;;     ("<tab>" . helm-execute-persistent-action)
;;     ("C-z" . helm-select-action)
    
;;     :map helm-buffer-map
;;     ("C-k" . helm-delete-current-selection)
;;     ("C-c C-k" . helm-delete-current-selection)
;;     ;Ergo keys
;;     ("M-i" . helm-previous-line)
;;     ("M-k" . helm-next-line)
;;     ("M-j" . helm-previous-source)
;;     ("M-l" . helm-next-source)
;;     ("M-I" . helm-previous-page)
;;     ("M-K" . helm-next-page)
;;     ("<tab>" . helm-execute-persistent-action)
;;     ("C-z" . helm-select-action)
    
;;     :map helm-etags-map
;;     ;Ergo keys
;;     ("M-i" . helm-previous-line)
;;     ("M-k" . helm-next-line)
;;     ("M-j" . helm-previous-source)
;;     ("M-l" . helm-next-source)
;;     ("M-I" . helm-previous-page)
;;     ("M-K" . helm-next-page)
;;     ("<tab>" . helm-execute-persistent-action)
;;     ("C-z" . helm-select-action)
    

;;     :map helm-generic-files-map
;;     ;Ergo keys
;;     ("M-i" . helm-previous-line)
;;     ("M-k" . helm-next-line)
;;     ("M-j" . helm-previous-source)
;;     ("M-l" . helm-next-source)
;;     ("M-I" . helm-previous-page)
;;     ("M-K" . helm-next-page)
;;     ("<tab>" . helm-execute-persistent-action)
;;     ("C-z" . helm-select-action)
    
;;     :map helm-buffers-ido-virtual-map
;;     ;Ergo keys
;;     ("M-i" . helm-previous-line)
;;     ("M-k" . helm-next-line)
;;     ("M-j" . helm-previous-source)
;;     ("M-l" . helm-next-source)
;;     ("M-I" . helm-previous-page)
;;     ("M-K" . helm-next-page)
;;     ("<tab>" . helm-execute-persistent-action)
;;     ("C-z" . helm-select-action)
    
;;     :map helm-grep-map
;;     ;Ergo keys
;;     ("M-i" . helm-previous-line)
;;     ("M-k" . helm-next-line)
;;     ("M-j" . helm-previous-source)
;;     ("M-l" . helm-next-source)
;;     ("M-I" . helm-previous-page)
;;     ("M-K" . helm-next-page)
;;     ("<tab>" . helm-execute-persistent-action)
;;     ("C-z" . helm-select-action)
    
;;     :map helm-find-files-map
;;     ("C-/" . helm-ff-run-find-sh-command)
;;     ("M-g" . helm-ff-run-grep)
;;     ;Ergo keys
;;     ("M-i" . helm-previous-line)
;;     ("M-k" . helm-next-line)
;;     ("M-j" . helm-previous-source)
;;     ("M-l" . helm-next-source)
;;     ("M-I" . helm-previous-page)
;;     ("M-K" . helm-next-page)
;;     ("<tab>" . helm-execute-persistent-action)
;;     ("C-z" . helm-select-action)
    

;;     ;used during helm-regexp
;;     :map helm-moccur-map
;;     ;Ergo keys
;;     ("M-i" . helm-previous-line)
;;     ("M-k" . helm-next-line)
;;     ("M-j" . helm-previous-source)
;;     ("M-l" . helm-next-source)
;;     ("M-I" . helm-previous-page)
;;     ("M-K" . helm-next-page)
;;     ("<tab>" . helm-execute-persistent-action)
;;     ("C-z" . helm-select-action)
;;     ) ;end of :bind
;;   ) ; end of use-package

; Limits helm buffer size to window size
(use-package elscreen
  :ensure t)

(use-package helm
  :ensure t
  :pin melpa-stable
  :after
  (elscreen)
  :init
  (helm-mode 1)
  (helm-autoresize-mode 1)
  :commands
  (helm-M-x
   helm-find-files
   helm-mini
   helm-elscreen)
  :config
  (setq helm-autoresize-max-height 0)
  (setq helm-autoresize-min-height 30)
  ;; Fuzzy match
  (setq helm-mode-fuzzy-match t)
  (setq helm-M-x-fuzzy-match t)
  (setq helm-recentf-fuzzy-match t)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-mini-fuzzy-match t)
  (setq helm-imenu-fuzzy-match t)
  (setq helm-apropos-fuzzy-match t)
  (setq helm-semantic-fuzzy-match t)
  (setq helm-ff-skip-boring-files t)
  (setq helm-split-window-in-side-p       t
    helm-move-to-line-cycle-in-source     t
    helm-ff-search-library-in-sexp        t
    helm-scroll-amount                    8
    helm-ff-file-name-history-use-recentf t
    helm-echo-input-in-header-line        t)
  (require 'helm-config)
  :bind
  (("M-x" . helm-M-x)
  ("C-x C-f" . helm-find-files)
  ("C-x C-b" . helm-mini)
    :map helm-map
    ;Ergo keys
    ("<tab>" . helm-execute-persistent-action)
    :map helm-buffer-map
    ("C-k" . helm-delete-current-selection)
    ("C-c C-k" . helm-delete-current-selection)
    ;Ergo keys
    ("<tab>" . helm-execute-persistent-action)
    :map helm-etags-map
    ;Ergo keys
    ("<tab>" . helm-execute-persistent-action)
    :map helm-generic-files-map
    ;Ergo keys
    ("<tab>" . helm-execute-persistent-action)
    :map helm-buffers-ido-virtual-map
    ("<tab>" . helm-execute-persistent-action)
    :map helm-grep-map
    ;Ergo keys
    ("<tab>" . helm-execute-persistent-action)
    :map helm-find-files-map
    ("C-/" . helm-ff-run-find-sh-command)
    ("M-g" . helm-ff-run-grep)
    ;Ergo keys
    ("<tab>" . helm-execute-persistent-action)
    ;used during helm-regexp
    :map helm-moccur-map
    ;Ergo keys
    ("<tab>" . helm-execute-persistent-action)))

(provide 'helm-configs)
