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

;; Prefer splitting windows vertically than horizontally.
;; We have widescreen monitors now, right?
(setq
   split-width-threshold 0
   split-height-threshold nil)

;; Enable custom neotree theme (all-the-icons must be installed!)
(doom-themes-neotree-config)
;; and for treemacs too
(doom-themes-treemacs-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)


;;; Modeline and tab bar customisations

;; Add the name of the current workspace to Doom's modeline
(setq doom-modeline-persp-name t)

;; If non-nil, a word count will be added to the selection-info modeline segment.
(setq doom-modeline-enable-word-count t)

;; Set the tab bar style
(setq centaur-tabs-style "rounded")

;; Display a small line under the tab
(setq centaur-tabs-set-bar 'under)

;; Don't show close buttons
(setq centaur-tabs-set-close-button nil)


;;; Fonts!

(setq
 doom-font (font-spec :family "JetBrainsMono Medium" :size 24)
 doom-big-font (font-spec :family "JetBrainsMono Medium" :size 32)
 ;;doom-font (font-spec :family "Inconsolata Nerd Font" :size 26)
 ;;doom-big-font (font-spec :family "Inconsolata Nerd Font" :size 32)
 doom-variable-pitch-font (font-spec :family "Avenir Next LT Pro" :size 18)
 ;;doom-variable-pitch-font (font-spec :family "Avenir Next" :size 18)
 web-mode-markup-indent-offset 2
 web-mode-code-indent-offset 2
 org-agenda-skip-scheduled-if-done t
 js-indent-level 2
 org-ellipsis " ▾ "
 org-bullets-bullet-list '("·")
 org-tags-column -80
 org-agenda-files (ignore-errors (directory-files +org-dir t "\\.org$" t))
 org-log-done 'time
 css-indent-offset 2
 org-directory "~/Dropbox/org/")

(after! dash (dash-enable-font-lock))

;; Treemacs config
(setq treemacs-collapse-dirs              (if (executable-find "python") 3 0)
          treemacs-deferred-git-apply-delay   0.5
          treemacs-display-in-side-window     t
          treemacs-file-event-delay           5000
          treemacs-file-follow-delay          0.2
          treemacs-follow-after-init          t
          treemacs-follow-recenter-distance   0.1
          treemacs-git-command-pipe           ""
          treemacs-goto-tag-strategy          'refetch-index
          treemacs-indentation                2
          treemacs-indentation-string         " "
          treemacs-is-never-other-window      nil
          treemacs-max-git-entries            5000
          treemacs-no-png-images              nil
          treemacs-no-delete-other-windows    t
          treemacs-project-follow-cleanup     nil
          treemacs-persist-file               (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-recenter-after-file-follow nil
          treemacs-recenter-after-tag-follow  nil
          treemacs-show-cursor                nil
          treemacs-show-hidden-files          t
          treemacs-silent-filewatch           nil
          treemacs-silent-refresh             nil
          treemacs-sorting                    'alphabetic-desc
          treemacs-space-between-root-nodes   t
          treemacs-tag-follow-cleanup         t
          treemacs-tag-follow-delay           1.5
          treemacs-width                      30)

;; Don't show things that are gitignored
;;(add-to-list 'treemacs-pre-file-insert-predicates #'treemacs-is-file-git-ignored?)

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
(setq projectile-project-search-path '("~/Dropbox/Writings/WIP/" "~/Dropbox/Talks/" "~/Dropbox/Web/"))

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

;; Org-mode keymap overrides
;; <localleader>
 (after! org
  (map! :map evil-org-mode-map
        :localleader
        :n "d" #'org-deadline
        :n "s" #'org-schedule ;; adding s for org-schedule
        :n "t" #'org-todo
        (:prefix "c"
          :n "i" #'org-clock-in ;; mnemonic clock-In
          :n "o" #'org-clock-out ;; mnemonic clock-Out
          :n "g" #'org-clock-goto
          :n "G" (λ! (org-clock-goto 'select))
          :n "x" #'org-clock-cancel))
  (setq org-agenda-files (quote ("~/Dropbox/org"
                                 "~/org")))
  ;; Don't treat whitespace as content (for folding), below org bullets
  ;; See https://stackoverflow.com/questions/40332479/org-mode-folding-considers-whitespace-as-content
  (setq org-cycle-separator-lines -1))


;; Save all org-mode buffers, every time there is a period of inactivity
;; From https://emacs.stackexchange.com/questions/477/how-do-i-automatically-save-org-mode-buffers
(add-hook 'auto-save-hook 'org-save-all-org-buffers)

;; Customise Doom's Dashboard
;;(setq +doom-dashboard-banner-dir (concat (DIR!) "dashboard-banners/"))
;; this is by-default within doom-private-dir

;; Override the default dashboard menu with this...
(setq +doom-dashboard-menu-sections
  '(("Reload last session"
     :icon (all-the-icons-octicon "history" :face 'font-lock-keyword-face)
     :when (and (bound-and-true-p persp-mode)
                (file-exists-p (expand-file-name persp-auto-save-fname
                                                 persp-save-dir)))
     :face (:inherit (font-lock-keyword-face bold))
     :action +workspace/load-last-session)
    ("Open org-agenda"
     :icon (all-the-icons-octicon "calendar" :face 'font-lock-keyword-face)
     :when (fboundp 'org-agenda)
     :action org-agenda)
    ("Recently opened files"
     :icon (all-the-icons-octicon "file-text" :face 'font-lock-keyword-face)
     :action recentf-open-files)
    ("Open project"
     :icon (all-the-icons-octicon "briefcase" :face 'font-lock-keyword-face)
     :action projectile-switch-project)
    ("Jump to bookmark"
     :icon (all-the-icons-octicon "bookmark" :face 'doom-dashboard-menu-title)
     :action bookmark-jump)))

