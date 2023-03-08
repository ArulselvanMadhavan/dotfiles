;; Package Archives
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("melpa" . "https://melpa.org/packages/"))
      package-archive-priorities '(("melpa-stable" . 1)))

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
   '("aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "ce4234c32262924c1d2f43e6b61312634938777071f1129c7cde3ebd4a3028da" "afa47084cb0beb684281f480aa84dab7c9170b084423c7f87ba755b15f6776ef" "356e5cbe0874b444263f3e1f9fffd4ae4c82c1b07fe085ba26e2a6d332db34dd" default))
 '(haskell-stylish-on-save am-haskell-format-on-save)
 '(helm-completion-style 'helm)
 '(hindent-indent-size 4)
 '(hindent-line-length 100)
 '(hindent-reformat-buffer-on-save nil)
 '(hindent-style "johan-tibell")
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(ox-gfm eglot futhark-mode dockerfile-mode jupyter elpy rtags cmake-ide helm-projectile yaml-mode which-key treemacs-projectile treemacs doom-themes whitespace-cleanup-mode smartparens beacon flycheck-rust racer cargo toml-mode racket-mode cmake-mode utop use-package rjsx-mode projectile pdf-tools pcre2el origami org-journal multiple-cursors merlin magit lsp-ui ivy-erlang-complete imenu-anywhere idris-mode hydra hindent helm haskell-snippets flycheck-pos-tip flycheck-popup-tip flycheck-inline flycheck-cask exec-path-from-shell elscreen dante avy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
(put 'erase-buffer 'disabled nil)
