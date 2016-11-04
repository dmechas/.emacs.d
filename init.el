;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)


(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line


;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(editorconfig
     atom-one-dark-theme
)))

(setq package-list
    '(editorconfig
      atom-one-dark-theme
      auto-complete
      markdown-mode
      typescript-mode
      elixir-mode
      alchemist
      helm
))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


(require 'atom-one-dark-theme)
(load-theme 'atom-one-dark t)
(editorconfig-mode 1)

