;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_1.45.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       May 17th, 2013
;;                       Xi'an, China

;; Copyright (C) 2012-2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
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

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (fixed-point f first-guess)
  (define tolerance 0.000001)
  (define close-enough?
    (lambda (x y)
      (< (abs(- x y)) tolerance)))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average-damp f)
  (define (average x y)
    (/ (+ x y) 2.0))
  (lambda (x)
    (average x (f x))))

(define (repeated f n)
  (define (compose f g)
    (lambda (x)
      (f (g x))))
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (floor-log-2 n)
  (floor (/ (log n) (log 2))))

(define (nth-root x n)
  (let ((damp-times (floor-log-2 n)))
    (fixed-point-of-transform (lambda (y) (/ x (expt y (- n 1))))
			      (repeated average-damp damp-times)
			      1.0)))