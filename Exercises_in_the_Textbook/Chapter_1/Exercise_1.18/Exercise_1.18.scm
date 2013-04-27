;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_1.18.scm
;;                       by Lawrence R. Amlord(颜世敏)
;;                       informlarry@gmail.com
;;                       Apr 27, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏) <informlarry@gmail.com>

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

;; Definition of Procedures
(define (fast-mult a b)
  (mult-iter a b 0))

(define (mult-iter a b product)
  (cond ((= b 0) product)
        ((even? b) (mult-iter (double a) (halve b) product))
        (else (mult-iter a (- b 1) (+ product a)))))

(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

;; Tests of Procedures
(fast-mult 0 2)
(newline)

(fast-mult 9 0)
(newline)

(fast-mult 5 18)
(newline)

(fast-mult 4 125)
(newline)

(fast-mult 45 45)
(newline)

(fast-mult 80 80)
(newline)