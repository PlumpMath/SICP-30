;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_3.12.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Sept 21st, 2013
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

(define (append x y)
  (if (null? x)
      y
      (cons (car x)
	    (append (cdr x) y))))
;Value: append

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)
;Value: append!

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))
;Value: last-pair

(define x (list 'a 'b))
;Value: x

(define y (list 'c 'd))
;Value: y

(define z (append x y))
;Value: z

z
;Value 19: (a b c d)

(cdr x)
;Value 20: (b)

(define w (append! x y))
;Value: w

w
;Value 21: (a b c d)

(cdr x)
;Value 20: (b c d)

