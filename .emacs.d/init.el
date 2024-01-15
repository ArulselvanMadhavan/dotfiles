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
   '("6e03b7f86fcca5ce4e63cda5cd0da592973e30b5c5edf198eddf51db7a12b832" "3fe4861111710e42230627f38ebb8f966391eadefb8b809f4bfb8340a4e85529" "db510eb70cf96e3dbd48f5d24de12b03db30674ea0853f06074d4ccf7403d7d3" "77515a438dc348e9d32310c070bfdddc5605efc83671a159b223e89044e4c4f1" "b99e334a4019a2caa71e1d6445fc346c6f074a05fcbb989800ecbe54474ae1b0" "8d8207a39e18e2cc95ebddf62f841442d36fcba01a2a9451773d4ed30b632443" "1f126eb4a1e5d6b96b3faf494c8c490f1d1e5ad4fc5a1ce120034fe140e77b88" "05d009b7979e3887c917ef6796978d1c3bbe617e6aa791db38f05be713da0ba0" "da75eceab6bea9298e04ce5b4b07349f8c02da305734f7c0c8c6af7b5eaa9738" "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" "cb39485fd94dabefc5f2b729b963cbd0bac9461000c57eae454131ed4954a8ac" "5e402ccb94e32d7d09e300fb07a62dc0094bb2f16cd2ab8847b94b01b9d5e866" "b5cff93c3c6ed12d09ce827231b0f5d4925cfda018c9dcf93a2517ce3739e7f1" "57d7e8b7b7e0a22dc07357f0c30d18b33ffcbb7bcd9013ab2c9f70748cfa4838" "5eb4b22e97ddb2db9ecce7d983fa45eb8367447f151c7e1b033af27820f43760" "aad7fd3672aad03901bf91e338cd530b87efc2162697a6bef79d7f8281fd97e3" "6a674ffa24341f2f129793923d0b5f26d59a8891edd7d9330a258b58e767778a" "4c8372c68b3eab14516b6ab8233de2f9e0ecac01aaa859e547f902d27310c0c3" "1a094b79734450a146b0c43afb6c669045d7a8a5c28bc0210aba28d36f85d86f" "a455366c5cdacebd8adaa99d50e37430b0170326e7640a688e9d9ad406e2edfd" "0f302165235625ca5a827ac2f963c102a635f27879637d9021c04d845a32c568" "9dc64d345811d74b5cd0dac92e5717e1016573417b23811b2c37bb985da41da2" "9a3c51c59edfefd53e5de64c9da248c24b628d4e78cc808611abd15b3e58858f" "da8e6e5b286cbcec4a1a99f273a466de34763eefd0e84a41c71543b16cd2efac" "e26e879d250140e0d4c4d5ab457c32bcb29742599bd28c1ce31301344c6f2a11" "68b847fac07094724e552eeaf96fa4c7e20824ed5f3f225cad871b8609d50ace" "51c71bb27bdab69b505d9bf71c99864051b37ac3de531d91fdad1598ad247138" "636b135e4b7c86ac41375da39ade929e2bd6439de8901f53f88fde7dd5ac3561" "0c08a5c3c2a72e3ca806a29302ef942335292a80c2934c1123e8c732bb2ddd77" "9d29a302302cce971d988eb51bd17c1d2be6cd68305710446f658958c0640f68" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "7a424478cb77a96af2c0f50cfb4e2a88647b3ccca225f8c650ed45b7f50d9525" "a9abd706a4183711ffcca0d6da3808ec0f59be0e8336868669dc3b10381afb6f" "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "251ed7ecd97af314cd77b07359a09da12dcd97be35e3ab761d4a92d8d8cf9a71" "f64189544da6f16bab285747d04a92bd57c7e7813d8c24c30f382f087d460a33" "570263442ce6735821600ec74a9b032bc5512ed4539faf61168f2fdf747e0668" "f053f92735d6d238461da8512b9c071a5ce3b9d972501f7a5e6682a90bf29725" "5b9a45080feaedc7820894ebbfe4f8251e13b66654ac4394cb416fef9fdca789" "1aa4243143f6c9f2a51ff173221f4fd23a1719f4194df6cef8878e75d349613d" "5586a5db9dadef93b6b6e72720205a4fa92fd60e4ccfd3a5fa389782eab2371b" "4ff1c4d05adad3de88da16bd2e857f8374f26f9063b2d77d38d14686e3868d8d" "2078837f21ac3b0cc84167306fa1058e3199bbd12b6d5b56e3777a4125ff6851" "ddffe74bc4bf2c332c2c3f67f1b8141ee1de8fd6b7be103ade50abb97fe70f0c" "bf948e3f55a8cd1f420373410911d0a50be5a04a8886cabe8d8e471ad8fdba8e" "70b596389eac21ab7f6f7eb1cf60f8e60ad7c34ead1f0244a577b1810e87e58c" "1cae4424345f7fe5225724301ef1a793e610ae5a4e23c023076dc334a9eb940a" "545ab1a535c913c9214fe5b883046f02982c508815612234140240c129682a68" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "ce4234c32262924c1d2f43e6b61312634938777071f1129c7cde3ebd4a3028da" "afa47084cb0beb684281f480aa84dab7c9170b084423c7f87ba755b15f6776ef" "356e5cbe0874b444263f3e1f9fffd4ae4c82c1b07fe085ba26e2a6d332db34dd" default))
 '(haskell-stylish-on-save am-haskell-format-on-save)
 '(helm-completion-style 'helm)
 '(hindent-indent-size 4)
 '(hindent-line-length 100)
 '(hindent-reformat-buffer-on-save nil)
 '(hindent-style "johan-tibell")
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(zig-mode merlin-company color-theme-modern lsp-pyright tempel posframe protobuf-mode tree-sitter-langs cargo-mode company-racer ox-gfm eglot futhark-mode dockerfile-mode jupyter elpy rtags cmake-ide helm-projectile yaml-mode which-key treemacs-projectile treemacs doom-themes whitespace-cleanup-mode smartparens beacon flycheck-rust racer cargo toml-mode racket-mode cmake-mode utop use-package rjsx-mode projectile pdf-tools pcre2el origami org-journal multiple-cursors merlin magit lsp-ui ivy-erlang-complete imenu-anywhere idris-mode hydra hindent helm haskell-snippets flycheck-pos-tip flycheck-popup-tip flycheck-inline flycheck-cask exec-path-from-shell elscreen dante avy)))
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
