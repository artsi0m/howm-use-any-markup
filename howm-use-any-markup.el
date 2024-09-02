;; -*- lexical-binding: t; -*-

;; Command to use howm with various major modes  
;; Copyright (C) 2024  "Artsiom Karakin" karakin2000@gmail.com
;; See LICENSE.txt for license of this code

(defun howm-insert-prop-line (mode)
"Enable & save major mode to prop-line to use with howm in the file local variable"
(howm-mode)
(let* ((modes (mapcar #'cdr auto-mode-alist))
       (mode-name (symbol-name mode))
       (mode (intern-soft mode-name)))
  (unless (or (null mode)
	      (eq mode major-mode)))
  (funcall mode)
  (howm-mode)
  (add-file-local-variable-prop-line
   'mode (intern (string-trim-right mode-name "-mode\\'"))))
    (interactive
    (let*
	((modes (mapcar #'cdr auto-mode-alist))
	 (mode-name (completing-read "Choose major mode: " modes))
	 (mode (intern-soft mode-name)))
      (unless (or (null mode)
	  (eq mode major-mode))
	(funcall mode)
	(howm-mode)
	(add-file-local-variable-prop-line
	 'mode (intern (string-trim-right mode-name "-mode\\'")))))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
