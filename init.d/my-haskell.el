(require 'find-file-in-project)

(autoload 'haskell-mode "haskell-mode" nil t)
(autoload 'haskell-cabal "haskell-cabal" nil t)
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'haskell-decl-scan-mode)
(add-hook 'haskell-mode-hook 'haskell-doc-mode)

(setq haskell-process-type 'stack-ghci)
(setq haskell-process-path-ghci "stack")
(setq haskell-process-args-ghci "ghci")
(setq haskell-compile-cabal-build-command "stack build")
(eval-after-load 'haskell-mode
  '(progn
     (define-key haskell-mode-map (kbd "C-c .") 'haskell-mode-jump-to-def)
     (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile)))
(custom-set-variables
  '(haskell-interactive-popup-errors nil))

(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal$" . haskell-cabal-mode))

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)

(add-to-list 'company-backends 'company-ghc)

(add-hook 'haskell-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 (append '((company-capf company-dabbrev-code))
                         company-backends))))

(custom-set-variables '(haskell-stylish-on-save t))

(defvar haskell-font-lock-symbols)
(setq haskell-font-lock-symbols t)

(provide 'my-haskell)
