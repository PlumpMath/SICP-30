;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       2.2.2_Hierarchical_Structure.scm
;;                       originated from SICP
;;                       edited by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Nov 13th, 2013
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

(define x (cons (list 1 2) (list 3 4)))
;Value: x

(length x)
;Value: 3

(define (count-leaves x)
  (cond ((null? x) 0)
	((not (pair? x)) 1)
	(else
	 (+ (count-leaves (car x))
	    (count-leaves (cdr x))))))
;Value: count-leaves

(count-leaves x)
;Value: 4

(list x x)
;Value 13: (((1 2) 3 4) ((1 2) 3 4))

(length (list x x))
;Value: 2

(count-leaves (list x x))
;Value: 8



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;     Mapping over tree
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (scale-tree tree factor)
  (cond ((null? tree) '())
	((not (pair? tree)) (* tree factor))
	(else
	 (cons (scale-tree (car tree) factor)
	       (scale-tree (cdr tree) factor)))))
;Value: scale-tree

(scale-tree (list 1 (list 2 (list 3 4) 5) (list 6 7))
	    10)
;Value 14: (10 (20 (30 40) 50) (60 70))

(define (scale-tree tree factor)
  (map (lambda (sub-tree)
	 (if (pair? sub-tree)
	     (scale-tree sub-tree factor)
	     (* sub-tree factor)))
       tree))
;Value: scale-tree

(scale-tree (list 1 (list 2 (list 3 4) 5) (list 6 7))
	    10)
;Value 15: (10 (20 (30 40) 50) (60 70))

