;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       2.2.1_Representing_Sequences.scm
;;                       originated from SICP
;;                       edited by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Nov 11th, 2013
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

(define one-through-four (list 1 2 3 4))
;Value: one-through-four

one-through-four
;Value: one-through-four

;Value 13: (1 2 3 4)

(car one-through-four)
;Value: 1

(cdr one-through-four)
;Value 14: (2 3 4)

(car (cdr one-through-four))
;Value: 2

(cons 10 one-through-four)
;Value 15: (10 1 2 3 4)

(cons 5 one-through-four)
;Value 16: (5 1 2 3 4)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;       List operation
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))
;Value: list-ref

(define squares (list 1 4 9 16 25))
;Value: squares

(list-ref squares 3)
;Value: 16

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))
;Value: length

(define odds (list 1 3 5 7))
;Value: odds

(length odds)
;Value: 4

(define (length items)
  (define (length-iter a count)
    (if (null? a)
	count
	(length-iter (cdr a) (+ 1 count))))
  (length-iter items 0))
;Value: length

(length odds)
;Value: 4

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1)
	    (append (cdr list1) list2))))
;Value: append

(append squares odds)
;Value 17: (1 4 9 16 25 1 3 5 7)

(append odds squares)
;Value 18: (1 3 5 7 1 4 9 16 25)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;     Mapping over lists
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (scale-list items factor)
  (if (null? items)
      '()
      (cons (* (car items) factor)
	    (scale-list (cdr items) factor))))
;Value: scale-list

(scale-list (list 1 2 3 4 5) 10)
;Value 19: (10 20 30 40 50)

(map + (list 1 2 3) (list 40 50 60) (list 700 800 900))
;Value 13: (741 852 963)

(map (lambda (x y) (+ x (* 2 y)))
     (list 1 2 3)
     (list 4 5 6))
;Value 14: (9 12 15)

(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
	    (map proc (cdr items)))))
;Value: map

(map abs (list -10 2.5 -11.6 17))
;Value 20: (10 2.5 11.6 17)

(map (lambda (x) (* x x))
     (list 1 2 3 4))
;Value 21: (1 4 9 16)

(define (scale-list items factor)
  (map (lambda (x) (* x factor))
       items))
;Value: scale-list

(scale-list (list 1 2 3 4 5) 10)
;Value 15: (10 20 30 40 50)

