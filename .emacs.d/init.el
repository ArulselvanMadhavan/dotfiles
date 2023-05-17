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
   '("51c71bb27bdab69b505d9bf71c99864051b37ac3de531d91fdad1598ad247138" "636b135e4b7c86ac41375da39ade929e2bd6439de8901f53f88fde7dd5ac3561" "0c08a5c3c2a72e3ca806a29302ef942335292a80c2934c1123e8c732bb2ddd77" "9d29a302302cce971d988eb51bd17c1d2be6cd68305710446f658958c0640f68" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "7a424478cb77a96af2c0f50cfb4e2a88647b3ccca225f8c650ed45b7f50d9525" "a9abd706a4183711ffcca0d6da3808ec0f59be0e8336868669dc3b10381afb6f" "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "251ed7ecd97af314cd77b07359a09da12dcd97be35e3ab761d4a92d8d8cf9a71" "f64189544da6f16bab285747d04a92bd57c7e7813d8c24c30f382f087d460a33" "570263442ce6735821600ec74a9b032bc5512ed4539faf61168f2fdf747e0668" "f053f92735d6d238461da8512b9c071a5ce3b9d972501f7a5e6682a90bf29725" "5b9a45080feaedc7820894ebbfe4f8251e13b66654ac4394cb416fef9fdca789" "1aa4243143f6c9f2a51ff173221f4fd23a1719f4194df6cef8878e75d349613d" "5586a5db9dadef93b6b6e72720205a4fa92fd60e4ccfd3a5fa389782eab2371b" "4ff1c4d05adad3de88da16bd2e857f8374f26f9063b2d77d38d14686e3868d8d" "2078837f21ac3b0cc84167306fa1058e3199bbd12b6d5b56e3777a4125ff6851" "ddffe74bc4bf2c332c2c3f67f1b8141ee1de8fd6b7be103ade50abb97fe70f0c" "bf948e3f55a8cd1f420373410911d0a50be5a04a8886cabe8d8e471ad8fdba8e" "70b596389eac21ab7f6f7eb1cf60f8e60ad7c34ead1f0244a577b1810e87e58c" "1cae4424345f7fe5225724301ef1a793e610ae5a4e23c023076dc334a9eb940a" "545ab1a535c913c9214fe5b883046f02982c508815612234140240c129682a68" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "ce4234c32262924c1d2f43e6b61312634938777071f1129c7cde3ebd4a3028da" "afa47084cb0beb684281f480aa84dab7c9170b084423c7f87ba755b15f6776ef" "356e5cbe0874b444263f3e1f9fffd4ae4c82c1b07fe085ba26e2a6d332db34dd" default))
 '(haskell-stylish-on-save am-haskell-format-on-save)
 '(helm-completion-style 'helm)
 '(hindent-indent-size 4)
 '(hindent-line-length 100)
 '(hindent-reformat-buffer-on-save nil)
 '(hindent-style "johan-tibell")
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(protobuf-mode tree-sitter-langs cargo-mode company-racer ox-gfm eglot futhark-mode dockerfile-mode jupyter elpy rtags cmake-ide helm-projectile yaml-mode which-key treemacs-projectile treemacs doom-themes whitespace-cleanup-mode smartparens beacon flycheck-rust racer cargo toml-mode racket-mode cmake-mode utop use-package rjsx-mode projectile pdf-tools pcre2el origami org-journal multiple-cursors merlin magit lsp-ui ivy-erlang-complete imenu-anywhere idris-mode hydra hindent helm haskell-snippets flycheck-pos-tip flycheck-popup-tip flycheck-inline flycheck-cask exec-path-from-shell elscreen dante avy)))
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
