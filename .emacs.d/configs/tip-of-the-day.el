(setq totd-file "~/.emacs.d/emacsTOTD")

(defun totd()
 (random t)
 (let ((stars "*****************************")
       (tip (with-temp-buffer 
              (insert-file-contents totd-file)
              (goto-line (1+ (random
                              (count-lines (point-min)
                                           (point-max)))))
              (buffer-substring (point) (line-end-position)))))
   (momentary-string-display
    (concat "\n\n" stars "\n"
            "Tip of the Day\n"
            random-command "\n"
            stars "\n\n")
    (window-start) ?\r
    "Hit any key when done reading")))


(defconst animate-n-steps 3)
(require 'cl)
(random t)
(defun totd ()
  (interactive)
  (let* ((commands (loop for s being the symbols
                      when (commandp s) collect s))
         (command (nth (random (length commands)) commands)))
    (animate-string (concat ";; Initialization successful, welcome to "
                            (substring (emacs-version) 0 16)
                            "\n"
                            "Your tip for the day is:\n========================\n\n"
                            (save-excursion
                              (describe-function command)
                              (switch-to-buffer "*Help*")
                              (buffer-string))
                            (delete-other-windows)
                            "\n\nInvoke with:\n\n"
                            (where-is command t)
                            (delete-other-windows) 
                            )0 0)))

(add-hook 'after-init-hook 'totd)

(provide 'tip-of-the-day)
