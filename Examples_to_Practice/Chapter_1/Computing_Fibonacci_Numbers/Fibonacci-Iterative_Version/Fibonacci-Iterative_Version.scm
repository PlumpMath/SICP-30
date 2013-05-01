;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;               Fibonacci-Iterative_Version.scm
;;                   by Lawrence R. Amlord
;;                    Date: Apr. 9, 2013
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Definition of Procedure
(define (fib n)
  (define (fib-iter a b n)
    (if (= n 0)
        b
        (fib-iter (+ a b) a (- n 1))))
  (fib-iter 1 0 n))

;; Test of Procedure
(fib 5)

(fib 10)