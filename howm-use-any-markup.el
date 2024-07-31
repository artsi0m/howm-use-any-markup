;; Command to use howm with various major modes
;; Copyright (C) 2024  "Artsiom Karakin" karakin2000@gmail.com
;; See LICENSE.txt for license of this code

(defun howm-set-major-mode ()
  "Choose mode and set it as major and howm as minor mode for a file.
   Add first line with file local variable specifying selected mode
   as major mode"
    (interactive)
    (howm-mode)
    (let*
	((modes (mapcar #'cdr auto-mode-alist))
	 (mode-name (completing-read "Choose major mode: " modes))
	 (mode (intern-soft mode-name)))
      (unless (or (null mode)
	  (eq mode major-mode))
	(funcall mode)
	(howm-mode)
	(add-file-local-variable-prop-line
	 'mode (intern (string-trim-right mode-name "-mode\\'"))))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
