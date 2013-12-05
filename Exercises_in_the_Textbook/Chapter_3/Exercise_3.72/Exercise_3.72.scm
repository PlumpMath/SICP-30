;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_3.72.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Dec 5th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜世敏, aka 颜序)
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

(define (stream-for-each proc s)
  (if (stream-null? s)
      'done
      (begin (proc (stream-car s))
	     (stream-for-each proc (stream-cdr s)))))
;Value: stream-for-each

(define (display-stream s)
  (stream-for-each display-line s))
;Value: display-stream

(define (display-line x)
  (newline)
  (display x))
;Value: display-line

(define ones (cons-stream 1 ones))
;Value: ones

(define (add-streams s1 s2)
  (stream-map + s1 s2))
;Value: add-streams

(define integers (cons-stream 1 (add-streams ones integers)))
;Value: integers

(define (merge-weighted weight s1 s2)
  (cond ((stream-null? s1) s2)
	((stream-null? s2) s1)
	(else
	 (let ((s1car (stream-car s1))
	       (s2car (stream-car s2)))
	   (let ((s1car-weight (weight s1car))
		 (s2car-weight (weight s2car)))
	     (cond ((< s1car-weight s2car-weight)
		    (cons-stream s1car
				 (merge-weighted weight (stream-cdr s1) s2)))
		   ((> s1car-weight s2car-weight)
		    (cons-stream s2car
				 (merge-weighted weight s1 (stream-cdr s2))))
		   (else
		    (cons-stream s1car
				 (cons-stream s2car
					      (merge-weighted weight
							      (stream-cdr s1)
							      (stream-cdr s2)))))))))))
;Value: merge-weighted

(define (weighted-pairs weight s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (merge-weighted
     weight
     (stream-map (lambda (x) (list (stream-car s) x))
		 (stream-cdr t))
     (weighted-pairs weight (stream-cdr s) (stream-cdr t)))))
;Value: weighted-pairs

(define (square x) (* x x))
;Value: square

(define (square-sum x y)
  (+ (square x) (square y)))
;Value: square-sum

(define square-sum-weighted-pairs
  (weighted-pairs (lambda (pair)
		    (square-sum (car pair) (cadr pair)))
		  integers
		  integers))
;Value: square-sum-weighted-pairs

(define (filter-same-weight weight stream)
  (cond ((stream-null? stream) the-empty-stream)
	((= (weight (stream-car stream))
	    (weight (stream-car (stream-cdr stream)))
	    (weight (stream-car (stream-cdr (stream-cdr stream)))))
	 (cons-stream (stream-car stream)
		      (filter-same-weight weight (stream-cdr stream))))
	(else (filter-same-weight weight (stream-cdr stream)))))
;Value: filter-same-weight

(define three-way-square-sums
  (stream-map (lambda (pair)
		(+ (square (car pair))
		   (square (cadr pair))))
	      (filter-same-weight (lambda (pair)
				    (square-sum (car pair) (cadr pair)))
				  square-sum-weighted-pairs)))
;Value: three-way-square-sums

(display-stream three-way-square-sums)

325
425
650
725
845
850
... ; continue until the stack overflows

