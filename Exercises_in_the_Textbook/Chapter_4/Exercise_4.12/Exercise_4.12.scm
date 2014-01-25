;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_4.12.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Jan 25th, 2013
;;                       Fuzhou, China

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

(define (traverse-env var env request)
  (if (eq? env the-empty-environment)
      '()
      (traverse-frame (first-frame env) request)))

(define (traverse-frame frame request)
  (let ((vars (car frame))
	(vals (cdr frame)))
    (cond ((null? vars)
	   (cond ((eq? request 'lookup)
		  (traverse-env var env 'lookup))
		 ((eq? request 'set!)
		  (traverse-env var env 'set!))
		 ((eq? request 'define!)
		  '())
		 (else
		  (error "Unknown request -- TRAVERSE-FRAME" request))))
	  ((eq? var (car vars))
	   (car vals))
	  (else
	   (traverse-frame (cons (cdr vars) (cdr vals)) request)))))

(define (lookup-variable-value var env)
  (let ((val (traverse-env var env 'lookup)))
    (if (null? val)
	(error "Unbound variable" var)
	val)))

(define (set-variable-value! var new-val env)
  (let ((val (traverse-env var env 'set!)))
    (if (null? val)
	(error "Unbound variable -- SET!" var)
	(set! val new-val))))

(define (define-variable! var new-val env)
  (let ((val (traverse-env var env 'define!)))
    (if (null? val)
	(add-binding-to-frame! var new-val (first-frame env))
	(set! val new-val))))