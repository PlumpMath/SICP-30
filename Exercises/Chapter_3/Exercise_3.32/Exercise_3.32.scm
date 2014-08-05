;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_3.32.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Oct 22nd, 2013
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Implementing the list
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-list) (list '*list*))
;Value: make-list

(define (empty-list? L) (null? (front-ptr L)))
;Value: empty-list?

(define (front-ptr L) (cdr L))
;Value: front-ptr

(define (set-front-ptr! L item) (set-cdr! L item))
;Value: set-front-ptr!

(define (front-list L)
  (if (empty-list? L)
      (error "FRONT called with an empty list" L)
      (car (front-ptr L))))
;Value: front-list

(define (insert-list! L item)
  (set-front-ptr! L
		  (cons item (front-ptr L)))
  L)
;Value: insert-list!

(define (delete-list! L)
  (cond ((empty-list? L)
	 (error "DELETE! called with an empty list" L))
	(else
	 (set-front-ptr! L (cdr (front-ptr L)))
	 L)))
;Value: delete-list!



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Implementing the agenda
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-time-segment time L)
  (cons time L))
;Value: make-time-segment

(define (segment-time s) (car s))
;Value: segment-time

(define (segment-list s) (cdr s))
;Value: segment-list

(define (make-agenda) (list 0))
;Value: make-agenda

(define (current-time agenda) (car agenda))
;Value: current-time

(define (set-current-time! agenda time)
  (set-car! agenda time))
;Value: set-current-time!

(define (segments agenda) (cdr agenda))
;Value: segments

(define (set-segments! agenda segments)
  (set-cdr! agenda segments))
;Value: set-segments!

(define (first-segment agenda) (car (segments agenda)))
;Value: first-segment

(define (rest-segments agenda) (cdr (segments agenda)))
;Value: rest-segments

(define (empty-agenda? agenda)
  (null? (segments agenda)))
;Value: empty-agenda?

(define (add-to-agenda! time action agenda)
  (define (belongs-before? segments)
    (or (null? segments)
	(< time (segment-time (car segments)))))
  (define (make-new-time-segment time action)
    (let ((L (make-list)))
      (insert-list! L action)
      (make-time-segment time L)))
  (define (add-to-segments! segments)
    (if (= (segment-time (car segments)) time)
	(insert-list! (segment-list (car segments))
		       action)
	(let ((rest (cdr segments)))
	  (if (belongs-before? rest)
	      (set-cdr! segments
			(cons (make-new-time-segment time action)
			      (cdr segments)))
	      (add-to-segments! rest)))))
  (let ((segments (segments agenda)))
    (if (belongs-before? segments)
	(set-segments! agenda
		       (cons (make-new-time-segment time action)
			     segments))
	(add-to-segments! segments))))
;Value: add-to-agenda!

(define (remove-first-agenda-item! agenda)
  (let ((L (segment-list (first-segment agenda))))
    (delete-list! L)
    (if (empty-list? L)
	(set-segments! agenda (rest-segments agenda)))))
;Value: remove-first-agenda-item!

(define (first-agenda-item agenda)
  (if (empty-agenda? agenda)
      (error "Agenda is empty -- FIRST-AGENDA-ITEM")
      (let ((first-seg (first-segment agenda)))
	(set-current-time! agenda (segment-time first-seg))
	(front-list (segment-list first-seg)))))
;Value: first-agenda-item



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;        The agenda
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (after-delay delay action)
  (add-to-agenda! (+ delay (current-time the-agenda))
		 action
		 the-agenda))
;Value: after-delay

(define (propagate)
  (if (empty-agenda? the-agenda)
      'done
      (let ((first-item (first-agenda-item the-agenda)))
	(first-item)
	(remove-first-agenda-item! the-agenda)
	(propagate))))
