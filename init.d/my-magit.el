(require 'evil-magit)
(global-set-key (kbd "C-x g") 'magit-status)

(defvar magit-gitflow-popup-key "C-c C-f")
(require 'magit-gitflow)
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

(provide 'my-magit)
