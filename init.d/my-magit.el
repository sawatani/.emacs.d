(require 'evil-magit)
(global-set-key (kbd "C-x g") 'magit-status)

(defvar magit-gitflow-popup-key "C-c C-f")
(require 'magit-gitflow)
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

(defun magit-ignored-files ()
  (magit-git-items
   "ls-files" "--others" "--ignored" "--exclude-standard" "-z" "--directory"))
(defun magit-insert-ignored-files ()
  (-when-let (files (magit-ignored-files))
    (magit-insert-section (ignored)
      (magit-insert-heading "Ignored files:")
      (magit-insert-un/tracked-files-1 files nil)
      (insert ?\n))))
(magit-add-section-hook 'magit-status-sections-hook
                        'magit-insert-ignored-files)

(provide 'my-magit)