;Value: propagate



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;     Representing wires
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-wire)
  (let ((signal-value 0)
	(action-procedures '()))
    (define (set-my-signal! new-value)
      (if (not (= new-value signal-value))
	  (begin (set! signal-value new-value)
		 (call-each action-procedures))
	  'done))

    (define (accept-action-procedure! proc)
      (set! action-procedures (cons proc action-procedures))
      (proc))

    (define (dispatch m)
      (cond ((eq? m 'get-signal) signal-value)
	    ((eq? m 'set-signal!) set-my-signal!)
	    ((eq? m 'add-action!) accept-action-procedure!)
	    (else
	     (error "Unknown operation -- WIRE" m))))
    dispatch))
;Value: make-wire

(define (call-each procedures)
  (if (null? procedures)
      'done
      (begin ((car procedures))
	     (call-each (cdr procedures)))))
;Value: call-each

(define (get-signal wire)
  (wire 'get-signal))
;Value: get-signal

(define (set-signal! wire new-value)
  ((wire 'set-signal!) new-value))
;Value: set-signal!

(define (add-action! wire action-procedure)
  ((wire 'add-action!) action-procedure))
;Value: add-action!



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;       The and-gate
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (and-gate a1 a2 output)
  (define (and-action-procedure)
    (let ((new-value
	   (logical-and (get-signal a1) (get-signal a2))))
      (after-delay and-gate-delay
		   (lambda ()
		     (set-signal! output new-value)))))
  (add-action! a1 and-action-procedure)
  (add-action! a2 and-action-procedure)
  'ok)
;Value: and-gate

(define (logical-and s1 s2)
  (cond ((and (= s1 1) (= s2 1)) 1)
	((or (and (= s1 0) (= s2 0))
	     (and (= s1 0) (= s2 1))
	     (and (= s1 1) (= s2 0)))
	 0)
	(else (error "Invalid signal" s1 s2))))
;Value: logical-and



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   The testing simulations
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (probe name wire)
  (add-action! wire
	       (lambda ()
		 (newline)
		 (display name)
		 (display " ")
		 (display (current-time the-agenda))
		 (display "  New-value = ")
		 (display (get-signal wire)))))
;Value: probe

(define and-gate-delay 3)
;Value: and-gate-delay



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Inputs: 0,1 -> 1,1 -> 1,0 
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define the-agenda (make-agenda))
;Value: the-agenda

(define input-1 (make-wire))
;Value: input-1

(define input-2 (make-wire))
;Value: input-2

(define output (make-wire))
;Value: output

(probe 'output output)

output 0  New-value = 0
;Unspecified return value

(and-gate input-1 input-2 output)
;Value: ok

(display the-agenda)
(0 (3 *list* #[compound-procedure 27] #[compound-procedure 28]))
;Unspecified return value

(propagate)
;Value: done

(display the-agenda)
(3)
;Unspecified return value

(set-signal! input-1 0)
;Value: done

(display the-agenda)
(3)
;Unspecified return value

(set-signal! input-2 1)
;Value: done

(display the-agenda)
(3 (6 *list* #[compound-procedure 29]))
;Unspecified return value

(propagate)
;Value: done

(display the-agenda)
(6)
;Unspecified return value

(set-current-time! the-agenda 0)
;Unspecified return value

(set-signal! input-1 1)
;Value: done

(display the-agenda)
(0 (3 *list* #[compound-procedure 30]))
;Unspecified return value

(set-signal! input-2 0)
;Value: done

(display the-agenda)
(0 (3 *list* #[compound-procedure 31] #[compound-procedure 30]))
;Unspecified return value

(propagate)

output 3  New-value = 1
;Value: done

(display the-agenda)
(3)
;Unspecified return value



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Inputs: 0,1 -> 0,0 -> 1,0 
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define the-agenda (make-agenda))
;Value: the-agenda

(define input-1 (make-wire))
;Value: input-1

(define input-2 (make-wire))
;Value: input-2

(define output (make-wire))
;Value: output

(probe 'output output)

output 0  New-value = 0
;Unspecified return value

(and-gate input-1 input-2 output)
;Value: ok

(display the-agenda)
(0 (3 *list* #[compound-procedure 19] #[compound-procedure 20]))
;Unspecified return value

(propagate)
;Value: done

(display the-agenda)
(3)
;Unspecified return value

(set-signal! input-1 0)
;Value: done

(display the-agenda)
(3)
;Unspecified return value

(set-signal! input-2 1)
;Value: done

(display the-agenda)
(3 (6 *list* #[compound-procedure 21]))
;Unspecified return value

(propagate)
;Value: done

(display the-agenda)
(6)
;Unspecified return value

(set-current-time! the-agenda 0)
;Unspecified return value

(set-signal! input-2 0)
;Value: done

(display the-agenda)
(0 (3 *list* #[compound-procedure 22]))
;Unspecified return value

(set-signal! input-1 1)
;Value: done

(display the-agenda)
(0 (3 *list* #[compound-procedure 23] #[compound-procedure 22]))
;Unspecified return value

(propagate)
;Value: done

(display the-agenda)
(3)
;Unspecified return value

