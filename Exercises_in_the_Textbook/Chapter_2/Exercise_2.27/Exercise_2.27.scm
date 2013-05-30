;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_2.27.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       May 30th, 2013
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

(define (deep-reverse items)
  (cond ((null? items) '()) ; empty list
	((not (pair? items)) items) ; reach actual numbers
	(else                ; the list contains more than one sublists
	 (cons (deep-reverse (last-sublist items))
	       (deep-reverse (former-sublists items))))))

(define (last-sublist items)
  (cond ((null? items) '())
	((null? (cdr items)) (car items))
	(else
	 (last-sublist (cdr items)))))

(define (former-sublists items)
  (if (or (null? items)
	  (null? (cdr items)))
      '()
      (cons (car items)
	    (former-sublists (cdr items)))))

