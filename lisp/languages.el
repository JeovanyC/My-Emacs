;;; languages.el --- Programming languages configuration

;; LSP core
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook ((python-ts-mode . lsp-deferred)
         (lua-mode . lsp-deferred)
         (js-ts-mode . lsp-deferred)
         (typescript-ts-mode . lsp-deferred)
         (tsx-ts-mode . lsp-deferred)
         (web-mode . lsp-deferred)
         (php-mode . lsp-deferred)
         (c-ts-mode . lsp-deferred)
         (c++-ts-mode . lsp-deferred)
         (java-ts-mode . lsp-deferred)
         (sh-mode . lsp-deferred)))

;; Tree-sitter grammars
(setq treesit-language-source-alist
      '((python "https://github.com/tree-sitter/tree-sitter-python")
        (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (lua "https://github.com/tree-sitter-grammars/tree-sitter-lua")
        (php "https://github.com/tree-sitter/tree-sitter-php" "master" "php/src")
        (c "https://github.com/tree-sitter/tree-sitter-c")
        (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
        (java "https://github.com/tree-sitter/tree-sitter-java")
        (bash "https://github.com/tree-sitter/tree-sitter-bash")))

;; Major modes based on Tree-sitter config
(setq major-mode-remap-alist
      '((python-mode . python-ts-mode)
        (js-mode . js-ts-mode)
        (typescript-mode . typescript-ts-mode)
        (c-mode . c-ts-mode)
        (c++-mode . c++-ts-mode)
        (java-mode . java-ts-mode)))

;; Differ what mode is to be use: Web-mode, JSX or PHP
(defun smart_web_mode ()
  "Escolhe modo baseado no conteúdo do arquivo."
  (save-excursion
    (goto-char (point-min))
    (cond

     ;; HTML
     ((re-search-forward "<!DOCTYPE[[:space:]]+html\\|<html" 800 t)
      (web-mode))

     ;; JavaScript / JSX detectado
     ((re-search-forward
       "\\b\\(function\\|const\\|let\\|var\\|import\\|export\\)\\b\\|=>" 800 t)
      (tsx-ts-mode))

    ;; PHP
     (t
      (php-mode)))))
(add-to-list 'auto-mode-alist '("\\.php\\'" . smart_web_mode))

;; Python
(use-package python-ts-mode
  :ensure nil
  :mode "\\.py\\'")

;; Lua
(use-package lua-mode
  :mode "\\.lua\\'")

;; JavaScript
(use-package js-ts-mode
  :ensure nil
  :mode "\\.js\\'")

;; TypeScript
(use-package typescript-ts-mode
  :ensure nil
  :mode "\\.ts\\'")

;; React / TSX
(use-package tsx-ts-mode
  :ensure nil
  :mode "\\.tsx\\'")

;; Web (HTML / JSX)
(use-package web-mode
  :mode ("\\.html\\'" "\\.jsx\\'"))

;; PHP
(use-package php-mode
  :mode "\\.php\\'")

;; C
(use-package c-ts-mode
  :ensure nil
  :mode "\\.c\\'")

;; C++
(use-package c++-ts-mode
  :ensure nil
  :mode "\\.cpp\\'")

;; Java
(use-package java-ts-mode
  :ensure nil
  :mode "\\.java\\'")

;; Bash / Shell
(use-package sh-script
  :ensure nil
  :mode "\\.sh\\'")

(provide 'languages)
