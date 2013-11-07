;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_3.48.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Nov 8th, 2013
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

(define (serialized-exchange account1 account2)
  (let ((n1 (account1 'order))
	(n2 (account2 'order))
	(serializer1 (account1 'serializer))
	(serializer2 (account2 'serializer)))
    (if (< n1 n2)
	((serializer1 (serializer2 exchange))
	 account1
	 account2)
	((serializer2 (serializer1 exchange))
	 account2
	 account1))))

(define (make-account balance order)
  (define (withdraw amount)
    (if (>= balance amount)
	(set! balance (- balance amount))
	"Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (let ((balance-serializer (make-serializer)))
    (define (dispatch m)
      (cond ((eq? m 'withdraw) withdraw)
	    ((eq? m 'deposit) deposit)
	    ((eq? m 'balance) balance)
	    ((eq? m 'order) order)
	    ((eq? m 'serializer) balance-serializer)
	    (else
	     (error "Unknown request -- MAKE-ACCOUNT" m))))
    dispatch))