
;;; packages.el --- renpy layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: trey <trey@Henry>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `renpy-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `renpy/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `renpy/pre-init-PACKAGE' and/or
;;   `renpy/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst renpy-packages
  '(
    company
    flycheck
    renpy
    smartparens
    )

  "The list of Lisp packages required by the renpy layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun renpy/post-init-company ()
  (spacemacs|add-company-backends :backends company-capf :modes renpy-mode))

(defun renpy/post-init-smartparens ()
       (add-hook 'renpy-mode-hook 'smartparens-mode))

(defun renpy/post-init-flycheck ()
  (spacemacs/enable-flycheck 'renpy-mode))

(defun renpy/init-renpy ()
  (use-package renpy
    :defer t))
;; packages.el ends here
