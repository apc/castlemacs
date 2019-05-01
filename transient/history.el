((magit-branch nil)
 (magit-commit nil
               ("--all"))
 (magit-diff
  (("--" "emacs.d/private.el"))
  (("--" "init.el"))
  (("--" "setup.org")
   "--no-ext-diff" "--stat"))
 (magit-reset nil)
 (magit:-- "init.el" "setup.org"))
