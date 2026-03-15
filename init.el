(require 'package)

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("gnu-devel" . "https://elpa.gnu.org/devel/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Programming languages configuration

(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'languages)
		 
;; Initial Screen Config

(setq inhibit-startup-message t
      initial-scratch-message ""
      display-line-numbers-type 'relative)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode t)

;; Theme

(unless (package-installed-p 'tao-theme)
  (package-install 'tao-theme))
(require 'tao-theme)

(mapc #'disable-theme custom-enabled-themes)
(load-theme 'tao-yin t)

;; Font

(set-face-attribute 'default nil
		    :family "Hasklig"
		    :height 170)
(setq-default line-spacing 0.2)
(setq-default tab-width 6)

(global-font-lock-mode 1)
