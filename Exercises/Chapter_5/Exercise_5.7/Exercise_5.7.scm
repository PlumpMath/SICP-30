;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_5.7.scm
;;                       by Lawrence X. A. Yan (颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Aug 24th, 2014
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

(define expt-rec-machine
  (make-machine
   '(b n val continue)
   (list (list '= =)
	 (list '- -)
	 (list '* *))
   '(  (assign continue (label expt-done))
     expt-loop
       (test (op =) (reg n) (const 0))
       (branch (label base-case))
       (save continue)
       (assign n (op -) (reg n) (const 1))
       (assign continue (label after-expt))
       (goto (label expt-loop))
     after-expt
       (restore continue)
       (assign val (op *) (reg b) (reg val))
       (goto (reg continue))
     base-case
       (assign val (const 1))
       (goto (reg continue))
     expt-done)))
;Value: expt-rec-machine

(set-register-contents! expt-rec-machine 'b 2)
;Value: done

(set-register-contents! expt-rec-machine 'n 0)
;Value: done

(start expt-rec-machine)
;Value: done

(get-register-contents expt-rec-machine 'val)
;Value: 1

(set-register-contents! expt-rec-machine 'n -1)
;Value: done

(start expt-rec-machine)

;Quit!

(set-register-contents! expt-rec-machine 'n 1)
;Value: done

(start expt-rec-machine)
;Value: done

(get-register-contents expt-rec-machine 'val)
;Value: 2

(set-register-contents! expt-rec-machine 'n 8)
;Value: done

(start expt-rec-machine)
;Value: done

(get-register-contents expt-rec-machine 'val)
;Value: 256

(define expt-iter-machine
  (make-machine
   '(b n counter product)
   (list (list '= =)
	 (list '- -)
	 (list '* *))
   '(  (assign counter (reg n))
       (assign product (const 1))
     expt-loop
       (test (op =) (reg counter) (const 0))
       (branch (label expt-done))
       (assign counter (op -) (reg counter) (const 1))
       (assign product (op *) (reg b) (reg product))
       (goto (label expt-loop))
     expt-done)))
;Value: expt-iter-machine

(set-register-contents! expt-iter-machine 'b 2)
;Value: done

(set-register-contents! expt-iter-machine 'n 0)
;Value: done

(start expt-iter-machine)
;Value: done

(get-register-contents expt-iter-machine 'product)
;Value: 1

(set-register-contents! expt-iter-machine 'n -1)
;Value: done

(start expt-iter-machine)

;Quit!

(set-register-contents! expt-iter-machine 'n 1)
;Value: done

(start expt-iter-machine)
;Value: done

(get-register-contents expt-iter-machine 'product)
;Value: 2

(set-register-contents! expt-iter-machine 'n 8)
;Value: done

(start expt-iter-machine)
;Value: done

(get-register-contents expt-iter-machine 'product)
;Value: 256

