;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_4.25.scm
;;                       originated from SICP
;;                       edited by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Feb 19th, 2014
;;                       Fuzhou, China

;; Copyright (C) 1984-2014 Harold Abelson and Gerald Jay Sussman
;; with Julie Sussman

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (unless condition usual-value exceptional-value)
  (if conditional exceptional-value usual-value))
;Value: unless

(define (factorial n)
  (unless (= n 1)
	  (* n (factorial (- n 1)))
	  1))
;Value: factorial

(factorial 5)

;Aborting!: maximum recursion depth exceeded

