(require 'package)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("2642a1b7f53b9bb34c7f1e032d2098c852811ec2881eec2dc8cc07be004e45a0" "adf5275cc3264f0a938d97ded007c82913906fc6cd64458eaae6853f6be287ce" "aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" default)))
 '(fringe-mode nil nil (fringe))
 '(line-number-mode nil)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (go-mode ensime which-key ace-jump-mode evil-escape neotree evil-visual-mark-mode evil-leader rainbow-delimiters powerline atom-dark-theme atom-one-dark-theme dracula-theme)))
 '(scroll-bar-mode nil)
 '(tooltip-mode nil))
(package-initialize)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:weight normal :height 130 :family "Fira Code"))))
 '(hl-line-face ((t (:foreground "#ff0000"))))
 '(neo-banner-face ((t (:foreground "#6272a4" :weight normal :height 130 :family "Fira Code"))))
 '(neo-dir-link-face ((t (:foreground "#8be9fd" :weight normal :height 130 :family "Fira Code"))))
 '(neo-file-link-face ((t (:foreground "#6272a4" :weight normal :height 130 :family "Fira Code"))))
 '(neo-root-dir-face ((t (:foreground "#8be9fd" :weight normal :height 130 :family "Fira Code")))))

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "SPC")
;;
(evil-leader/set-key "d" "yyp")
(evil-leader/set-key "SPC e" "$")
(evil-leader/set-key "SPC b" "^")
(evil-leader/set-key "c c" 'comment-line)
;;
(evil-leader/set-key "f f" 'find-file)
(evil-leader/set-key "f l" 'load-file)
;;
(evil-leader/set-key "b b" 'buffer-menu)
(evil-leader/set-key "b p" 'previous-buffer)
(evil-leader/set-key "b n" 'next-buffer)

(require 'evil)
(evil-mode 1)
(setq-default evil-kill-on-visual-paste nil)

(require 'powerline)
(powerline-vim-theme)

(require 'rainbow-delimiters)
(rainbow-delimiters-mode)

(require 'neotree)
(setq neo-theme 'ascii)
(setq neo-show-hidden-files t)
(evil-leader/set-key "n n" 'neotree-toggle)
(evil-leader/set-key "n f" 'neotree-find)

(require 'ace-jump-mode)
(autoload 'ace-jump-mode "ace-jump-mode" t)
(evil-leader/set-key "w" 'ace-jump-mode)

(require 'which-key)
(which-key-mode)

(require 'ensime)

(require 'go-mode)
(add-hook 'before-save-hook #'gofmt-before-save)

(require 'evil-escape)
(evil-escape-mode)
(global-set-key (kbd "C-c") nil)
(global-set-key (kbd "C-c") 'evil-escape)

(eval-after-load "ensime-mode"
  '(define-key ensime-mode-map (kbd "C-c") nil))
(eval-after-load "yasnippet"
  '(define-key yas-minor-mode-map (kbd "C-c") nil))
(eval-after-load "go-mode"
  '(define-key go-mode-map (kbd "C-c") nil))

(use-local-map (make-sparse-keymap))

(load-theme 'dracula)

(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq ns-use-srgb-colorspace nil)

(global-display-line-numbers-mode)

(global-hl-line-mode -1)

(set-face-attribute 'region nil :background "#44475a" :foreground "#f8f8f2")

(set-cursor-color "#f8f8f2") 

(setq-default line-spacing 3)

(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key (kbd "C-k") 'move-line-up)
(global-set-key (kbd "C-j") 'move-line-down)

(setq exec-path (append exec-path '("/usr/local/bin")))
(setq exec-path (append exec-path '("~/Projects/Go/bin")))
