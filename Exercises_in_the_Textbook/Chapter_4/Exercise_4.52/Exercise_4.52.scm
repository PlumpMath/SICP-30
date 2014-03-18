;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_4.52.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Mar 17th, 2014
;;                       Xi'an, China

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

;; add this clause in analyze
((if-fail? exp) (analyze-if-fail exp))

;; Representing the if-fail expression
(define (if-fail? exp) (tagged-list? exp 'if-fail))
(define (if-fail-consequent exp) (cadr exp))
(define (if-fail-alternative exp) (caddr exp))


(define (analyze-if-fail exp)
  (let ((cproc (analyze (if-fail-consequent exp)))
	(aproc (analyze (if-fail-alternative exp))))
    (lambda (env succeed fail)
      (cproc env
	     succeed
	     (lambda ()
	       (aproc env succeed fail))))))

