(setq neo-theme 'nerd)

(evil-leader/set-key "d" "yyp")
(evil-leader/set-key "w w" 'other-window)

(global-set-key [(control j)] 'move-line-down)
(global-set-key [(control k)] 'move-line-up)

(custom-set-faces
  '(neo-banner-face ((t (:foreground "#7F848E"))))
  '(neo-root-dir-face ((t (:foreground "#c678dd"))))
  '(neo-dir-link-face ((t (:foreground "#61AFEF"))))
  '(neo-file-link-face ((t (:foreground "#7F848E")))))

(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

(add-to-list 'package-archives
  '("melpa-stable" . "https://stable.melpa.org/packages/") t)
