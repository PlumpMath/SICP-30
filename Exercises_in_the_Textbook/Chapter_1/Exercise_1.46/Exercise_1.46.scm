;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_1.46.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       May 17th, 2013
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

(define (iterative-improve close-enough? improve)
  (lambda (x)
    (define (try guess)
      (let ((next (improve guess)))
	(if (close-enough? guess next)
	    next
	    (try next))))
    (try x)))

(define (close-enough? v1 v2)
  (let ((tolerance 0.00001))
    (< (abs (- v1 v2)) tolerance)))

(define (sqrt x)
  ((iterative-improve close-enough?
		      (average-damp (lambda (y) (/ x y))))
   1.0))

(define average-damp
  (lambda (f)
    (lambda (x)
      (average x (f x)))))

(define (average x y)
  (/ (+ x y) 2))

(define (fixed-point f first-guess)
  ((iterative-improve close-enough? f)
   first-guess))

