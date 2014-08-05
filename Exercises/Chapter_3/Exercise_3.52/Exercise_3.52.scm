;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_3.52.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Nov 22nd, 2013
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

(define (cons-stream a b)
  (cons a (delay b)))
;Value: cons-stream

(define (stream-car stream)
  (car stream))
;Value: stream-car

(define (stream-cdr stream)
  (force (cdr stream)))
;Value: stream-cdr

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))
;Value: stream-ref

(define (stream-map proc s)
  (if (stream-null? s)
      the-empty-stream
      (cons-stream (proc (stream-car s))
		   (stream-map proc (stream-cdr s)))))
;Value: stream-map

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

(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream
       low
       (stream-enumerate-interval (+ low 1) high))))
;Value: stream-enumerate-interval

(define (stream-filter pred stream)
  (cond ((stream-null? stream) the-empty-stream)
	((pred (stream-car stream))
	 (cons-stream (stream-car stream)
		      (stream-filter pred (stream-cdr stream))))
	(else (stream-filter pred (stream-cdr stream)))))
;Value: stream-filter

(define (even? x)
  (= (remainder x 2) 0))
;Value: even?

(define sum 0)
;Value: sum

sum
;Value: 0

(define (accum x)
  (set! sum (+ x sum))
  sum)
;Value: accum

sum
;Value: 0

(define seq (stream-map accum (stream-enumerate-interval 1 20)))
;Value: seq

sum
;Value: 210

(define y (stream-filter even? seq))
;Value: y

sum
;Value: 210

(define z (stream-filter (lambda (x) (= (remainder x 5) 0))
			 seq))
;Value: z

sum
;Value: 210

(stream-ref y 7)
;Value: 90

(display-stream z)

210
200
195
165
155
105
90
20
;Value: done



(define (delay exp)
  (lambda () exp))
;Value: delay

(define sum 0)
;Value: sum

sum
;Value: 0

(define seq (stream-map accum (stream-enumerate-interval 1 20)))
;Value: seq

sum
;Value: 210

(define y (stream-filter even? seq))
;Value: y

sum
;Value: 210

(define z (stream-filter (lambda (x) (= (remainder x 5) 0))
			 seq))
;Value: z

sum
;Value: 210

(stream-ref y 7)
;Value: 90

(display-stream z)

210
200
195
165
155
105
90
20
;Value: done

