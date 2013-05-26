;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_2.11.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       May 26th, 2013
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

(define (mul-interval x y)
  (define (locates-negative? i)
    (< (upper-bound i) 0))
  (define (spans-zero? i)
    (and (<= (lower-bound i) 0)
	 (>= (upper-bound i) 0)))
  (cond ((locates-negative? x)
	 (cond ((locates-negative? y)
		(make-interval (* (upper-bound x) (upper-bound y))
			       (* (lower-bound x) (lower-bound y))))
	       ((spans-zero? y)
		(make-interval (* (lower-bound x) (upper-bound y))
			       (* (lower-bound x) (lower-bound y))))
	       (else
		(make-interval (* (lower-bound x) (upper-bound y))
			       (* (upper-bound x) (lower-bound y))))))
	((spans-zero? x)
	 (cond ((locates-negative? y)
		(make-interval (* (upper-bound x) (lower-bound y))
			       (* (lower-bound x) (lower-bound y))))
	       ((spans-zero? y)
		(let ((p1 (* (lower-bound x) (upper-bound y)))
		      (p2 (* (upper-bound x) (lower-bound y)))
		      (q1 (* (lower-bound x) (lower-bound y)))
		      (q2 (* (upper-bound x) (upper-bound y))))
		  (make-interval (min p1 p2)
				 (max q1 q2))))
	       (else
		(make-interval (* (lower-bound x) (upper-bound y))
			       (* (upper-bound x) (upper-bound y))))))
	(else
	 (cond ((locates-negative? y)
		(make-interval (* (upper-bound x) (lower-bound y))
			       (* (lower-bound x) (upper-bound y))))
	       ((spans-zero? y)
		(make-interval (* (upper-bound x) (lower-bound y))
			       (* (upper-bound x) (upper-bound y))))
	       (else
		(make-interval (* (lower-bound x) (lower-bound y))
			       (* (upper-bound x) (upper-bound y))))))))