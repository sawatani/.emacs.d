(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(el-get-bundle evil)
(el-get-bundle flycheck)
(el-get-bundle haskell-mode)
(el-get-bundle company)
(el-get-bundle company-ghc)
(el-get-bundle neotree)
(el-get-bundle projectile)

(require 'evil)
(evil-mode 1)

(add-hook 'after-init-hook #'global-flycheck-mode)

(global-company-mode 1)

(add-to-list 'load-path ".emacs.d/init.d")

(require 'my-neotree)
(require 'my-haskell)

(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)
