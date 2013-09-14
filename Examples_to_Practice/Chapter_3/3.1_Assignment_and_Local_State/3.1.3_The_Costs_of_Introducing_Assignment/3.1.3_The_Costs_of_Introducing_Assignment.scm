;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       3.1.3_The_Costs_of_Introducing_Assignment.scm
;;                       originated from SICP
;;                       edited by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Sept 14th, 2013
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

(define (make-simplified-withdraw balance)
  (lambda (amount)
    (set! balance (- balance amount))
    balance))
;Value: make-simplified-withdraw

(define W (make-simplified-withdraw 25))
;Value: w

(W 20)
;Value: 5

(W 10)
;Value: -5

(define (make-decrementer balance)
  (lambda (amount)
    (- balance amount)))
;Value: make-decrementer

(define D (make-decrementer 25))
;Value: d

(D 20)
;Value: 5

(D 10)
;Value: 15

(define D1 (make-decrementer 25))
;Value: d1

(define D2 (make-decrementer 25))
;Value: d2

(D1 20)
;Value: 5

(D2 20)
;Value: 5

(define W1 (make-simplified-withdraw 25))
;Value: w1

(define W2 (make-simplified-withdraw 25))
;Value: w2

(W1 20)
;Value: 5

(W1 20)
;Value: -15

(W2 20)
;Value: 5

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

(define peter-acc (make-account 100))
;Value: peter-acc

(define paul-acc (make-account 100))
;Value: paul-acc

((peter-acc 'deposit) 20)
;Value: 120

((paul-acc 'withdraw) 20)
;Value: 80

(define peter-acc (make-account 100))
;Value: peter-acc

(define paul-acc peter-acc)
;Value: paul-acc

((peter-acc 'deposit) 80)
;Value: 180

((paul-acc 'deposit) 80)
;Value: 260

((peter-acc 'withdraw) 160)
;Value: 100

((paul-acc 'withdraw) 10)
;Value: 90



(define (factorial n)
  (define (iter product counter)
    (if (> counter n)
	product
	(iter (* product counter)
	      (+ counter 1))))
  (iter 1 1))
;Value: factorial

(factorial 6)
;Value: 720

(define (factorial n)
  (let ((product 1)
	(counter 1))
    (define (iter)
      (if (> counter n)
	  product
	  (begin (set! product (* counter product))
		 (set! counter (+ counter 1))
		 (iter))))
    (iter)))
;Value: factorial

(factorial 6)
;Value: 720

(define (factorial n)
  (let ((product 1)
	(counter 1))
    (define (iter)
      (if (> counter n)
	  product
	  (begin (set! counter (+ counter 1))
		 (set! product (* counter product))
		 (iter))))
    (iter)))
;Value: factorial

(factorial 6)
;Value: 5040

