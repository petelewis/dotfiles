;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-


;;; First, some visual stuff

;; Load the theme (doom-one, doom-molokai, etc);
;; keep in mind that each theme may have their own settings.
(require 'doom-themes)
(load-theme 'doom-solarized-dark t)

(require 'solaire-mode)

;; brighten buffers (that represent real files)
(add-hook 'change-major-mode-hook #'turn-on-solaire-mode)

;; To enable solaire-mode unconditionally for certain modes:
(add-hook 'ediff-prepare-buffer-hook #'solaire-mode)

;; ...if you use auto-revert-mode, this prevents solaire-mode from turning
;; itself off every time Emacs reverts the file
(add-hook 'after-revert-hook #'turn-on-solaire-mode)

;; highlight the minibuffer when it is activated:
(add-hook 'minibuffer-setup-hook #'solaire-mode-in-minibuffer)

;; if the bright and dark background colors are the wrong way around, use this
;; to switch the backgrounds of the `default` and `solaire-default-face` faces.
;; This should be used *after* you load the active theme!
;;
;; NOTE: This is necessary for themes in the doom-themes package!
(solaire-mode-swap-bg)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;; Enable custom neotree theme (all-the-icons must be installed!)
(doom-themes-neotree-config)
;; and for treemacs too
(doom-themes-treemacs-config)



;; Prefer splitting windows vertically than horizontally.
;; We have widescreen monitors now, right?
(setq
   split-width-threshold 0
   split-height-threshold nil)


;;; Modeline and tab bar customisations

;; Add the name of the current workspace to Doom's modeline
(setq doom-modeline-persp-name t)

;; If non-nil, a word count will be added to the selection-info modeline segment.
(setq doom-modeline-enable-word-count t)

;; Set the tab bar style
;(setq centaur-tabs-style "rounded")

;; Display a small line under the tab
;(setq centaur-tabs-set-bar 'under)

;; Don't show close buttons
;(setq centaur-tabs-set-close-button nil)


;(after! centaur-tabs
;  ;; Projectile integration
;  (centaur-tabs-group-by-projectile-project)
;  ;; Ensure tab order and buffer order are consistent
;  (centaur-tabs-enable-buffer-reordering)
;  ;; When the currently selected tab(A) is at the right of the last visited
;  ;; tab(B), move A to the right of B. When the currently selected tab(A) is
;  ;; at the left of the last visited tab(B), move A to the left of B
;  (setq centaur-tabs-adjust-buffer-order t))

;;; Fonts!
;; Note that the 'Mono' version of Inconsolata Nerd Font doesn't use ligatures, so doesn't suffer from the 'telephone bug'

(setq
  ;;doom-font (font-spec :family "JetBrainsMono Medium" :size 24)
  ;;doom-big-font (font-spec :family "JetBrainsMono Medium" :size 32)
  doom-font (font-spec :family "Inconsolata Nerd Font Mono" :size 26)
  doom-big-font (font-spec :family "Inconsolata Nerd Font Mono" :size 32)
  doom-variable-pitch-font (font-spec :family "Avenir Next LT Pro" :size 16)
  ;;doom-variable-pitch-font (font-spec :family "Avenir Next" :size 18)
  web-mode-markup-indent-offset 2
  web-mode-code-indent-offset 2)

(after! dash (dash-enable-font-lock))

;; Major modes in which to display word count continuously.
;; Also applies to any derived modes. Respects `doom-modeline-enable-word-count'.
;; If it brings the sluggish issue, disable `doom-modeline-enable-word-count' or
;; remove the modes from `doom-modeline-continuous-word-count-modes'.
(setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))


;;; Editing

;; Enable visual line mode
;; TODO: This only for certain modes?
(global-visual-line-mode 1) ; 1 for on, 0 for off.


;;;; Now for specific modules...

;;; Treemacs config

; (setq treemacs-collapse-dirs              (if (executable-find "python") 3 0)
;           treemacs-deferred-git-apply-delay   0.5
;           treemacs-display-in-side-window     t
;           treemacs-file-event-delay           5000
;           treemacs-file-follow-delay          0.2
;           treemacs-follow-after-init          t
;           treemacs-follow-recenter-distance   0.1
;           treemacs-git-command-pipe           ""
;           treemacs-goto-tag-strategy          'refetch-index
;           treemacs-indentation                2
;           treemacs-indentation-string         " "
;           treemacs-is-never-other-window      nil
;           treemacs-max-git-entries            5000
;           treemacs-no-png-images              nil
;           treemacs-no-delete-other-windows    t
;           treemacs-project-follow-cleanup     nil
;           treemacs-persist-file               (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
;           treemacs-recenter-after-file-follow nil
;           treemacs-recenter-after-tag-follow  nil
;           treemacs-show-cursor                t
;           treemacs-show-hidden-files          t
;           treemacs-silent-filewatch           nil
;           treemacs-silent-refresh             nil
;           treemacs-sorting                    'alphabetic-desc
;           treemacs-space-between-root-nodes   t
;           treemacs-tag-follow-cleanup         t
;           treemacs-tag-follow-delay           1.5
;           treemacs-width                      30)

;; Don't show things that are gitignored
;;(add-to-list 'treemacs-pre-file-insert-predicates #'treemacs-is-file-git-ignored?)


;;; Latex
(setq +latex-viewers '(evince))


;;; Projectile
;; Where to look for project directories
(setq projectile-project-search-path '("~/Dropbox/Research/Writings/WIP/" "~/Dropbox/Research/Talks/" "~/Dropbox/Web/" "~/Dropbox/src"))

;; If there is a default file for the project, open that
(defcustom project-default-file "README.md"
  "Default file to open when switching to a project"
  :group 'projectile
  :type 'string)

(setq +workspaces-switch-project-function '(lambda (dir) '(find-file project-default-file))) ; relative to project's root
;;(setq +workspaces-switch-project-function '(lambda (dir) ())) ; relative to project's root

;;; Org

(with-eval-after-load "ox-latex"
  (add-to-list 'org-latex-classes
    '("koma-article" "\\documentclass{scrartcl}"
     ("\\section{%s}" . "\\section*{%s}")
     ("\\subsection{%s}" . "\\subsection*{%s}")
     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
     ("\\paragraph{%s}" . "\\paragraph*{%s}")
     ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

(after! org
  (setq org-directory "~/Dropbox/org/"
    ;org-agenda-files (org-directory t "\\.org$" t)
    org-agenda-files (quote ("~/Dropbox/org"))
    org-archive-location (concat org-directory "Archive/_%s::")
    org-refile-use-outline-path 'file ;; Allow us to refile to top-level nodes in files
    org-refile-targets '((org-agenda-files :level . 1))
    org-tags-column -80
    org-priority-faces '((?A :foreground "#e45649")
                          (?B :foreground "#da8548")
                          (?C :foreground "#0098dd"))
    org-bullets-bullet-list '("❖")
    org-ellipsis " ▼ "
    org-todo-keywords '((sequence "[ ](t)" "[~](i)" "[-](w)" "|" "[✔](d)" "[✘](c)"))
    org-todo-keyword-faces
    '(("[ ]" :foreground "#6971c4" :weight normal :underline f)
      ("[~]" :foreground "#268bd2" :weight normal :underline f)
      ("[-]" :foreground "#d33682" :weight normal :underline f)
      ("[✔]" :foreground "#859900" :weight normal :underline f)
      ("[✘]" :foreground "#dc322f" :weight normal :underline f))
    ;;org-re-reveal-script-files '("js/reveal.js")
    ;;org-latex-packages-alist '(("margin=2cm" "geometry" nil))
    ;;
    ;;org-log-done 'time
    org-agenda-skip-scheduled-if-done t
    js-indent-level 2
    css-indent-offset 2

    ;; Don't treat whitespace as content (for folding), below org bullets
    ;; See https://stackoverflow.com/questions/40332479/org-mode-folding-considers-whitespace-as-content
    org-cycle-separator-lines -1

    ;; Follow links in org files by pressing return
    org-return-follows-links t)

  ;;; Additional keymappings for org mode
  (map! :map org-mode-map
    :localleader
    :n "A" #'org-archive-subtree-hierarchical) ;; replacing the default command with this (from autoloads)

  ;;; Quick access to the agenda - can I bypass the agenda menu?
  ;;; n is a good view for a daily/weekly review,
  ;;; a is too cluttered with things I haven't done from previous days with things I need to do today
  (map! :leader
        :n "a" #'org-agenda)

  ;; Save all org-mode buffers, every time there is a period of inactivity
  ;; From https://emacs.stackexchange.com/questions/477/how-do-i-automatically-save-org-mode-buffers
  (add-hook 'auto-save-hook 'org-save-all-org-buffers)

  ;; Org-capture files
  (setq org-default-notes-file (concat org-directory "Misc.org")
        +org-capture-todo-file "Tasks.org"
    +org-capture-notes-file "Notes.org"
    +org-capture-journal-file "Journal.org")

  ;; Org-capture templates
  ;;(setq org-capture-templates nil)

  ;; Quick capture todo item to inbox
  (add-to-list 'org-capture-templates
              '("t" "Misc Todo" entry
                (file+headline +org-capture-todo-file "Inbox")
                "* [ ] %?\n%i\n%a" :prepend t))
)





;; Customise Doom's Dashboard
(setq fancy-splash-image "~/.doom.d/dashboard-banners/vi-man.png")

;; Put some padding above the image (default is 0, 4)
(setq +doom-dashboard-banner-padding '(2 . 4))

;; Override the default dashboard menu with this...
(setq +doom-dashboard-menu-sections
  '(("Reload last session"
     :icon (all-the-icons-octicon "history" :face 'doom-dashboard-menu-title)
     :when (cond ((require 'persp-mode nil t)
                  (file-exists-p (expand-file-name persp-auto-save-fname persp-save-dir)))
                 ((require 'desktop nil t)
                  (file-exists-p (desktop-full-file-name))))
     :face (:inherit (doom-dashboard-menu-title bold))
     :action doom/quickload-session)
    ("Open org-agenda"
     :icon (all-the-icons-octicon "calendar" :face 'doom-dashboard-menu-title)
     :when (fboundp 'org-agenda)
     :action org-agenda)
    ("Open project"
     :icon (all-the-icons-octicon "briefcase" :face 'doom-dashboard-menu-title)
     :action projectile-switch-project)
    ("Recently opened files"
     :icon (all-the-icons-octicon "file-text" :face 'doom-dashboard-menu-title)
     :action recentf-open-files)
    ("Jump to bookmark"
     :icon (all-the-icons-octicon "bookmark" :face 'doom-dashboard-menu-title)
     :action bookmark-jump)))

