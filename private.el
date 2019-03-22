;; This is your private configuration file. It is loaded automatically, so feel free to add whatever you want.
;; This file will not be affected by Castlemacs updates.


(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
(disable-theme 'tsdh-light)
(load-theme 'flucui-light t)
;; Use mode-line colors from castlemacs defaults (there should be a way of not having to do this.) Cheap hack: this will probably not look great with other themes. Maybe I can patch this theme and avoid having to keep this in this file?
(set-face-attribute 'mode-line nil :background "SlateGray1")
;; (set-face-attribute 'mode-line-inactive nil :background "grey93")
;; Piggy back on flucui-light settings to make vertical-border between windows lighter. Cheap hack---will break when using a different theme.
(set-face-foreground 'vertical-border (face-background 'header-line))
(set-face-attribute 'mode-line-inactive nil :background (face-background 'header-line))
;; (load-theme 'nord t)
;; (load-theme 'tao-yang t)
;; (load-theme 'zenburn t)
;; (load-theme 'doom-opera-light t)
;; (load-theme 'doom-nord-light t)
;; (when (eq system-type 'darwin) (ns-auto-titlebar-mode))

;; This only seems to matter when using one of the doom-themes
(set-face-attribute 'outline-1 nil :height 1.0 :background nil)

;; [APC: Below is ripped from kjhealy's starter kit]
;; Font-face setup. Check the availability of a some default fonts, in
;; order of preference. The first of these alternatives to be found is
;; set as the default font, together with base size and fg/bg
;; colors. If none of the preferred fonts is found, nothing happens
;; and Emacs carries on with the default setup. We do this here to
;; prevent some of the irritating flickering and resizing that
;; otherwise goes on during startup. You can reorder or replace the
;; options here with the names of your preferred choices.

(defun font-existsp (font)
  "Check to see if the named FONT is available."
  (if (null (x-list-fonts font))
      nil t))


;; Set default font. First one found is selected.
(cond
 ((eq window-system nil) nil)
 ;; ((font-existsp "Input Mono")
 ;;  (set-face-attribute 'default nil :height 181  :font "Input Mono"))
 ((font-existsp "Input Mono Compressed")
  (set-face-attribute 'default nil :height 190  :font "Input Mono Compressed" :weight 'regular))
 ((font-existsp "PragmataPro")
  (set-face-attribute 'default nil :height 131 :font "PragmataPro"))
 ((font-existsp "Menlo")
  (set-face-attribute 'default nil :height 121 :font "Menlo"))
 ((font-existsp "Inconsolata")
  (set-face-attribute 'default nil :height 121 :font "Inconsolata"))
   )


;; Line-spacing tweak
;; Set this to a different number depending on taste and the fonr
;; selected. The value can be a integer or decimal number.
;; if integer: it means pixels, added below each line.
;; if float (e.g 0.02): a scaling factor relative to current window's default line height.
;; if nil: add no extra spacing.

(setq-default line-spacing 0.4) ;; tuned for Input Source Mono

;; Further customizations


;; Cursor is a bar but thicker than default
(setq-default cursor-type '(bar . 3))

;; Use pretty icons with neo tree
(setq neo-theme 'icons)

;; Increase spacing between line numbers and text in linum-mode
(setq linum-format "%4d ")

;; Wider fringe to fake padding
(setq-default left-fringe-width  10)
(setq-default right-fringe-width  10)

;; Allow org-refile to send stuff to any file in ~org-agenda-files~; copied from [[http://doc.norang.ca/org-mode.html#Refiling][here]]

; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)

; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)

; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

; Use IDO for both buffer and file completion and ido-everywhere to t
(setq org-completion-use-ido t)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))
; Use the current window when visiting files and buffers with ido
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)
; Use the current window for indirect buffer display
(setq org-indirect-buffer-display 'current-window)

;;;; Refile settings
; Exclude DONE state tasks from refile targets
(defun bh/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets"
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(setq org-refile-target-verify-function 'bh/verify-refile-target)
