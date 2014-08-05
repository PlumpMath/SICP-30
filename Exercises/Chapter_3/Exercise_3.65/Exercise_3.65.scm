;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_3.65.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Dec 1st, 2013
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

(define (add-streams s1 s2)
  (stream-map + s1 s2))
;Value: add-streams

(define (partial-sums S)
  (cons-stream (stream-car S)
	       (add-streams (partial-sums S)
			    (stream-cdr S))))
;Value: partial-sums

(define (ln2-summands n)
  (cons-stream (/ 1.0 n)
	       (stream-map - (ln2-summands (+ n 1)))))
;Value: ln2-summands

(define ln2-stream
  (partial-sums (ln2-summands 1)))
;Value: ln2-stream

(display-stream ln2-stream)

1.
.5
.8333333333333333
.5833333333333333
.7833333333333332
.6166666666666666
.7595238095238095
.6345238095238095
.7456349206349207
.6456349206349207
.7365440115440116
.6532106782106782
.7301337551337552
.6587051837051838
.7253718503718505
... (continue until the stack overflows)



(define (euler-transform s)
  (let ((s0 (stream-ref s 0))
	(s1 (stream-ref s 1))
	(s2 (stream-ref s 2)))
    (cons-stream (- s2 (/ (square (- s2 s1))
			  (+ s0 (* -2 s1) s2)))
		 (euler-transform (stream-cdr s)))))
;Value: euler-transform

(define (square x) (* x x))
;Value: square

(display-stream (euler-transform ln2-stream))

.7
.6904761904761905
.6944444444444444
.6924242424242424
.6935897435897436
.6928571428571428
.6933473389355742
.6930033416875522
.6932539682539683
.6930657506744464
.6932106782106783
.6930967180967181
.6931879423258734
.6931137858557215
.6931748806748808
... (continue until the stack overflows)



(define (make-tableau transform s)
  (cons-stream s
	       (make-tableau transform
			     (transform s))))
;Value: make-tableau

(define (accelerated-sequence transform s)
  (stream-map stream-car
	      (make-tableau transform s)))
;Value: accelerated-sequence

(display-stream (accelerated-sequence euler-transform
				      ln2-stream))

1.
.7
.6932773109243697
.6931488693329254
.6931471960735491
.6931471806635636
.6931471805604039
.6931471805599445
.6931471805599427
.6931471805599454
#[NaN]
#[NaN]
#[NaN]
#[NaN]
#[NaN]
... (continue until the stack overflows)

