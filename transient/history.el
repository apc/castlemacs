((magit-commit
  ("--all"))
 (magit-diff
  (("--" "setup.org")
   "--no-ext-diff" "--stat"))
 (magit-reset nil)
 (magit:-- "setup.org"))
