;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Peter Lewis"
      user-mail-address "pete@petelewis.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-solarized-dark)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
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
(setq projectile-project-search-path '("~/Dropbox/Research/Writings/WIP/" "~/Dropbox/Research/Talks/" "~/Dropbox/src"))

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


  ;; Hierarchical archiving

  ;; org-archive-subtree-hierarchical.el
  ;;
  ;; version 0.2
  ;; modified from https://lists.gnu.org/archive/html/emacs-orgmode/2014-08/msg00109.html
  ;; modified from https://stackoverflow.com/a/35475878/259187

  ;; In orgmode
  ;; * A
  ;; ** AA
  ;; *** AAA
  ;; ** AB
  ;; *** ABA
  ;; Archiving AA will remove the subtree from the original file and create
  ;; it like that in archive target:

  ;; * AA
  ;; ** AAA

  ;; And this give you
  ;; * A
  ;; ** AA
  ;; *** AAA
  ;;
  ;; Install file to your include path and include in your init file with:
  ;;
  ;;  (require 'org-archive-subtree-hierarchical)
  ;;  (setq org-archive-default-command 'org-archive-subtree-hierarchical)
  ;;
  ;(provide 'org-archive-subtree-hierarchical)
  (require 'org-archive)

  (defun org-archive-subtree-hierarchical--line-content-as-string ()
  "Returns the content of the current line as a string"
  (save-excursion
  (beginning-of-line)
  (buffer-substring-no-properties
  (line-beginning-position) (line-end-position))))

  (defun org-archive-subtree-hierarchical--org-child-list ()
  "This function returns all children of a heading as a list. "
  (interactive)
  (save-excursion
  ;; this only works with org-version > 8.0, since in previous
  ;; org-mode versions the function (org-outline-level) returns
  ;; gargabe when the point is not on a heading.
  (if (= (org-outline-level) 0)
          (outline-next-visible-heading 1)
  (org-goto-first-child))
  (let ((child-list (list (org-archive-subtree-hierarchical--line-content-as-string))))
  (while (org-goto-sibling)
          (setq child-list (cons (org-archive-subtree-hierarchical--line-content-as-string) child-list)))
  child-list)))

  (defun org-archive-subtree-hierarchical--org-struct-subtree ()
  "This function returns the tree structure in which a subtree
  belongs as a list."
  (interactive)
  (let ((archive-tree nil))
  (save-excursion
  (while (org-up-heading-safe)
          (let ((heading
          (buffer-substring-no-properties
                  (line-beginning-position) (line-end-position))))
          (if (eq archive-tree nil)
          (setq archive-tree (list heading))
          (setq archive-tree (cons heading archive-tree))))))
  archive-tree))

  (defun org-archive-subtree-hierarchical ()
  "This function archives a subtree hierarchical"
  (interactive)
  (let ((org-tree (org-archive-subtree-hierarchical--org-struct-subtree))
          (this-buffer (current-buffer))
          (file (abbreviate-file-name
          (or (buffer-file-name (buffer-base-buffer))
                  (error "No file associated to buffer")))))
  (save-excursion
  (setq location org-archive-location
          afile (car (org-archive--compute-location
                                  (or (org-entry-get nil "ARCHIVE" 'inherit) location)))
          ;; heading (org-extract-archive-heading location)
          infile-p (equal file (abbreviate-file-name (or afile ""))))
  (unless afile
          (error "Invalid `org-archive-location'"))
  (if (> (length afile) 0)
          (setq newfile-p (not (file-exists-p afile))
                  visiting (find-buffer-visiting afile)
                  buffer (or visiting (find-file-noselect afile)))
          (setq buffer (current-buffer)))
  (unless buffer
          (error "Cannot access file \"%s\"" afile))
  (org-cut-subtree)
  (set-buffer buffer)
  (org-mode)
  (goto-char (point-min))
  (while (not (equal org-tree nil))
          (let ((child-list (org-archive-subtree-hierarchical--org-child-list)))
          (if (member (car org-tree) child-list)
          (progn
                  (search-forward (car org-tree) nil t)
                  (setq org-tree (cdr org-tree)))
          (progn
          (goto-char (point-max))
          (newline)
          (org-insert-struct org-tree)
          (setq org-tree nil)))))
  (newline)
  (org-yank)
  (when (not (eq this-buffer buffer))
          (save-buffer))
  (message "Subtree archived %s"
          (concat "in file: " (abbreviate-file-name afile))))))

  (defun org-insert-struct (struct)
  "TODO"
  (interactive)
  (when struct
  (insert (car struct))
  (newline)
  (org-insert-struct (cdr struct))))

  (defun org-archive-subtree ()
  (org-archive-subtree-hierarchical)))





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



;;; Custom workspace switching keys (adapted from from +evil-bindings.el)
(map! (:when (featurep! :ui workspaces)
       :n "C-t"   #'+workspace/new
       :n "C-S-t" #'+workspace/display
       :g "C-1"   #'+workspace/switch-to-0
       :g "C-2"   #'+workspace/switch-to-1
       :g "C-3"   #'+workspace/switch-to-2
       :g "C-4"   #'+workspace/switch-to-3
       :g "C-5"   #'+workspace/switch-to-4
       :g "C-6"   #'+workspace/switch-to-5
       :g "C-7"   #'+workspace/switch-to-6
       :g "C-8"   #'+workspace/switch-to-7
       :g "C-9"   #'+workspace/switch-to-8
       :g "C-0"   #'+workspace/switch-to-final
       (:when IS-MAC
        :g "s-t"   #'+workspace/new
        :g "s-T"   #'+workspace/display
        :n "s-1"   #'+workspace/switch-to-0
        :n "s-2"   #'+workspace/switch-to-1
        :n "s-3"   #'+workspace/switch-to-2
        :n "s-4"   #'+workspace/switch-to-3
        :n "s-5"   #'+workspace/switch-to-4
        :n "s-6"   #'+workspace/switch-to-5
        :n "s-7"   #'+workspace/switch-to-6
        :n "s-8"   #'+workspace/switch-to-7
        :n "s-9"   #'+workspace/switch-to-8
        :n "s-0"   #'+workspace/switch-to-final)))
