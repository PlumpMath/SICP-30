;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_4.7.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Jan 17th, 2014
;;                       Fuzhou, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜世敏, aka 颜序)
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

(define (let*? exp) (tagged-list? exp 'let*))

(define (list-of-associations exp) (cadr exp))

(define (let*-body exp) (cddr exp))

(define (make-let assocs body)
  (list 'let assocs body))

(define (make-let* assocs body)
  (list 'let* assocs body))

(define (let*->nested-lets exp)
  (let ((assocs (list-of-associations exp))
	(body (let*-body exp)))
    (if (null? assocs)
	'false
	(let ((first-assoc (car assocs))
	      (rest-assocs (cdr assocs)))
	  (if (null? rest-assocs)
	      (make-let (list first-assoc) body)
	      (make-let (list first-assoc)
			(let*->nested-lets (make-let* rest-assocs body))))))))
