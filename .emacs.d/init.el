;; Package Archives
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("melpa" . "https://melpa.org/packages/"))
package-archive-priorities '(("melpa-stable" . 1)))

;; Package Initialize
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install use-package))

(eval-when-compile (require 'use-package))

;; No need to add :ensure t in all packages
(setq use-package-always-ensure t)
(setq use-package-verbose t)

;; Global Variables
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t
      create-lockfiles nil
      make-backup-files nil
      column-number-mode t
      scroll-error-top-bottom t
      show-paren-delay 0.5
      use-package-always-ensure t
      sentence-end-double-space nil
      ensime-startup-notification nil
      apropos-sort-by-scores t)

;; Global Key bindings
(global-set-key (kbd "C-x 8 l") "λ")
(global-set-key (kbd "C-x 8 p") "Π")
(global-set-key (kbd "C-x 8 s") "Σ")
(global-set-key (kbd "C-c C-k") 'describe-char)
;; This is used by helm. So, this needs to be loaded first  before helm is loaded.
(setq completion-ignored-extensions
      (append completion-ignored-extensions
              (quote
                 (".elc" ".ibc"))))

;; Buffer local variables
(setq-default indent-tabs-mode nil ;; Turn off tabs and prefer spaces
	      tab-width 2
	      c-basic-offset 2)

;; Modes
(electric-indent-mode +1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Load configs directory - https://www.emacswiki.org/emacs/LoadingLispFiles
(defun load-directory (dir)
  (let ((load-it (lambda (f)
		  (load-file (concat (file-name-as-directory dir) f)))
		))
  (mapc load-it (directory-files dir nil "\\.el$"))))

(load-directory "~/.emacs.d/configs")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("6b289bab28a7e511f9c54496be647dc60f5bd8f9917c9495978762b99d8c96a0" "3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" default)))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-stylish-on-save am-haskell-format-on-save)
 '(haskell-tags-on-save t)
 '(hindent-indent-size 4)
 '(hindent-line-length 100)
 '(hindent-reformat-buffer-on-save nil)
 '(hindent-style "johan-tibell")
 '(ivy-erlang-complete-erlang-root "/usr/local/lib/erlang/")
 '(package-selected-packages
   (quote
    (company-distel delight flycheck-tip flymd list-unicode-display utop tuareg-mode caml tuareg doom-themes company-lsp lsp-haskell lsp-mode lsp-ui haskell-cabal racket-mode which-key dante haskell-snippets yaml-mode helm-dictionary org-journal leuven-theme toml-mode toml-mode rjsx-mode helm-command imenu-anywhere xref-js2 use-package undo-tree twilight-anti-bright-theme treemacs-projectile tide smartparens racer popup-imenu pdf-tools pcre2el origami org magit js2-refactor intero idris-mode hindent highlight-symbol helm-projectile goto-chg flycheck-rust flycheck-cask expand-region exec-path-from-shell eshell-prompt-extras ensime cargo beacon))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'erase-buffer 'disabled nil)
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))


;; Setting up Fonts for use with Agda/PLFA
;;
;; default to DejaVu Sans Mono,
(set-face-attribute 'default nil
		    :family "DejaVu Sans Mono"
		    :height 120
		    :weight 'normal
		    :width  'normal)

;; fix \:
(set-fontset-font "fontset-default"
		  (cons (decode-char 'ucs #x2982)
			(decode-char 'ucs #x2982))
		  "STIX")


(eval-after-load "quail/latin-ltx"
  '(mapc (lambda (pair)
           (quail-defrule (car pair) (cadr pair) "TeX"))
	 '( ("\\bb" "𝔹") ("\\bl" "𝕃") ("\\bs" "𝕊")
	    ("\\dotminus" "∸")
	    ("\\bt" "𝕋") ("\\bv" "𝕍") ("\\cv" " O ")
      ("\\comp" "∘") ("\\m" "⟼") ("\\om" "ω"))))
