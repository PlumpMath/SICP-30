;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_3.22.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Sept 26th, 2013
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

(define (make-queue)
  (let ((front-ptr '())
	(rear-ptr '()))
    ;; definition of internal procedures
    (define (set-front-ptr! item) (set! front-ptr item))
    (define (set-rear-ptr! item) (set! rear-ptr item))
    (define (empty-q?) (null? front-ptr))
    (define (front-q)
      (if (empty-q?)
	  (error "FRONT called with an empty queue" queue)
	  (car front-ptr)))
    (define insert-q!
      (lambda (item)
	(let ((new-pair (cons item '())))
	  (cond ((empty-q?)
		 (set-front-ptr! new-pair)
		 (set-rear-ptr! new-pair)
		 front-ptr)
		(else
		 (set-cdr! rear-ptr new-pair)
		 (set-rear-ptr! new-pair)
		 front-ptr)))))
    (define (delete-q!)
      (cond ((empty-q?)
	     (error "DELETE! called with an empty queue"))
	    (else
	     (set-front-ptr! (cdr front-ptr))
	     front-ptr)))
    (define (dispatch m)
      (cond ((eq? m 'empty-queue?) (empty-q?))
	    ((eq? m 'front-queue) (front-q))
	    ((eq? m 'insert-queue!) insert-q!)
	    ((eq? m 'delete-queue!) (delete-q!))
	    (else
	     (error "Undefine operation -- MAKE-QUEUE" m))))
    dispatch))

(define (empty-queue? queue) (queue 'empty-queue?))

(define (front-queue queue) (queue 'front-queue))

(define (insert-queue! queue item)
  ((queue 'insert-queue!) item))

(define (delete-queue! queue)
  (queue 'delete-queue!))
