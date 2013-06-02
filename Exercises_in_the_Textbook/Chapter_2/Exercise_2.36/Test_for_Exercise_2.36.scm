;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.36.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Jun 2nd, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;Value: accumulate

(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
;Value: s


;; Test of the first implementation of accumulate-n

;Value: accumulate-n

;Value: first-elements-sequence

;Value: reduced-sequences

(accumulate-n + 0 s)
;Value 21: (22 26 30)


;; Test of the second implementation of accumulate-n

;Value: accumulate-n

(accumulate-n + 0 s)
;Value 23: (22 26 30)

