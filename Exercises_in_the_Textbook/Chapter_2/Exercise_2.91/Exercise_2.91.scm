;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_2.91.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Aug 2nd, 2013
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

(define (div-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (let ((dt (div-terms (term-list p1)
			   (term-list p2))))
	(let ((quotient-terms (car dt))
	      (remainder-terms (cadr dt)))
	  (list (make-poly (variable p1) quotient-terms)
		(make-poly (variable p2) remainder-terms))))
      (error "Polys not in the same var -- DIV-POLY"
	     (list p1 p2))))

(define (div-terms L1 L2)
  (if (empty-termlist? L1)
      (list (the-empty-termlist) (the-empty-termlist))
      (let ((t1 (first-term L1))
	    (t2 (first-term L2)))
	(if (> (order t2) (order t1))
	    (list (the-empty-termlist) L1)
	    (let ((new-c (div (coeff t1) (coeff t2)))
		  (new-o (- (order t1) (order t2))))
	      (let (rest-of-result    ;; compute rest of result recursively
		    (div-terms (sub-poly L1
					 (mul-term-by-all-terms (make-term new-o new-c)
								L2))
			       L2))
		(list (adjoin-term (make-term new-o new-c)    ;; form complete result
				   (car rest-of-result))
		      (cadr rest-of-result))))))))