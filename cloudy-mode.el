;;; cloudy-mode.el --- major mode for editing cloudy model .in file

;; Version: 0.0.1
;;; License:
;; You can redistribute this program and/or modify it under the terms of the GNU General Public License version 3.
;; @indiajoe

;;; Commentary:
;; This major mode is mainly to color syntax cody model.in file.

;; To start thie mode type M-x cloudy-mode


;; To Install (Instruction)
;; copy cloudy-mode.el to ~/.emacs.d/
;; And add the following line in ~/.emacs
;; (add-to-list 'load-path "~/.emacs.d/")
;; (require 'cloudy-mode)

;;; Code:
;; Based on http://ergoemacs.org/emacs/elisp_syntax_coloring.html

;; define the comment syntaxes
(setq comment-start "c ")
(setq comment-end "")

;; define several category of keywords
(setq cloudy-keywords '("stop" "save" "print" "continue" "monitor" "title" 
			"iterate" "compile" "init" "plot") )
(setq cloudy-types '("microns" "parsec" "linear" "log" "deg" "radians" 
		     "minutes" "days" "weeks" "fortnights" "months" 
		     "years" "centuries" "millennia"
		     "jansky" "mJy" "erg/s/sqcm/Hz" "Ryd"))
(setq cloudy-constants '("neutral column density" "temperature" "continuum" 
			 "overview" "heating" "cooling"))
(setq cloudy-functions '("hden" "ionization parameter" "abundances" "blackbody" "constant" 
			 "cosmic rays background" "radius" "set" "element" "abund" "no" 
			 "normalize" "age" "sphere" "cmb" "grains" "grid" "optimize" "end"
			 "luminosity" "extinguish" "table" "ratio" "metals" "tlaw" "atom"))
(setq cloudy-events '("on" "off"))

;; generate regex string for each category of keywords
(setq cloudy-keywords-regexp (regexp-opt cloudy-keywords 'words))
(setq cloudy-type-regexp (regexp-opt cloudy-types 'words))
(setq cloudy-constant-regexp (regexp-opt cloudy-constants 'words))
(setq cloudy-functions-regexp (regexp-opt cloudy-functions 'words))
(setq cloudy-event-regexp (regexp-opt cloudy-events 'words))

;; create the list for font-lock.
;; each category of keyword is given a particular face
(setq cloudy-font-lock-keywords
      `(
	(,cloudy-event-regexp . font-lock-builtin-face)
	(,cloudy-type-regexp . font-lock-type-face)
        (,cloudy-functions-regexp . font-lock-function-name-face)
	(,cloudy-constant-regexp . font-lock-constant-face)
        (,cloudy-keywords-regexp . font-lock-keyword-face)
        ;; note: order above matters, because once colored, that part won't change.
        ;; in general, longer words first
        ))

;;; ###autoload
(define-derived-mode cloudy-mode prog-mode
  "cloudy mode"
  "Major mode for editing cloudy (Simulation model.in) file."

  ;; code for syntax highlighting
  (setq font-lock-defaults '((cloudy-font-lock-keywords))))

;; clear memory. no longer needed
(setq cloudy-keywords nil)
(setq cloudy-types nil)
(setq cloudy-constants nil)
(setq cloudy-functions nil)
(setq cloudy-events nil)

;; clear memory. no longer needed
(setq cloudy-keywords-regexp nil)
(setq cloudy-type-regexp nil)
(setq cloudy-constants-regexp nil)
(setq cloudy-functions-regexp nil)
(setq cloudy-events-regexp nil)

;; add the mode to the `features' list
(provide 'cloudy-mode)


;; Local Variables:
;; coding: utf-8
;; End:

;;; cloudy-mode.el ends here
