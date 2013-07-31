;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_2.85.scm
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; The Implementation of DROP Procedure
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (drop x)
  (if (not (reducible? x))
      x
      (drop (project x))))

(define (reducible? n)
  (equ? (raise (project n))
	n))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Install the Generic PROJECT Procedure
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; inside the complex package

(define (project z)
  (make-real (real-part z)))

(put 'project '(complex)
     (lambda (z) (tag (project z))))



;; inside the real package

(define (project x)
  (let ((rat (rationalize (inexact->exact x) 1/100)))
    (make-rat (numerator rat)
	      (denominator rat))))

(put 'project '(real)
     (lambda (x) (tag (project x))))



;; inside the rational package

(define (project x)
  (make-scheme-number (round (/ (numer x) (denom x)))))

(put 'project '(rational)
     (lambda (x) (tag (project x))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Rewrite APPLY-GENERIC with DROP Installing
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (apply-generic op . args)
  (define (raise-up arg1 arg2)
    (let ((t1 (type-tag arg1))
	  (t2 (type-tag arg2)))
      (cond ((eq? t1 t2) arg1)
	    ((get op t2)
	     (raise-up (raise arg1) arg2))
	    (else false))))
  (let ((type-tag (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
	  (apply proc (map contents args))
	  (if (= (length args) 2)
	      (let ((a1 (car args))
		    (a2 (cadr args)))
		(let ((a1->a2 (raise-up a1 a2))
		      (a2->a1 (raise-up a2 a1)))
		  (cond (a1->a2
			 (drop (apply-generic op (raise-up a1 a2) a2)))
			(t2->t1
			 (drop (apply-generic op a1 (raise-up a2 a1))))
			(else
			 (error "No method for these types"
				(list op type-tags))))))
	      (error "No method for these types"
		     (list op type-tags)))))))
