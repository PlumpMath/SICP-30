;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_3.19.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Sept 22nd, 2013
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

(define (contain-cycle? L)
  (define (racing-test tortoise-pos hare-pos)
    (let ((new-tortoise-pos (forward 1 tortoise-pos))
	  (new-hare-pos (forward 2 hare-pos)))
      (cond ((or (null? new-tortoise-pos) (null? new-hare-pos))
	     #f)
	    ((eq? new-tortoise-pos new-hare-pos)
	     #t)
	    (else
	     (racing-test new-tortoise-pos new-hare-pos)))))
  (racing-test L L))

(define (forward step items)
  (cond ((null? items)
	 '())
	((= step 0)
	 items)
	(else
	 (forward (- step 1) (cdr items)))))
