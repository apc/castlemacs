;; This is your private configuration file. It is loaded automatically, so feel free to add whatever you want.
;; This file will not be affected by Castlemacs updates.


(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
(load-theme 'nord t)
;; (when (eq system-type 'darwin) (ns-auto-titlebar-mode))

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
 ((font-existsp "Input Mono Compressed")
  (set-face-attribute 'default nil :height 181 :font "Input Mono Compressed"))
 ((font-existsp "PragmataPro")
  (set-face-attribute 'default nil :height 131 :font "PragmataPro"))
  ((font-existsp "Source Code Pro")
  (set-face-attribute 'default nil :height 121 :font "Source Code Pro"))
 ((font-existsp "Menlo")
  (set-face-attribute 'default nil :height 121 :font "Menlo"))
 ((font-existsp "Consolas")
  (set-face-attribute 'default nil :height 121 :font "Consolas"))
 ((font-existsp "Inconsolata")
  (set-face-attribute 'default nil :height 121 :font "Inconsolata"))
   ((font-existsp "Envy Code R")
  (set-face-attribute 'default nil :height 121 :font "Envy Code R"))
   )


;; Line-spacing tweak
;; Set this to a different number depending on taste and the fonr
;; selected. The value can be a integer or decimal number.
;; if integer: it means pixels, added below each line.
;; if float (e.g 0.02): a scaling factor relative to current window's default line height.
;; if nil: add no extra spacing.

(setq-default line-spacing 0.16) ;; tuned for Input Source Mono

;; Further customizations

(when (memq window-system '(mac ns))
  (add-to-list 'default-frame-alist '(ns-appearance . dark)) ;; {light, dark}
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t)))
