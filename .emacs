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
    (evil-visual-mark-mode evil-leader rainbow-delimiters powerline atom-dark-theme atom-one-dark-theme dracula-theme)))
 '(scroll-bar-mode nil)
 '(tooltip-mode nil))
(package-initialize)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:weight normal :height 130 :width normal :family "Fira Code")))))

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key "d" "yyp")
(evil-leader/set-key "w w" 'other-window)

(require 'evil)
(evil-mode 1)

(require 'powerline)
(powerline-default-theme)

(require 'rainbow-delimiters)
(rainbow-delimiters-mode)

(load-theme 'dracula)

(toggle-scroll-bar -1)
(tool-bar-mode -1)

(global-display-line-numbers-mode)

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

(global-set-key [(control j)] 'move-line-down)
(global-set-key [(control k)] 'move-line-up)
