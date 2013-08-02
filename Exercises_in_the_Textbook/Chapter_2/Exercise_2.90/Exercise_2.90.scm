;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_2.90.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Aug 1st, 2013
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   The Polynomial Package
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (install-polynomial-package)
  ;; imported procedures from dense and sparse packages
  (define (make-from-dense variable term-list)
    ((get 'make-from-dense 'dense) variable term-list))
  (define (make-from-sparse variable term-list)
    ((get 'make-from-sparse 'sparse) variable term-list))

  ;; internal procedures
  ;; representation of poly
  (define (variable? x) (symbol? x))
  (define (same-variable? v1 v2)
    (and (variable? v1) (variable? v2) (eq? v1 v2)))
  
  (define (add-poly p1 p2)
    (if (same-variable? (variable p1) (variable p1))
	(make-poly (variable p1)
		   (add-terms (term-list p1)
			      (term-list p2)))
	(error "Polys not in the same var -- ADD-POLY"
	       (list p1 p2))))
  (define (add-terms L1 L2)
    (cond ((empty-termlist? L1) L2)
	  ((empty-termlist? L2) L1)
	  (else
	   (let ((t1 (first-term L1))
		 (t2 (first-term L2)))
	     (cond ((> (order t1) (order t2))
		    (adjoin-term t1
				 (add-terms (rest-terms L1) L2)))
		   ((< (order t1) (order t2))
		    (adjoin-term t2
				 (add-terms L1 (rest-terms L2))))
		   (else
		    (adjoin-term (make-term (order t1)
					    (add (coeff t1) (coeff t2)))
				 (add-terms (rest-terms L1) (rest-terms L2)))))))))
  
  (define (sub-poly p1 p2)
    (add-poly p1 (neg-poly p2)))
  (define (neg-poly L)
    (make-poly (variable L)
	       (neg-terms (term-list L))))
  (define (neg-terms L)
    (if (empty-termlist? L)
	(the-empty-termlist)
	(let ((t1 (first-term L)))
	  (cons (make-term (order t1)
			   (neg (coeff t1)))
		(neg-terms (rest-terms L))))))
  
  (define (mul-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
	(make-poly (variable p1)
		   (mul-terms (term-list p1)
			      (term-list p2)))
	(error "Polys not in the same var -- MUL-POLY"
	       (list p1 p2))))
  (define (mul-terms L1 L2)
    (if (empty-termlist? L1)
	(the-empty-termlist)
	(add-terms (mul-term-by-all-terms (first-term L1) L2)
		   (mul-terms (rest-terms L1) L2))))
  (define (mul-term-by-all-terms t1 L)
    (if (empty-termlist? L)
	(the-empty-termlist)
	(let ((t2 (first-term L)))
	  (adjoin-term (make-term (+ (order t1) (order t2))
				  (mul (coeff t1) (coeff t2)))
		       (mul-term-by-all-terms t1 (rest-terms L))))))

  ;; interface to rest of the system
  (define (tag x) (attach-tag 'polynomial x))
  (put 'add 'polynomial
       (lambda (p1 p2) (tag (add-poly p1 p2))))
  (put 'sub 'polynomial
       (lambda (p1 p2) (tag (sub-poly p1 p2))))
  (put 'mul 'polynomial
       (lambda (p1 p2) (tag (mul-poly p1 p2))))
  (put 'neg 'polynomial
       (lambda (p) (tag (neg-poly p))))
  (put 'make-from-dense 'polynomial
       (lambda (variable term-list) (tag (make-from-dense variable term-list))))
  (put 'make-from-sparse 'polynomial
       (lambda (variable term-list) (tag (make-from-sparse variable term-list))))
  'done)

(define (make-poly variable term-list)
  ((get 'make-from-sparse 'polynomial) variable term-list))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;     The Dense Package
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define (install-dense-package)
  ;; internal procedures
  (define (first-term term-list)
    (make-term (- (length term-list) 1)
	       (car term-list)))
  (define (rest-terms term-list) (cdr term-list))
  (define (empty-termlist? term-list) (null? term-list))

  (define (adjoin-term term term-list)
    (if (=zero? (coeff term))
	term-list
	(cons (coeff term)
	      term-list)))

  (define (make-from-dense variable term-list)
    (if (empty-termlist? term-list)
	'()
	(cons variable term-list)))

  ;; interface to the rest of the system
  (define (tag x) (attach-tag 'dense x))
  (put 'first-term 'dense
       (lambda (term-list) (tag (first-term term-list))))
  (put 'rest-terms 'dense
       (lambda (term-list) (tag (rest-terms term-list))))
  (put 'empty-termlist? 'dense
       (lambda (term-list) (tag (empty-termlist? term-list))))
  (put 'adjoin-term '(term dense)
       (lambda (term term-list) (tag (adjoin-term term term-list))))
  (put 'make-from-dense '(scheme-symbol dense)
       (lambda (variable term-list) (tag (make-from-dense variable term-list))))
  'done)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;     The Sparse Package
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define (install-sparse-package)
  ;; internal procedures
  (define (first-term term-list) (car term-list))
  (define (rest-terms term-list) (cdr term-list))
  (define (empty-termlist? term-list) (null? term-list))

  (define (adjoin-term term term-list)
    (if (=zero? (coeff term))
	term-list
	(cons term term-list)))
  
  (define (make-from-sparse variable term-list)
    (if (empty-termlist? term-list)
	'()
	(cons variable term-list)))
  
  ;; interface to the rest of the system
  (define (tag x) (attach-tag 'sparse x))
  (put 'first-term 'sparse
       (lambda (term-list) (tag (first-term term-list))))
  (put 'rest-terms 'sparse
       (lambda (term-list) (tag (rest-terms term-list))))
  (put 'empty-term-list? 'sparse
       (lambda (term-list) (tag (empty-termlist? term-list))))
  (put 'adjoin-term '(term sparse)
       (lambda (term term-list) (tag (adjoin-term term term-list))))
  (put 'make-from-sparse '(scheme-symbol sparse)
       (lambda (variable term-list) (tag variable term-list)))
  'done)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;     The Term Package
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (install-term-package)
  ;; internal procedures
  (define (make-term order coeff)
    (list order coeff))
  (define (order term) (car term))
  (define (coeff term) (cadr term))
  
  ;; interface to the rest of the system
  (define (tag x) (attach-tag 'term x))
  (put 'make-term 'term
       (lambda (order coeff) (tag (make-term order coeff))))
  (put 'order 'term
       (lambda (term) (tag (order term))))
  (put 'coeff 'term
       (lambda (term) (tag (coeff term))))
  'done)