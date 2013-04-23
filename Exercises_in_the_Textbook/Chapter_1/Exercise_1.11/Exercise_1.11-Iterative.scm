;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;                  Exercise_1.11-Iterative.scm
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
  (define (f-iter a b c count)
    (if (= count 0)
        c
        (f-iter (+ a (* 2 b) (* 3 c))
                a
                b
                (- count 1))))
  (f-iter 2 1 0 n))

;; Test of the Procedure
(f 5)
(newline)

(f 12)
(newline)

(f 21)