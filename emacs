;; -----------------------------------------------------------------------------
;;
;; [ FILE ] Emacs customization file
;; [ NAME ] .emacs
;; [ PATH ] ~/.emacs
;; [ AUTH ] Benjamin Skinner @btskinner
;; [ INIT ] 2 August 2017
;; [ REVN ] 16 October 2018
;;
;; -----------------------------------------------------------------------------

;; ENVIRONMENT
(unless (getenv "LANG") (setenv "LANG" "en_US.UTF-8"))

;; PACKAGES

;; add MELPA packages
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; THEME AND VISUAL SETTINGS

;; high-contrast zenburn theme (M-x package-list-packages to install)
(load-theme 'hc-zenburn t)

;; no tool bar
(tool-bar-mode 0)

;; no scroll bars
(scroll-bar-mode -1)

;; no start up message
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; removes *messages* from the buffer
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Removes *Completions* from buffer
(add-hook 'minibuffer-exit-hook
    '(lambda ()
       (let ((buffer "*Completions*"))
         (and (get-buffer buffer)
        (kill-buffer buffer)))))

;; no audible or visual bell when emacs is mad
(setq ring-bell-function 'ignore)

;; font size
(set-face-attribute 'default nil :height 160)

;; turn on line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; default frame size
(add-to-list 'default-frame-alist '(width . 90)
       '(height . 100))

;; GENERAL SETTINGS

;; use the tab key to make 2 spaces
(setq tab-width 2)
(setq indent-tabs-mode nil)

;; no backup~ files
(setq make-backup-files nil)

;; no #autosave# files
(setq auto-save-default nil)

;; allow upcase (C-x C-u) and downcase (C-x C-l) region
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; KEY BINDINGS/MODIFICATIONS

;; jump to other frame (split screen)
(global-set-key [C-tab] 'other-frame)

;; Mac option and command keys to meta (helps with non-Mac external keyboard)
(setq mac-option-key-is-meta t
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'meta)

;; my comment style for Stata
(defun my-Stata-comment-style ()
  "Change comment style for ESS Stata"
  (if (string= ess-language "STA")
      (progn
  (setq comment-start "// "
        comment-end   ""))))

;; add my Stata comment style to hook
(add-hook 'ess-mode-hook 'my-Stata-comment-style)

;; Stata name
(setq inferior-STA-program-name "stata-se")

;; MODES

;; R mode style
(add-hook 'R-mode-style
    (lambda () (ess-set-style 'RRR)))

;; ESS change : to smart <- key in R
(setq ess-smart-S-assign-key ";")
(ess-toggle-S-assign nil)
(ess-toggle-S-assign nil)

;; Macros indent in C/C++ code
(c-set-offset (quote cpp-macro) 0 nil)

;; set LaTeX engine
(setq TeX-engine (quote xetex))

;; save when compiling
(setq TeX-save-query nil)

;; add synctex
(setq LaTeX-command "pdflatex -synctex=1")

;; auctex parse on load and save
(setq tex-parse-self t)
(setq tex-auto-save t)

(setq TeX-command-list
   (quote
    (("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil
      (latex-mode doctex-mode) :help "Run LaTeX")
     ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX")
     ("Biber" "biber %s" TeX-run-Biber t t :help "Run Biber")
     ("View" "%V" TeX-run-discard-or-function nil t :help "Run Viewer"))))

;; set default TeX command
(setq TeX-command-default "pdflatex")

;; SWV settings
(setq ess-swv-processor (quote knitr))
(setq ess-swv-pdflatex-commands '("pdflatex"))
(define-key ess-noweb-minor-mode-map "\M-nP" 'ess-swv-weave-PDF)

;; only change sectioning colour
(setq font-latex-fontify-sectioning 'color)

;; super-/sub-script on baseline
(setq font-latex-script-display (quote (nil)))

;; do not change super-/sub-script font
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-latex-subscript-face ((t nil)))
 '(font-latex-superscript-face ((t nil))))

;; exclude bold/italic from keywords
(setq font-latex-deactivated-keyword-classes
    '("italic-command" "bold-command" "italic-declaration" "bold-declaration"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (writeroom-mode hc-zenburn-theme))))

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))

;; -----------------------------------------------------------------------------
;; END FILE
;; -----------------------------------------------------------------------------
