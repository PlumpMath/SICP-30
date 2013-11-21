;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       3.5.1_Streams_Are_Delayed_Lists.scm
;;                       originated from SICP
;;                       edited by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Nov 21st, 2013
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

(define (sum-prime a b)
  (define (iter count accum)
    (cond ((> count b) accum)
	  ((prime? count) (iter (+ count 1) (+ count accum)))
	  (else (iter (+ count 1) accum))))
  (iter a 0))

(define (sum-prime a b)
  (accumulate +
	      0
	      (filter prime? (enumerate-interval a b))))

(car (cdr (filter prime?
		  (enumerate-interval 10000 1000000))))

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))

(define (stream-map proc s)
  (if (stream-null? s)
      the-empty-stream
      (cons-stream (proc (stream-car s))
		   (stream-map proc (stream-cdr s)))))

(define (stream-for-each proc s)
  (if (stream-null? s)
      'done
      (begin (proc (stream-car s))
	     (stream-for-each proc (stream-cdr s)))))

(define (display-stream s)
  (stream-for-each display-line s))

(define (display-line x)
  (newline)
  (display x))

(define (cons-stream a b)
  (cons a (delay b)))

(define (stream-car stream) (car stream))

(define (stream-cdr stream) (force (cdr stream)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;      The stream implementation in action
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(stream-car
 (stream-cdr
  (stream-filter prime?
		 (stream-enumerate-interval 10000 1000000))))

(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream low
		   (stream-enumerate-interval (+ low 1) high))))

(cons 10000
      (delay (stream-enumerate-interval 10001 1000000)))

(define (stream-filter pred stream)
  (cond ((stream-numm? stream) the-empty-stream)
	((pred (stream-car stream))
	 (cons-stream (stream-car stream)
		      (stream-filter pred (stream-cdr stream))))
	(else (stream-filter pred (stream-cdr stream)))))

(cons 10001
      (delay (stream-enumerate-interval 10002 1000000)))

(cons-stream (stream-car stream)
	     (stream-filter pred (stream-cdr stream)))

(cons 10007
      (delay
	(stream-filter
	 prime?
	 (cons 10008
	       (delay
		 (stream-enumerate-interval 10009 1000000))))))

(cons 10009
      (delay
	(stream-filter
	 prime?
	 (cons 10010
	       (delay
		 (stream-enumerate-interval 10011 1000000))))))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;     Implementing DELAY and FORCE
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (delay exp)
  (lambda () exp))

(define (force delayed-object)
  (delayed-object))

(define (memo-proc proc)
  (let ((already-run? false)
	(result false))
    (lambda ()
      (if (not already-run?)
	  (begin (set! result (proc))
		 (set! already-run? true)
		 result)
	  result))))

(define (delay exp)
  (memo-proc (lambda () exp)))