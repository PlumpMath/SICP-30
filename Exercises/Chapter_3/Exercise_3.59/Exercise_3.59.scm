;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_3.59.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Nov 27th, 2013
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;      Subproblem a.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (integrate-series s)
  (mul-streams s
	       (div-streams ones integers)))

(define (div-streams s1 s2)
  (stream-map / s1 s2))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;      Subproblem b.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define cosine-series
  (cons-stream 1
	       (integrate-series
		(neg-stream sine-series))))

(define sine-series
  (cons-stream 0
	       (integrate-series cosine-series)))

(define (neg-stream s)
  (stream-map (lambda (x) (* -1 x))
	      s))
