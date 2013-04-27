;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       (Put the name of the program here.)
;;                       by Lawrence R. Amlord(颜世敏)
;;                       informlarry@gmail.com
;;                       (Put the date here.)
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
  (cond ((= b 0) 0)
        ((even? b) (fast-mult (double a) (halve b)))
        (else (+ a (fast-mult a (- b 1))))))

(define double
    (lambda (x) (* x 2)))

(define halve
    (lambda (x) (/ x 2)))

;; Tests of Procedures
(fast-mult 0 2)
(newline)

(fast-mult 5 0)
(newline)

(fast-mult 3 16)
(newline)

(fast-mult 2 99)
(newline)

(fast-mult 25 25)
(newline)

(fast-mult 64 64)
(newline)




