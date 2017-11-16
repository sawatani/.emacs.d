(eval-after-load "ensime-mode"
  (if (file-exists-p "build.sbt") (ensime))
)
(defun my-ensime-mode-hook ()
  (evil-define-key 'normal ensime-mode-map (kbd "g d") 'ensime-edit-definition)
  (evil-define-key 'normal ensime-mode-map (kbd "g b") 'ensime-pop-find-definition-stack)
)
(add-hook 'scala-mode-hook 'my-ensime-mode-hook)

(provide 'my-ensime)
