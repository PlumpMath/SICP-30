;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;                     Exercise_1.12.scm
;;                  by Lawrence R. Amlord(颜世敏)
;;                       Apr 14, 2013
;;                       Xi'an, China
;;
;; License: Creative Commons Attribution-NonCommercial-ShareAlike 3.0 
;;   Unported
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define (pascal-triangle row column)
  (cond ((or (< column 1) (< row column)) 0)
        ((or (= column 1) (= row column)) 1)
        (else (+ (pascal-triangle (- row 1) (- column 1))
                 (pascal-triangle (- row 1) column)))))


;; Test of the Procedure

(pascal-triangle 0 1)
(newline)

(pascal-triangle -1 -1)
(newline)

(pascal-triangle 0 0)
(newline)

(pascal-triangle 5 0)
(newline)

(pascal-triangle 4 2)
(newline)

(pascal-triangle 4 3)
(newline)

(pascal-triangle 5 3)
(newline)