;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_2.37.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Jun 3rd, 2013
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

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (i)
	 (dot-product v i))
       m))

(define (transpose m)
  (accumulate-n (lambda (x y) (cons x y))
		'()
		m))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (v)
	   (matrix-*-vector cols v))
	 m)))