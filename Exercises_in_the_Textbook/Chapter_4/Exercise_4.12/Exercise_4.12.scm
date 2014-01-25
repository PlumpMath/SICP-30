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

(define (env-loop var env no-var-act found-act)
  (define (scan vars vals)
    (cond ((null? vars)
	   (no-var-act env))
	  ((eq? var (car vars))
	   (found-act vals))
	  (else (scan (cdr vars) (cdr vals)))))
  (if (eq? env the-empty-environment)
      (error "Unbound variable" var)
      (let ((frame (first-frame env)))
	(scan (frame-variables frame)
	      (frame-values frame)))))



(define (lookup-variable-value var env)
  (define (no-var-act env)
    (env-loop var
	      (enclosing-environment env)
	      no-var-act
	      found-act))
  (define (found-act vals)
    (car vals))
  (env-loop var env no-var-act found-act))

(define (set-variable-value! var val env)
  (define (no-var-act env)
    (env-loop var
	      (enclosing-environment env)
	      no-var-act
	      found-act))
  (define (found-act vals)
    (set-car! vals val))
  (env-loop var env no-var-act found-act))

(define (define-variable! var val env)
  (define (no-var-act env)
    (add-binding-to-frame! var val (first-frame env)))
  (define (found-act vals)
    (set-car! vals val))
  (env-loop var env no-var-act found-act))