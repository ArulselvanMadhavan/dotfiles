;; Helm Projectile
(use-package projectile
  :demand
  :init 
  :config
  (helm-projectile-on)
  (projectile-global-mode t)
  (setq projectile-completion-system 'helm)
  (setq projectile-use-git-grep t)
  ;; Projectile ignores
  (add-to-list 'projectile-globally-ignored-directories "node_modules")
  (add-to-list 'projectile-globally-ignored-directories "bower_components")
  (add-to-list 'projectile-globally-ignored-directories ".git")
  (add-to-list 'projectile-globally-ignored-directories "build")
  (add-to-list 'projectile-globally-ignored-directories "dist"))

;; Projectile create new file if not found
(with-eval-after-load 'helm-projectile
  (defvar helm-source-file-not-found
    (helm-build-dummy-source
	"Create-file"
      :action 'find-file))
  (add-to-list 'helm-projectile-sources-list helm-source-file-not-found t))

(provide 'projectile-configs)
