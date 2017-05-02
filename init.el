(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Remove the menu huge looking bs
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Add line numbers
(global-linum-mode 1)

;; Enable clipboard
(setq x-select-enable-clipboard t)

;; Remove the stupid splash screen
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; Fullscreen on startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Load colour scheme
(load-theme 'leuven t)

;; Colour delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Autocomplete for python
;; Standard Jedi.el setting
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; Flycheck
(use-package flycheck
  :ensure t
  :config
  (add-hook 'erlang-mode-hook 'flycheck-mode)
  (add-hook 'elixir-mode-hook 'flycheck-mode)
  (add-hook 'python-mode-hook 'flycheck-mode))

;; Elixir Packages ====
(use-package erlang
  :ensure t
  :config
  (add-hook 'erlang-mode-hook '(lambda()
                                 (setq indent-tabs-mode nil)
                                 (add-to-list 'ac-modes 'erlang-mode))))

(use-package elixir-mode
  :ensure t)

(use-package alchemist
  :ensure t)

;; Autocomplete for Elixir
(add-hook 'elixir-mode-hook 'global-company-mode)
