;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_3.27.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Oct 8th, 2013
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

(define (make-table)
  (list '*table*))
;Value: make-table

(define (lookup key table)
  (let ((record (assoc key (cdr table))))
    (if record
	(cdr record)
	false)))
;Value: lookup

(define (assoc key records)
  (cond ((null? records) false)
	((equal? key (caar records)) (car records))
	(else (assoc key (cdr records)))))
;Value: assoc

(define (insert! key value table)
  (let ((record (assoc key (cdr table))))
    (if record
	(set-cdr! record value)
	(set-cdr! table
		  (cons (cons key value)
			(cdr table)))))
  'ok)
;Value: insert!

(define (memorize f)
  (let ((table (make-table)))
    (lambda (x)
      (let ((previously-computed-result (lookup x table)))
	(or previously-computed-result
	    (let ((result (f x)))
	      (insert! x result table)
	      result))))))
;Value: memorize

(define memo-fib
  (memorize (lambda (n)
	      (cond ((= n 0) 0)
		    ((= n 1) 1)
		    (else (+ (memo-fib (- n 1))
			     (memo-fib (- n 2))))))))
;Value: memo-fib

(memo-fib 0)
;Value: 0

(memo-fib 1)
;Value: 1

(memo-fib 2)
;Value: 1

(memo-fib 3)
;Value: 2

(memo-fib 4)
;Value: 3

(memo-fib 5)
;Value: 5

(memo-fib 6)
;Value: 8

(memo-fib 7)
;Value: 13

(memo-fib 8)
;Value: 21

(memo-fib 9)
;Value: 34

(memo-fib 10)
;Value: 55

