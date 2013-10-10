;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_3.30.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Oct 10th, 2013
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

(define (ripple-carry-adder Ak Bk Sk C)
  (if (and (null? Ak) (null? Bk) (null? Sk))
      'ok
      (let ((A1 (car Ak))
	    (B1 (car Bk))
	    (S1 (car Sk))
	    (C1 (make-wire))
	    (remain-Ak (cdr Ak))
	    (remain-Bk (cdr Bk))
	    (remain-Sk (cdr Sk)))
	(set-signal! C1 (get-signal C))
	(full-adder A1 B1 C1 S1 C)
	(ripple-carry-adder remain-Ak remain-Bk remain-Sk C))))