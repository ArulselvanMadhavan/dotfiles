;; (add-to-list
;;    'load-path
;;    (car (file-expand-wildcards "/usr/lib/erlang/lib/tools-*/emacs")))

;; (require 'erlang-start)
;; (setq erlang-root-dir "/usr/local/lib/erlang")
;; (setq exec-path (cons "/usr/local/bin/erlang/bin" exec-path))
;; (setq erlang-man-root-dir "/usr/local/bin/erlang/man")

;; (require 'flycheck)
;; (flycheck-define-checker erlang-otp
;;                          "An Erlang syntax checker using the Erlang interpreter."
;;                          :command ("erlc" "-o" temporary-directory "-Wall"
;;                                    "-I" "../include" "-I" "../../include"
;;                                    "-I" "../../../include" source)
;;                          :error-patterns
;;                          ((warning line-start (file-name) ":" line ": Warning:" (message) line-end)
;;                           (error line-start (file-name) ":" line ": " (message) line-end)))

;; (add-hook 'erlang-mode-hook
;;           (lambda ()
;;             (flycheck-select-checker 'erlang-otp)
;;             (flycheck-mode)))

;; (require 'flycheck-tip)
;; (flycheck-tip-use-timer 'verbose)
;; (provide 'erlang-configs)


(use-package ivy-erlang-complete
  :ensure t)

;; Add Emacs files from erlang distribution to load-path
(add-to-list
   'load-path
   (car (file-expand-wildcards "/usr/local/lib/erlang/lib/tools-*/emacs")))

(use-package erlang
  :hook (after-save . ivy-erlang-complete-reparse)
  :custom (ivy-erlang-complete-erlang-root "/usr/local/lib/erlang")
  :config (ivy-erlang-complete-init)
  :mode (("\\.erl?$" . erlang-mode)
	 ("rebar\\.config$" . erlang-mode)
	 ("relx\\.config$" . erlang-mode)
	 ("sys\\.config\\.src$" . erlang-mode)
	 ("sys\\.config$" . erlang-mode)
	 ("\\.config\\.src?$" . erlang-mode)
	 ("\\.config\\.script?$" . erlang-mode)
	 ("\\.hrl?$" . erlang-mode)
	 ("\\.app?$" . erlang-mode)
	 ("\\.app.src?$" . erlang-mode)
	 ("\\Emakefile" . erlang-mode)))

;; Distel
(push "~/.emacs.d/distel/elisp/" load-path)
(require 'distel)
(distel-setup)

;; Copied from https://www.lambdacat.com/post-modern-emacs-setup-for-erlang/

;; prevent annoying hang-on-compile
(defvar inferior-erlang-prompt-timeout t)
;; default node name to emacs@localhost
(setq inferior-erlang-machine-options '("-sname" "emacs"))
;; tell distel to default to that node
(setq erl-nodename-cache
      (make-symbol
       (concat
        "emacs@"
        ;; Mac OS X uses "name.local" instead of "name", this should work
        ;; pretty much anywhere without having to muck with NetInfo
        ;; ... but I only tested it on Mac OS X.
                (car (split-string (shell-command-to-string "hostname"))))))

(use-package company-distel
  :ensure t
  :config
  (setq company-distel-popup-help t)
  (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-distel)))

(provide 'erlang-configs)
