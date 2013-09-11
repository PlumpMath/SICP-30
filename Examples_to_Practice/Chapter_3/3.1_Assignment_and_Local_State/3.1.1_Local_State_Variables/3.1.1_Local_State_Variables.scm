;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       3.1.1_Local_State_Variables.scm
;;                       originated from SICP
;;                       edited by Lawrence R. Amlord(颜世敏)
;;                       informlarry@gmail.com
;;                       Sept 11th, 2013
;;                       Xi'an, China

;; Copyright (C) 1984-2013 Harold Abelson and Gerald Jay Sussman
;; with Julie Sussman

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

(define balance 100)
;Value: balance

(define (withdraw amount)
  (if (>= balance amount)
      (begin (set! balance (- balance amount))
	     balance)
      "Insufficient funds"))
;Value: withdraw

(withdraw 25)
;Value: 75

(withdraw 25)
;Value: 50

(withdraw 60)
;Value 13: "Insufficient funds"

(withdraw 15)
;Value: 35



(define new-withdraw
  (let ((balance 100))
    (lambda (amount)
      (if (>= balance amount)
	  (begin (set! balance (- balance amount))
		 balance)
	  "Insufficient funds"))))
;Value: new-withdraw

(new-withdraw 25)
;Value: 75

(new-withdraw 25)
;Value: 50

(new-withdraw 60)
;Value 14: "Insufficient funds"

(new-withdraw 15)
;Value: 35



(define (make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"Insufficient funds")))
;Value: make-withdraw

(define W1 (make-withdraw 100))
;Value: w1

(define W2 (make-withdraw 100))
;Value: w2

(W1 50)
;Value: 50

(W2 70)
;Value: 30

(W2 40)
;Value 15: "Insufficient funds"

(W1 40)
;Value: 10



(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
	  ((eq? m 'deposit) deposit)
	  (else
	   (error "Uknown request -- MAKE-ACCOUNT"
		  m))))
  dispatch)
;Value: make-account

(define acc (make-account 100))
;Value: acc

((acc 'withdraw) 50)
;Value: 50

((acc 'withdraw) 60)
;Value 16: "Insufficient funds"

((acc 'deposit) 40)
;Value: 90

((acc 'withdraw) 60)
;Value: 30

(define acc2 (make-account 100))
;Value: acc2

((acc2 'withdraw) 10)
;Value: 90

((acc2 'deposit) 90)
;Value: 180

((acc2 'deposit) 50)
;Value: 230

((acc2 'withdraw) 20)
;Value: 210

