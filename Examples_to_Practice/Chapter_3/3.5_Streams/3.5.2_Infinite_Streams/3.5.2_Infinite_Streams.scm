;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       3.5.2_Infinite_Streams.scm
;;                       originated from SICP
;;                       edited by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Nov 22nd, 2013
;;                       Xi'an, China

;; Copyright (C) 1984-2013 Harold Abelson and Gerald Jay Sussman
;; with Julie Sussman

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

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))
;Value: stream-ref

(define (stream-filter pred stream)
  (cond ((stream-null? stream) the-empty-stream)
	((pred (stream-car stream))
	 (cons-stream (stream-car stream)
		      (stream-filter pred
				     (stream-cdr stream))))
	(else (stream-filter pred (stream-cdr stream)))))
;Value: stream-filter



(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))
;Value: integers-starting-from

(define integers (integers-starting-from 1))
;Value: integers

(define (divisible? x y)
  (= (remainder x y) 0))
;Value: divisible?

(define no-sevens
  (stream-filter (lambda (x) (not (divisible? x 7)))
		 integers))
;Value: no-sevens

(stream-ref no-sevens 100)
;Value: 117

(define (fibgen a b)
  (cons-stream a (fibgen b (+ a b))))
;Value: fibgen

(define fibs (fibgen 0 1))
;Value: fibs

(stream-ref fibs 0)
;Value: 0

(stream-ref fibs 1)
;Value: 1

(stream-ref fibs 2)
;Value: 1

(stream-ref fibs 3)
;Value: 2

(stream-ref fibs 4)
;Value: 3

(stream-ref fibs 5)
;Value: 5

(stream-ref fibs 6)
;Value: 8

(stream-ref fibs 7)
;Value: 13

(stream-ref fibs 8)
;Value: 21

(stream-ref fibs 9)
;Value: 34

(stream-ref fibs 10)
;Value: 55

(define (sieve stream)
  (cons-stream
   (stream-car stream)
   (sieve (stream-filter
	   (lambda (x)
	     (not (divisible? x (stream-car stream))))
	   (stream-cdr stream)))))
;Value: sieve

(define primes (sieve (integers-starting-from 2)))
;Value: primes

(stream-ref primes 50)
;Value: 233



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;     Defining streams implicitly
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define ones (cons-stream 1 ones))
;Value: ones

(define (add-stream s1 s2)
  (stream-map + s1 s2))
;Value: add-stream

(define integers (cons-stream 1 (add-stream ones integers)))
;Value: integers

(define (divisible? x y)
  (= (remainder x y) 0))
;Value: divisible?

(define no-sevens
  (stream-filter (lambda (x) (not (divisible? x 7)))
		 integers))
;Value: no-sevens

(stream-ref no-sevens 100)
;Value: 117

(define fibs
  (cons-stream 0
	       (cons-stream 1
			    (add-stream (stream-cdr fibs)
					fibs))))
;Value: fibs

(stream-ref fibs 0)
;Value: 0

(stream-ref fibs 1)
;Value: 1

(stream-ref fibs 2)
;Value: 1

(stream-ref fibs 3)
;Value: 2

(stream-ref fibs 4)
;Value: 3

(stream-ref fibs 5)
;Value: 5

(stream-ref fibs 6)
;Value: 8

(stream-ref fibs 7)
;Value: 13

(stream-ref fibs 8)
;Value: 21

(stream-ref fibs 9)
;Value: 34

(stream-ref fibs 10)
;Value: 55

(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))
;Value: scale-stream

(define double (cons-stream 1 (scale-stream double 2)))
;Value: double

(stream-ref double 0)
;Value: 1

(stream-ref double 1)
;Value: 2

(stream-ref double 2)
;Value: 4

(stream-ref double 3)
;Value: 8

(stream-ref double 4)
;Value: 16

(stream-ref double 5)
;Value: 32

(define primes
  (cons-stream
   2
   (stream-filter prime? (integers-starting-from 3))))
;Value: primes

(define (prime? n)
  (define (iter ps)
    (cond ((> (square (stream-car ps)) n) true)
	  ((divisible? n (stream-car ps)) false)
	  (else (iter (stream-cdr ps)))))
  (iter primes))
;Value: prime?

(stream-ref primes 50)
;Value: 233

