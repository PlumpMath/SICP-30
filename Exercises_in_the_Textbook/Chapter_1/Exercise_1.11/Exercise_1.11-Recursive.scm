;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;                  Exercise_1.11-Recursive.scm
;;                  by Lawrence R. Amlord(颜世敏)
;;                       Apr. 12, 2013
;;                       Xi'an, China
;;
;; License: Creative Commons Attribution-NonCommercial-ShareAlike 3.0 
;;   Unported
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Definition of the Procedure
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

;; Test of the Procedure
(f 5)
(newline)

(f 12)
(newline)

(f 21)