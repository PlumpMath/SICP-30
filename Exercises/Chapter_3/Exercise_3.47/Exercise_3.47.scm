;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_3.47.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Nov 7th, 2013
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Implementing the semaphore through mutexes
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-semaphore n)
  (let ((mutex (make-mutex)))
    (define (the-semaphore m)
      (cond ((eq? m 'acquire)
	     (cond ((> n 0)
		    (mutex 'acquire)
		    (set! n (- n 1))
		    (mutex 'release))
		   (else
		    (the-semaphore 'acquire))))  ; retry
	    ((eq? m 'release)
	     (mutex 'acquire)
	     (set! n (+ n 1))
	     (mutex 'release))
	    (else
	     (error "Unknown request -- MAKE-SEMAPHORE" m))))
    the-semaphore))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Implementing the semaphore through atomic
;;   test-and-set! operations
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-semaphore n)
  (let ((cell (list n)))
    (define (the-semaphore m)
      (cond ((eq? m 'acquire)
	     (if (test-and-set! cell)
		 (the-semaphore 'acquire)))  ; retry
	    ((eq? m 'release)
	     (clear! cell))
	    (else
	     (error "Unknown request -- MAKE-SEMAPHORE" m))))
    the-semaphore))

(define (clear! cell)
  (set-car! cell (+ (car cell) 1)))

(define (test-and-set! cell)
  (if (= (car cell) 0)
      true
      (begin (set-car! cell (- (car cell) 1))
	     false)))

