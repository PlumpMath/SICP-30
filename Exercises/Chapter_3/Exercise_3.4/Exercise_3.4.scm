;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_3.4.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Sept 12th, 2013
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

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (prohibit-operation amount)
    "Incorrect password")
  (define security-guard
    (make-monitored prohibit-operation))
  (define (call-the-cops amount)
    "The account you're trying to access has been locked!")
  (define (dispatch trial m)
    (let ((failure-times (security-guard 'how-many-calls?)))
      (if (>= failure-times 7)
	  call-the-cops
	  (if (eq? trial password)
	      (begin (security-guard 'reset-count)
		     (cond ((eq? m 'withdraw) withdraw)
			   ((eq? m 'deposit) deposit)
			   (else
			    (error "Uknown request -- MAKE-ACCOUNT"
				   m))))
	      security-guard))))
  dispatch)

(define (make-monitored f)
  (define mf
    (let ((counter 0))
      (lambda (m)
	(cond ((eq? m 'how-many-calls?)
	       counter)
	      ((eq? m 'reset-count)
	       (begin (set! counter 0)
		      counter))
	      (else
	       (begin (set! counter (+ counter 1))
		      (f m)))))))
  mf)