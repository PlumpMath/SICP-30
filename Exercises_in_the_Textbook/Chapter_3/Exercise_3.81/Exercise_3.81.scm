;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_3.81.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Dec 7th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜世敏, aka 颜序)
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

;; DECLARATION: This implementation requires that element in the input stream of
;; request should either be a 'generate or a list '(reset <new-value>). A parti-
;; cular example of legitimate input may be:
;; 
;;      ('generate 'generate '(reset 64) 'generate 'generate 'generate ...)
;;
;;

(define (random-number-generator request-stream)
  (define (dispatch m)
    (cond ((and (pair? m)
		(eq? (car m) 'reset))
	   (lambda (x)
	     (cadr m)))
	  ((eq? m 'generate)
	   rand-update)
	  (else "Unknown request -- RANDOM-NUMBER-GENERATOR" m)))
  (define (corresponding-apply procedure-stream operand-stream)
    (if (or (stream-null? procedure-stream)
	    (stream-null? operand-stream))
	the-empty-stream
	(cons-stream ((stream-car procedure-stream) (stream-car operand-stream))
		     (corresponding-apply (stream-cdr procedure-stream)
					  (stream-cdr operand-stream)))))
  (define operation-stream
    (stream-map dispatch request-stream))
  (define random-numbers
    (cons-stream random-init
		 (corresponding-apply operation-stream random-numbers)))
  random-numbers)
