;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_2.41.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Jun 5th, 2013
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

(define (sum-s-triple n s)
  (define (sum-to-s? triple)
    (= (+ (car triple) (cadr triple) (caddr triple)) s))
  (map make-triple-sum
       (filter sum-to-s?
	       (flatmap
		(lambda (i)
		  (flatmap
		   (lambda (j)
		     (map (lambda (k) (list i j k))
			  (remove j
				  (remove i (enumerate-interval 1 n)))))
		   (remove i (enumerate-interval 1 n))))
		(enumerate-interval 1 n)))))

(define (make-triple-sum triple)
  (list (car triple) (cadr triple) (caddr triple) (+ (car triple) (cadr triple) (caddr triple))))


