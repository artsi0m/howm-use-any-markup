# Howm use any markup

In this repo I want to demonstrate how any markup can be used with hitori-otegaru-wiki-modoki emacs minor mode.
It may gain more functionality in the future.

## Installation

### vc-use-package
``` elisp
(use-package howm-use-any-markup
  :vc (:url "https://github.com/artsi0m/howm-use-any-markup")
  :ensure t)
```

## Commands
### howm-insert-prop-line

Change emacs major mode in a buffer and add file local variable
(prop-line) to set selected major mode automatically on the next
occurence of opening that file.

<img width="718" height="711" alt="Annotated GNU Emacs scrennshot demonstrating multiple markups i.e. org-mode, markdown used 
  inside howm-mode" src="https://github.com/user-attachments/assets/6d0565df-636f-409b-962f-19060b41d22a" />

