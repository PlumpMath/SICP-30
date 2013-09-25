;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       3.3.1_Mutable_List_Structure.scm
;;                       originated from SICP
;;                       edited by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Sept 25th, 2013
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

(define (cons x y)
  (let ((new (get-new-pair)))
    (set-car! new x)
    (set-cdr! new y)
    new))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Sharing and identity
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define x (list 'a 'b))
;Value: x

(define z1 (cons x x))
;Value: z1

(define z2 (cons (list 'a 'b) (list 'a 'b)))
;Value: z2

(eq? (car z1) (cdr z1))
;Value: #t

(eq? (car z2) (cdr z2))
;Value: #f

(define (set-to-wow! x)
  (set-car! (car x) 'wow)
  x)
;Value: set-to-wow!

z1
;Value 13: ((a b) a b)

(set-to-wow! z1)
;Value 13: ((wow b) wow b)

z2
;Value 14: ((a b) a b)

(set-to-wow! z2)
;Value 14: ((wow b) a b)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;     Mutation is just assignment
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (cons x y)
  (define (dispatch m)
    (cond ((eq? m 'car) x)
	  ((eq? m 'cdr) y)
	  (else (error "Undefined operation -- CONS" m))))
  dispatch)

(define (car z) (z 'car))

(define (cdr z) (z 'cdr))



(define (cons x y)
  (define (set-x! v) (set! x v))
  (define (set-y! v) (set! y v))
  (define (dispatch m)
    (cond ((eq? m 'car) x)
	  ((eq? m 'cdr) y)
	  ((eq? m 'set-car!) set-x!)
	  ((eq? m 'set-cdr!) set-y!)
	  (else (error "Undefined operation -- CONS" m))))
  dispatch)
;Value: cons

(define (car z) (z 'car))
;Value: car

(define (cdr z) (z 'cdr))
;Value: cdr

(define (set-car! z new-value)
  ((z 'set-car!) new-value)
  z)
;Value: set-car!

(define (set-cdr! z new-value)
  ((z 'set-cdr!) new-value)
  z)
;Value: set-cdr!

