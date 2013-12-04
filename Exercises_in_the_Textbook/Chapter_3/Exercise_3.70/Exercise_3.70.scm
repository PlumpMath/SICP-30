;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_3.70.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Dec 4th, 2013
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
					      (merge-weighted weight (stream-cdr s1) (stream-cdr s2)))))))))))



(define (weighted-pairs weight s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (merge-weighted
    weight
    (stream-map (lambda (x) (list (stream-car s) x))
		(stream-cdr t))
    (weighted-pairs weight (stream-cdr s) (stream-cdr t)))))



(define sum-pairs
  (weighted-pairs (lambda (pair) (+ (car pair) (cadr pair)))
		  integers
		  integers))



(define (divide? a b)
  (= (remainder b a) 0))

(define anti-hamming-int
  (stream-filter (lambda (x)
		   (and (not (divide? 2 x))
			(not (divide? 3 x))
			(not (divide? 5 x))))
		 integers))

(define anti-hamming-pairs
  (weighted-pairs (lambda (pair)
		    (+ (* 2 (car pair))
		       (* 3 (cadr pair))
		       (* 5 (car pair) (cadr pair))))
		  anti-hamming-int
		  anti-hamming-int))
