;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_4.50.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Mar 17th, 2014
;;                       Xi'an, China

;; Copyright (C) 2014 Lawrence X. Amlord(颜世敏, aka 颜序)
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

(define (ramb? exp) (tagged-list? exp 'ramb))
(define (ramb-choices exp) (cdr exp))

((ramb? exp) (analyze-ramb exp))

(define (analyze-ramb exp)
  (let ((cprocs (map analyze (ramb-choices exp))))
    (define (eliminate item exps)
      (cond ((null? exps) '())
	    ((equal? (car exps) item)
	     (cdr exps))
	    (else
	     (cons (car exps) (eliminate item (cdr exps))))))
    (define (list-ref items n)
      (cond ((null? items) '())
	    ((= n 0) (car items))
	    (else (list-ref (cdr items) (- n 1)))))
    (define (length items)
      (if (null? items)
	  0
	  (+ (length (cdr items)) 1)))
    (lambda (env succeed fail)
      (define (try-random choices)
	(if (null? choices)
	    (fail)
	    (let ((random-choice
		   (list-ref choices (random (length choices)))))
	      (random-choice env
			     succeed
			     (lambda ()
			       (try-random
				(eliminate random-choice choices)))))))
      (try-random cprocs))))
