;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Sequences_as_Conventional_Interfaces.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Nov 14th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (sum-odd-squares tree)
  (cond ((null? tree) 0)
	((not (pair? tree))
	 (if (odd? tree) (square tree) 0))
	(else
	 (+ (sum-odd-squares (car tree))
	    (sum-odd-squares (cdr tree))))))
;Value: sum-odd-squares

(define (square x)
  (* x x))
;Value: square

(sum-odd-squares
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
;Value: 84

(define (even-fibs n)
  (define (next k)
    (if (> k n)
	'()
	(let ((f (fib k)))
	  (if (even? f)
	      (cons f (next (+ k 1)))
	      (next (+ k 1))))))
  (next 0))
;Value: even-fibs

(define (fib n)
  (cond ((= n 0) 0)
	((= n 1) 1)
	(else
	 (+ (fib (- n 1))
	    (fib (- n 2))))))
;Value: fib

(even-fibs 10)
;Value 21: (0 2 8 34)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Sequence Operations
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(map square (list 1 2 3 4 5))
;Value 14: (1 4 9 16 25)

(define (filter predicate sequence)
  (cond ((null? sequence) '())
	((predicate (car sequence))
	 (cons (car sequence)
	       (filter predicate (cdr sequence))))
	(else (filter predicate (cdr sequence)))))
;Value: filter

(filter odd? (list 1 2 3 4 5))
;Value 15: (1 3 5)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;Value: accumulate

(accumulate + 0 (list 1 2 3 4 5))
;Value: 15

(accumulate * 1 (list 1 2 3 4 5))
;Value: 120

(accumulate cons '() (list 1 2 3 4 5))
;Value 16: (1 2 3 4 5)

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low
	    (enumerate-interval (+ low 1) high))))
;Value: enumerate-interval

(enumerate-interval 2 7)
;Value 17: (2 3 4 5 6 7)

(define (enumerate-tree tree)
  (cond ((null? tree) '())
	((not (pair? tree)) (list tree))
	(else
	 (append (enumerate-tree (car tree))
		 (enumerate-tree (cdr tree))))))
;Value: enumerate-tree

(enumerate-tree
 (list 1
       (list 2 (list 3 4))
       5))
;Value 18: (1 2 3 4 5)

(define (sum-odd-squares tree)
  (accumulate +
	      0
	      (map square
		   (filter odd?
			   (enumerate-tree tree)))))
;Value: sum-odd-squares

(sum-odd-squares
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
;Value: 84

(define (even-fibs n)
  (accumulate cons
	      '()
	      (filter even?
		      (map fib
			   (enumerate-interval 0 n)))))
;Value: even-fibs

(even-fibs 10)
;Value 22: (0 2 8 34)

(define (list-fib-squares n)
  (accumulate cons
	      '()
	      (map square
		   (map fib
			(enumerate-interval 0 n)))))
;Value: list-fib-squares

(list-fib-squares 10)
;Value 23: (0 1 1 4 9 25 64 169 441 1156 3025)

(define (product-of-squares-of-odd-elements sequence)
  (accumulate *
	      1
	      (map square
		   (filter odd? sequence))))
;Value: product-of-squares-of-odd-elements

(product-of-squares-of-odd-elements (list 1 2 3 4 5))
;Value: 225

(define (salary-of-highest-paid-programmer records)
  (accumulate max
	      0
	      (map salary
		   (filter programmer? records))))
;Value: salary-of-highest-paid-programmer



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;      Nested Mappings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))
;Value: flatmap

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))
;Value: prime-sum?

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
;Value: make-pair-sum

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
	       (flatmap
		(lambda (i)
		  (map (lambda (j) (list i j))
		       (enumerate-interval 1 (- i 1))))
		(enumerate-interval 1 n)))))
;Value: prime-sum-pairs

(prime-sum-pairs 6)
;Value 13: ((2 1 3) (3 2 5) (4 1 5) (4 3 7) (5 2 7) (6 1 7) (6 5 11))

(define (permutations s)
  (if (null? s)                    ; empty set?
      (list '())                   ; sequence containing empty set
      (flatmap (lambda (x)
		 (map (lambda (p) (cons x p))
		      (permutations (remove x s))))
	       s)))
;Value: permutations

(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
	  sequence))
;Value: remove

(permutations (list 1 2 3))
;Value 14: ((1 2 3) (1 3 2) (2 1 3) (2 3 1) (3 1 2) (3 2 1))

