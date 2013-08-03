;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_2.92.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Aug 3rd, 2013
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

;; inside the polynomial package

(define (add-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (make-poly (variable p1)
		 (add-terms (term-list p1)
			    (term-list p2)))
      (let ((v1 (variable p1)))
	(if (var-in-termlist? v1 (term-list p2))
	    (add-poly p1
		      (rearrange-poly (expand-poly p2) v1))
	    (error "Polys not contain same var -- ADD-POLY"
		   (list p1 p2))))))

(define (mul-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (make-poly (variable p1)
		 (mul-terms (term-list p1)
			    (term-list p2)))
      (let ((v1 (variable p1)))
	(if (var-in-termlist? v1 (term-list p2))
	    (mul-poly p1
		      (rearrange-poly (expand-poly p2) v1))
	    (error "Polys not contain same var -- ADD-POLY"
		   (list p1 p2))))))
(define (mul-terms L1 L2)
  (if (empty-termlist? L1)
      (the-empty-termlist)
      (add-terms (mul-term-by-all-terms (first-term L1) L2)
		 (mul-terms (rest-terms L1) L2))))
(define (mul-term-by-all-terms t1 L)
  (if (empty-termlist? L)
      (the-empty-termlist)
      (let ((t2 (first-term L)))
	(adjoin-term
	 (make-term (+ (order t1) (order t2))
		    (mul (coeff t1) (coeff t2)))
	 (mul-term-by-all-terms t1 (rest-terms L))))))

(define (var-in-termlist? v L)
  (cond ((empty-termlist? L) false)
	((contain-in-term? v (first-term L)) true)
	(else
	 (var-in-termlist? v (rest-terms L)))))

(define (contain-in-term? v t)
  (let ((o (order t1))
	(c (coeff t1)))
    (if (= o 0)
	(if (element-of-set? var (variable c))
	    true
	    false)
	(if (same-variable? var (variable c))
	    true
	    (var-in-termlist? v (term-list c))))))

(define (expand-poly p)
  (define (expand-terms L)
    (cond ((empty-termlist? L) (the-empty-termlist))
	  ((= (order (first-term L)) 0)
	   (first-term L))
	  (else
	   (append (term->termlist (first-term L))
		   (expand-terms (rest-terms L))))))
  (make-poly (variable p)
	     (expand-terms (term-list p))))

(define (term->termlist t)
  (let ((o (order t))
	(p (coeff t)))
    (let ((L (term-list p)))
      (let ((t1 (first-term L)))
	(let ((o1 (order t1))
	      (c1 (coeff t1)))
	  (adjoin-term (make-term o
				  (make-term o1 c1))
		       (term->termlist (make-term o
						  (rest-terms L)))))))))

(define (rearrange-poly p hpv)
  (if (same-variable? (variable p) hpv)
      p
      (make-poly hpv
		 (rearrange-termlist (term-list p) (variable p)))))

(define (rearrange-termlist L var)
  (let ((t1 (first-term L)))
    (let ((o1 (order t1))
	  (c1 (coeff t1)))
      (let ((cp c1))
	(let ((cv (variable cp))
	      (cL (term-list cp)))
	  (let ((ct1 (first-term cL)))
	    (let ((co1 (order ct1))
		  (cc1 (coeff ct1)))
	      (if (same-variable? cv hpv)
		  (adjoin-term (make-term co1
					  (make-poly var
						     (make-term o1 c1)))
			       (rearrange-termlist (rest-terms L) var))
		  (adjoin-term (make-term co1
					  (make-poly var
						     (make-term o1 c1)))
			       (rearrange-termlist (rest-terms L) var))))))))))

