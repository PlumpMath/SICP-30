;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;        Factorial-Linear_Iteration_Version(Block_Structure).scm
;;
;;               by Lawrence R. Amlord
;;                 Date: Apr. 7, 2013
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program computes factorials by means of Linear Iteration in
;; block structure. 
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Definition of Procedures
(define (factorial n)
  (define (iter product counter)
    (if (> counter n)
        product
        (iter (* product counter)
              (+ counter 1))))
  (iter 1 1))

;; Test of Procedures
(factorial 6)