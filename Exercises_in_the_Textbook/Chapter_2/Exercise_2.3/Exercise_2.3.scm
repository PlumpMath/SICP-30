;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_2.3.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       May 21st, 2013
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

(define A (make-point 1 1))

(define B (make-point 5 1))

(define C (make-point 5 4))

(define D (make-point 1 4))

(define m (make-segment A B))

(define l (make-segment A D))

(define n (make-segment D C))


;; procedure to measure the length of a line segment

(define (length s)
  (let ((dx (- (x-point (end-segment s))
	       (x-point (start-segment s))))
	(dy (- (y-point (end-segment s))
	       (y-point (start-segment s)))))
    (define pythagoras
      (lambda (x y)
	(sqrt (+ (square x) (square y)))))
    (pythagoras dx dy)))


;; procedures for computing the perimeter and area of a rectangle

(define (peri-rec r)
  (* (+ (width-rec r) (heigh-rec r))
     2)) 

(define (area-rec r)
  (* (width-rec r) (heigh-rec r)))


;; represent a rectangle by two adjcent line segments

(define (make-rec m l) (cons m l))

(define (m-rec r) (car r))

(define (l-rec r) (cdr r))

(define r (make-rec m l))

(define (width-rec r)
  (length (m-rec r)))

(define (heigh-rec r)
  (length (l-rec r)))


;; represent a rectangle by two parallel line segment

(define (make-rec m n) (cons m n))

(define (m-rec r) (car r))

(define (n-rec r) (cdr r))

(define r (make-rec m n))

(define (width-rec r) (length (m-rec r)))

(define (heigh-rec r)
  (let ((h (make-segment (start-segment (m-rec r))
			 (start-segment (n-rec r)))))
    (length h)))



