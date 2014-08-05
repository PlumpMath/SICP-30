;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;                       Test_for_Exercise_2.37.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Jun 3rd, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;Value: accumulate

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map car seqs))
	    (accumulate-n op init (map cdr seqs)))))
;Value: accumulate-n

;Value: dot-product

;Value: matrix-*-vector

;Value: transpose

;Value: matrix-*-matrix

(define v (list 1 2 4 8))
;Value: v

(define w (list 3 5 7 9))
;Value: w

(define m (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
;Value: m

(define n (list (list 2 3 4) (list 5 6 7) (list 8 7 6) (list 5 4 3)))
;Value: n



(dot-product v w)
;Value: 113

(matrix-*-vector m v)
;Value 20: (49 86 124)

(transpose m)
;Value 24: ((1 4 6) (2 5 7) (3 6 8) (4 6 9))

(matrix-*-matrix m n)
;Value 25: ((56 52 48) (111 108 105) (156 152 148))

