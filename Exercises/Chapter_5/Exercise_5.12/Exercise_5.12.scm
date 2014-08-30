;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_5.12.scm
;;                       by Lawrence X. A. Yan (颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Aug 28th, 2014
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

;; Warning: This implementation still contains bug and need to be refined. 

(define (make-new-machine)
  (let ((pc (make-register 'pc))
        (flag (make-register 'flag))
        (stack (make-stack))
        (the-instruction-sequence '()))
    (let ((the-ops
           (list (list 'initialize-stack
                       (lambda () (stack 'initialize)))))
          (register-table
           (list (list 'pc pc) (list 'flag flag)))
	  (the-insts (list
		      (list 'assign '())
		      (list 'test '())
		      (list 'branch '())
		      (list 'goto '())
		      (list 'save '())
		      (list 'restore '())
		      (list 'perform '())))
	  (entry-points '())
	  (stack-regs '())
	  (assign-srcs '()))
      (let ((data-paths-table
	     (list '*data-path-table* 
		   (list '*instruction-set* the-insts)
		   (list '*entry-points* entry-points)
		   (list '*stack-registers* stack-regs)
		   (list '*assign-sources* assign-src))))
	(define (allocate-register name)
	  (if (assoc name register-table)
	      (error "Multiply defined register: " name)
	      (set! register-table
		    (cons (list name (make-register name))
			  register-table)))
	  'register-allocated)
	(define (lookup-register name)
	  (let ((val (assoc name register-table)))
	    (if val
		(cadr val)
		(error "Unknown register:" name))))
	(define (adjoin-instruction inst)
	  (let ((inst-type (instruction-type inst)))
	    (let ((fellow-inst-set
		   (cdr (assoc inst-type the-insts))))
	      (adjoin-set inst fellow-inst-set))))
	(define (adjoin-entry-point inst)
	  (let ((ent-point (entry-point inst)))
	    (adjoin-set ent-point entry-points)))
	(define (adjoin-stack-register inst)
	  (let ((stack-reg (stack-register inst)))
	    (adjoin-set stack-reg stack-regs)))
	(define (adjoin-assign-source inst)
	  (let ((assign-src (assign-source inst)))
	    (adjoin-set assign-src assign-srcs)))
	(define (adjoin-set e set)
	  (if (not (element-of-set? e set))
	      (cons e set)))
	(define (execute)
	  (let ((insts (get-contents pc)))
	    (if (null? insts)
		'done
		(begin
		  ((instruction-execution-proc (car insts)))
		  (execute)))))
	(define (dispatch message)
	  (cond ((eq? message 'start)
		 (set-contents! pc the-instruction-sequence)
		 (execute))
		((eq? message 'install-instruction-sequence)
		 (lambda (seq) (set! the-instruction-sequence seq)))
		((eq? message 'allocate-register) allocate-register)
		((eq? message 'get-register) lookup-register)
		((eq? message 'install-operations)
		 (lambda (ops) (set! the-ops (append the-ops ops))))
		((eq? message 'stack) stack)
		((eq? message 'operations) the-ops)
		((eq? message 'adjoin-instruction) adjoin-instruction)
		((eq? message 'adjoin-entry-point) adjoin-entry-point)
		((eq? message 'adjoin-stack-register) adjoin-stack-register)
		((eq? message 'adjoin-assign-source) adjoin-assign-source)
		((eq? message 'get-data-paths) data-paths-table)
		(else (error "Unknown request -- MACHINE" message))))
	dispatch))))

(define (element-of-set? e set)
  (cond ((null? set) false)
	((eq? e (car set)) true)
	(else (element-of-set? e (cdr set)))))

(define (entry-point instruction)
  (cadr instruction))

(define (stack-register instruction)
  (cadr instruction))

(define (assign-source instruction)
  (cddr instruction))

(define (assemble controller-text machine)
  (extract-labels controller-text
    (lambda (insts labels)
      (update-insts! insts labels machine)
      (generate-data-paths! insts machine)
      insts)))

(define (generate-data-paths! insts machine)
  (for-each
   (lambda (inst)
     (extend-data-paths! inst machine))
   insts))

(define (extend-data-paths! inst machine)
  (begin
    (adjoin-instruction inst machine)
    (cond ((eq? (car inst) 'goto)
	   (adjoin-entry-point inst machine))
	  ((or (eq? (car inst) 'save)
	       (eq? (car inst) 'restore))
	   (adjoin-stack-register inst machine))
	  ((eq? (car inst) 'assign)
	   (adjoin-assign-source inst machine)))))

(define (adjoin-instruction inst machine)
  (lambda ()
    ((machine 'adjoin-instruction) inst)))

(define (adjoin-entry-point inst machine)
  (lambda ()
    ((machine 'adjoin-entry-point) inst)))

(define (adjoin-stack-register inst machine)
  (lambda ()
    ((machine 'adjoin-stack-register) inst)))

(define (adjoin-assign-source inst machine)
  (lambda ()
    ((machine 'adjoin-assign-source) inst)))

(define (get-data-paths machine)
  (lambda ()
    (machine 'get-data-paths)))

(load "/Users/Lawrence/Campus/Engineering/EECS/SICP/Exercises/Chapter_5/Exercise_5.12/ch5-regsim-var-ex_5.12.scm")

;Loading "Campus/Engineering/EECS/SICP/Exercises/Chapter_5/Exercise_5.12/ch5-regsim-var-ex_5.12.scm"... done
;Value 16: (register simulator loaded)

(define fib-machine
  (make-machine
   '(n val continue)
   (list (list '< <)
	 (list '- -)
	 (list '+ +))
   '(  (assign continue (label fib-done))
     fib-loop
       (test (op <) (reg n) (const 2))
       (branch (label immediate-answer))
       ;; set up to compute Fib(n-1)
       (save continue)
       (assign continue (label after-fib-n-1))
       (save n)                            ; save old value of n
       (assign n (op -) (reg n) (const 1)) ; clobber n to n-1
       (goto (label fib-loop))             ; perform recursive call
     afterfib-n-1                          ; upon return, val contains Fib(n-1)
       (restore n)
       ;; set up to compute Fib(n-2)
       (assign n (op -) (reg n) (const 2))
       (assign continue (label after-fib-n-2))
       (save val)                          ; save Fib(n-1)
       (goto (label fib-loop))
     afterfib-n-2                          ; upon return, val contains Fib(n-2)
       (assign n (reg val))                ; n now contains Fib(n-2)
       (restore val)                       ; val now contains Fib(n-1)
       (restore continue)
       (assign val                         ; Fib(n-1) + Fib(n-2)
	       (op +) (reg val) (reg n))
       (goto (reg continue))               ; return to caller, answer is in val
     immediate-answer
       (assign val (reg n))                ; base case: Fib(n) = n
       (goto (reg continue))
     fib-done)))
