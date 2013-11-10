;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.19.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       May 28th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (reverse items)
  (define (last-element items)
    (if (null? (cdr items))
	(car items)
	(last-element (cdr items))))
  (define (former-sublist items)
    (if (null? (cdr items))
	'()
	(cons (car items) (former-sublist (cdr items)))))
  (if (null? (cdr items))
      items
      (cons (last-element items) (reverse (former-sublist items)))))
;Value: reverse

;Value: cc

;Value: first-denomination

;Value: except-first-denomination

;Value: no-more?

(define us-coins (list 50 25 10 5 1))
;Value: us-coins

(define uk-coins (list 100 50 20 10 5 2 1 0.5))
;Value: uk-coins

(cc 100 us-coins)
;Value: 292

(cc 100 (reverse us-coins))
;Value: 292

(cc 100 uk-coins)
;Value: 104561

(cc 100 (reverse uk-coins))
;Value: 104561
