;;; howm-use-any-markup.el --- Use different major mode for each note -*- lexical-binding: t; -*-

;; Copyright (C) 2024, 2026 Free Software Foundation, Inc.

;; Author: Artsiom Karakin <karakin2000@gmail.com>
;; Created: 2024-08-02
;; Version: 0.1.3
;; Package-Requires: ((emacs "23.2") (howm "1.22"))
;; Keywords: wiki
;; URL: https://github.com/artsi0m/howm-use-any-markup

;;; This file is not part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU Lesser General Public License as
;; published by the Free Software Foundation; either version 2.1, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; This package provides command howm-insert-prop-line, that inserts
;; prop-line file local variable of selected major mode into first line
;; of the file and than enables howm minor mode. Next time this file
;; opened emacs will automatically set specified major mode.  It may gain
;; more functionality in the future.

(require 'howm)

;;;###autoload
(defun howm-insert-prop-line (&optional mode)
  "Enable & save major mode to the -*- line to use it with howm.
Either M-x howm-insert-prop-line or
(howm-insert-prop-line 'example-major-mode) to call it."
  (interactive (list (intern
                      (completing-read "Choose major mode: "
                                       (mapcar #'cdr auto-mode-alist)
                                       nil t))))
  (funcall mode)
  (howm-mode)
  (add-file-local-variable-prop-line
   'mode (intern (string-trim-right (symbol-name mode) "-mode"))))
;; programmatically:  (howm-insert-prop-line 'c-mode)

(provide 'howm-use-any-markup)
