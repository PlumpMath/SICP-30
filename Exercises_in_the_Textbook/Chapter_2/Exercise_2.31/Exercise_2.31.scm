;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_2.31.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       May 31st, 2013
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

(define (tree-map proc tree)
  (map (lambda (sub-tree)
	 (if (not (pair? sub-tree))
	     (proc sub-tree)
	     (tree-map proc sub-tree)))
       tree))

