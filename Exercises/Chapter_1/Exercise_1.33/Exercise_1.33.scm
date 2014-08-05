;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_1.33.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       May 10th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
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

(define (filter-accumulate filter combiner null-value term a next b)
  (cond ((> a b) null-value)
	((filter a)
	 (combiner (term a)
		   (filter-accumulate filter combiner null-value term (next a) next b)))
	(else (filter-accumulate filter combiner null-value term (next a) next b))))

(define (prime-sum-sq a b)
  (define (prime? n)
    (define (smallest-divisor n)
      (define (find-divisor n test-divisor)
	(define (divide? a b)
	  (= (remainder b a) 0))
	(cond ((> (square test-divisor) n) n)
	      ((divide? test-divisor n) test-divisor)
	      (else (find-divisor n (+ test-divisor 1)))))
      (find-divisor n 2))
    (= (smallest-divisor n) n))
  (filter-accumulate prime? + 0 square a inc b))

(define (relat-prime-product n)
  (define (relat-prime? i)
    (define (gcd a b)
      (if (= b 0)
	  a
	  (gcd b (remainder a b))))
    (= (gcd i n) 1))
  (define (identity x) x)
  (filter-accumulate relat-prime? * 1 identity 1 inc n))

(define (square x)
  (* x x))

(define (inc x)
  (+ x 1))