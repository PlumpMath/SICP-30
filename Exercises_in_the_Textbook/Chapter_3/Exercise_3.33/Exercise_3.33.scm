;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_3.33.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Oct 26th, 2013
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

(define (averager a b c)
  (let ((u (make-connector))
	(v (make-connector)))
    (adder a b u)
    (multiplier c v u)
    (constant 2 v)
    'ok))
;Value: averager

(define a (make-connector))
;Value: a

(define b (make-connector))
;Value: b

(define c (make-connector))
;Value: c

(averager a b c)
;Value: ok

(probe "a" a)
;Value 23: #[compound-procedure 23 me]

(probe "b" b)
;Value 24: #[compound-procedure 24 me]

(probe "c" c)
;Value 25: #[compound-procedure 25 me]

(set-value! a 8 'user)

Probe: a = 8
;Value: done

(set-value! b 24 'user)

Probe: b = 24
Probe: c = 16
;Value: done

(set-value! c 50 'user)
;Contradiction (16 50)
;To continue, call RESTART with an option number:
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(forget-value! a 'user)

Probe: a = ?
Probe: c = ?
;Value: done

(forget-value! b 'user)

Probe: b = ?
;Value: done

(set-value! c 50 'user)

Probe: c = 50
;Value: done

(set-value! a 32 'user)

Probe: a = 32
Probe: b = 68
;Value: done

