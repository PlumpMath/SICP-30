;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_2.42.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Jun 7th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
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

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(filter
	 (lambda (positions) (safe? k positions))
	 (flatmap
	  (lambda (rest-of-queens)
	    (map (lambda (new-row)
		   (adjoin-position new-row k rest-of-queens))
		 (enumerate-interval 1 board-size)))
	  (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (make-pos col row)
  (list col row))

(define (col pos)
  (car pos))

(define (row pos)
  (car (cdr pos)))

(define (adjoin-position row col positions)
  (append positions (list (make-pos col row))))

(define empty-board '())

(define (safe? new-col positions)
  (let ((new-queen (car (filter (lambda (pos)
			     (= (col pos) new-col))
			   positions)))
	(rest-queens (filter (lambda (pos)
			       (not (= (col pos) new-col)))
			     positions)))
    (cond ((null? rest-queens) #t)
	  ((threatens? new-queen (car rest-queens)) #f)
	  (else
	   (safe? new-col (cdr positions))))))

(define (threatens? q1 q2)
  (or (= (row q1) (row q2))
      (= (abs (- (col q1) (col q2)))
	 (abs (- (row q1) (row q2))))))
