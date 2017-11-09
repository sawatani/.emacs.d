(eval-after-load "ensime-mode"
  (message "entering ensime-mode")
)
(defun my-ensime-mode-hook ()
  (evil-define-key 'insert ensime-mode-map (kbd ".") 'scala/completing-dot)
  (evil-define-key 'normal ensime-mode-map (kbd "g d") 'ensime-edit-definition)
  (evil-define-key 'normal ensime-mode-map (kbd "g b") 'ensime-pop-find-definition-stack)
  (ensime)
)
(add-hook 'scala-mode-hook 'my-ensime-mode-hook)

(provide 'my-ensime)
