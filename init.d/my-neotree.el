(require 'neotree)
(require 'evil)
(require 'dired)
(require 'projectile)
(require 'find-file-in-project)

(setq neo-smart-open t)

(defun neotree-copy-file ()
  (interactive)
  (let* ((current-path (neo-buffer--get-filename-current-line))
	 (msg (format "Copy [%s] to: "
		      (neo-path--file-short-name current-path)))
	 (to-path (read-file-name msg (file-name-directory current-path))))
    (dired-copy-file current-path to-path t))
  (neo-buffer--refresh t))

(setq projectile-switch-project-action 'neotree-projectile-action)

(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (projectile-project-root))
	(file-name (buffer-file-name)))
    (neotree-toggle)
    (if project-dir
	(if (neo-global--window-exists-p)
	    (progn
	      (neotree-dir project-dir)
	      (neotree-find file-name)))
      (message "Could not find git project root."))))
 (global-set-key [f8] 'neotree-project-dir)

(define-minor-mode neotree-evil
  "Use NERDTree bindings on neotree."
  :lighter " NT"
  :keymap (progn
	    (evil-make-overriding-map neotree-mode-map 'normal t)
	    (evil-define-key 'normal neotree-mode-map
	      "C" 'neotree-change-root
	      "U" 'neotree-select-up-node
	      "r" 'neotree-refresh
	      "o" 'neotree-enter
	      (kbd "<return>") 'neotree-enter
	      "i" 'neotree-enter-horizontal-split
	      "s" 'neotree-enter-vertical-split
	      "n" 'evil-search-next
	      "N" 'evil-search-previous
	      "ma" 'neotree-create-node
	      "mc" 'neotree-copy-file
	      "md" 'neotree-delete-node
	      "mm" 'neotree-rename-node
	      "gg" 'evil-goto-first-line
	      "gi" (lambda ()
		     (interactive)
		     (if (string= pe/get-directory-tree-external-command
				  nt/gitignore-files-cmd)
			 (progn (setq pe/get-directory-tree-external-command
				      nt/all-files-cmd))
		       (progn (setq pe/get-directory-tree-external-command
				    nt/gitignore-files-cmd)))
		     (nt/refresh))
	      "I" 'neotree-hidden-file-toggle)
	    neotree-mode-map))

(setq neo-hidden-files-regexp "^\\.\\|~$\\|^#.*#$\\|^target$\\|^pom\\.*\\|^.*ibc$")

;;; (setq neo-theme 'ascii)

neo-after-create-hook
(provide 'my-neotree)
