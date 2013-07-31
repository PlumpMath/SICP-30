;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_2.83.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Jul 31st, 2013
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

;; inside the integer package

(define (integer->rational n)
  (make-rat (contents n) 1))

(put 'raise '(integer)
     (lambda (n) (tag (integer->rational n))))



;; inside the rational package

(define (rational->real x)
  (make-real (/ (numer (contents x))
		(denom (contents x)))))

(put 'raise '(rational)
     (lambda (x) (tag (rational->real x))))



;; inside the real package

(define (real->complex x)
  (make-from-real-imag (contents x) 0))

(put 'raise '(real)
     (lambda (x) (tag (real->complex x))))



;; the generic raise operation

(define (raise . x)
  (apply-generic 'raise . x))
