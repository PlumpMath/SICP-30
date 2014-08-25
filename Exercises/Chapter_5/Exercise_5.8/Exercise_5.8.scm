;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_5.8.scm
;;                       by Lawrence X. A. Yan (颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Aug 25th, 2014
;;                       Fuzhou, China

;; Copyright (C) 2014 Lawrence X. A. Yan (颜世敏, aka 颜序)
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

(load "/Users/Lawrence/Campus/Engineering/EECS/SICP/allcode/ch5-regsim.scm")

;Loading "Campus/Engineering/EECS/SICP/allcode/ch5-regsim.scm"... done
;Value 13: (register simulator loaded)

(define amb-machine
  (make-machine
   '(a)
   (list '())
   '(start
       (goto (label here))
     here
       (assign a (const 3))
       (goto (label there))
     here
       (assign a (const 4))
       (goto (label there))
     there)))
;Value: amb-machine

(start amb-machine)
;Value: done

(get-register-contents amb-machine 'a)
;Value: 3

(load "/Users/Lawrence/Campus/Engineering/EECS/SICP/Exercises/Chapter_5/Exercise_5.8/ch5-regsim-aug.scm")

;Loading "Campus/Engineering/EECS/SICP/Exercises/Chapter_5/Exercise_5.8/ch5-regsim-aug.scm"... done
;Value 14: (register simulator loaded)

(define amb-machine
  (make-machine
   '(a)
   (list '())
   '(start
       (goto (label here))
     here
       (assign a (const 3))
       (goto (label there))
     here
       (assign a (const 4))
       (goto (label there))
     there)))
;Multiply defined label there
;To continue, call RESTART with an option number:
; (RESTART 1) => Return to read-eval-print level 1.

(RESTART 1)

;Abort!

