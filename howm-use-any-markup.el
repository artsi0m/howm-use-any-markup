;; Commands to use howm with various markup major modes
;; Copyright (C) 2024  "Artsiom Karakin" karakin2000@gmail.com
;; See LICENSE.txt for license of this code

(defun howm-set-major-mode ()
  "Choose mode and set it as major and howm as minor mode for a file.
   Add first with file local variable specifying org as major mode"
    (interactive)
    (howm-mode)
    (let*
	((modes-list (mapcar #'cdr auto-mode-alist))
	 (curr-mode (completing-read "Choose major mode: " modes-list))
	 (curr (string-trim-right curr-mode "-mode")))
      (unless (eq major-mode 'curr-mode)
	(funcall (intern curr-mode))
	(howm-mode)
	(add-file-local-variable-prop-line
	 'mode curr))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun howm-set-org-mode ()
  "Set org as major and howm as minor mode for a file.
   Add first with file local variable specifying org as major mode"
  (interactive)
  (howm-mode)
  (unless (eq major-mode 'org-mode)
    (org-mode)
    (howm-mode)
  (add-file-local-variable-prop-line 'mode 'org)))


(defun howm-set-markdown-mode ()
  "Set markdown as major and howm as minor mode for a file.
   Add first with file local variable specifying markdown as major mode"
  (interactive)
  (howm-mode)
  (unless (eq major-mode 'markdown-mode)
    (markdown-mode)
    (howm-mode)
  (add-file-local-variable-prop-line 'mode 'markdown)))

(defun howm-set-rst-mode ()
  "Set rst as major and howm as minor mode for a file.
   Add first with file local variable specifying rst as major mode"
  (interactive)
  (howm-mode)
    (unless (eq major-mode 'rst-mode)
    (rst-mode)
    (howm-mode)
  (add-file-local-variable-prop-line 'mode 'rst)))

(defun howm-set-adoc-mode ()
  "Set adoc as major and howm as minor mode for a file.
   Add first with file local variable specifying adoc as major mode"
  (interactive)
  (howm-mode)
    (unless (eq major-mode 'adoc-mode)
    (adoc-mode)
    (howm-mode)
  (add-file-local-variable-prop-line 'mode 'adoc)))
