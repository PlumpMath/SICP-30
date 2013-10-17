;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_3.31.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Oct 18th, 2013
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
;;   Implementing the queue
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (front-ptr queue) (car queue))
;Value: front-ptr

(define (rear-ptr queue) (cdr queue))
;Value: rear-ptr

(define (set-front-ptr! queue item) (set-car! queue item))
;Value: set-front-ptr!

(define (set-rear-ptr! queue item) (set-cdr! queue item))
;Value: set-rear-ptr!

(define (empty-queue? queue) (null? (front-ptr queue)))
;Value: empty-queue?

(define (make-queue) (cons '() '()))
;Value: make-queue

(define (front-queue queue)
  (if (empty-queue? queue)
      (error "FRONT called with an empty queue" queue)
      (car (front-ptr queue))))
;Value: front-queue

(define (insert-queue! queue item)
  (let ((new-pair (cons item '())))
    (cond ((empty-queue? queue)
	   (set-front-ptr! queue new-pair)
	   (set-rear-ptr! queue new-pair)
	   queue)
	  (else
	   (set-cdr! (rear-ptr queue) new-pair)
	   (set-rear-ptr! queue new-pair)
	   queue))))
;Value: insert-queue!

(define (delete-queue! queue)
  (cond ((empty-queue? queue)
	 (error "DELETE! called with an empty queue" queue))
	(else
	 (set-front-ptr! queue (cdr (front-ptr queue)))
	 queue)))
;Value: delete-queue!



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Implementing the agenda
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-time-segment time queue)
  (cons time queue))
;Value: make-time-segment

(define (segment-time s) (car s))
;Value: segment-time

(define (segment-queue s) (cdr s))
;Value: segment-queue

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
    (let ((q (make-queue)))
      (insert-queue! q action)
      (make-time-segment time q)))
  (define (add-to-segments! segments)
    (if (= (segment-time (car segments)) time)
	(insert-queue! (segment-queue (car segments))
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
  (let ((q (segment-queue (first-segment agenda))))
    (delete-queue! q)
    (if (empty-queue? q)
	(set-segments! agenda (rest-segments agenda)))))
;Value: remove-first-agenda-item!

(define (first-agenda-item agenda)
  (if (empty-agenda? agenda)
      (error "Agenda is empty -- FIRST-AGENDA-ITEM")
      (let ((first-seg (first-segment agenda)))
	(set-current-time! agenda (segment-time first-seg))
	(front-queue (segment-queue first-seg)))))
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
      (set! action-procedures (cons proc action-procedures)))

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
;;  Primitive function boxes
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (inverter input output)
  (define (invert-input)
    (let ((new-value (logical-not (get-signal input))))
      (after-delay inverter-delay
		   (lambda ()
		     (set-signal! output new-value)))))
  (add-action! input invert-input)
  'ok)
;Value: inverter

(define (logical-not s)
  (cond ((= s 0) 1)
	((= s 1) 0)
	(else (error "Invalid signal" s))))
;Value: logical-not

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

(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value
	   (logical-or (get-signal a1) (get-signal a2))))
      (after-delay or-gate-delay
		   (lambda ()
		     (set-signal! output new-value)))))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure)
  'ok)
;Value: or-gate

(define (logical-or s1 s2)
  (cond ((and (= s1 0) (= s2 0)) 0)
	((or (and (= s1 1) (= s2 1))
	     (and (= s1 1) (= s2 0))
	     (and (= s1 0) (= s2 1)))
	 1)
	(else (error "Invalid signal" s1 s2))))
;Value: logical-or



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;       The half-adder
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (half-adder a b s c)
  (let ((d (make-wire))
	(e (make-wire)))
    (or-gate a b d)
    (and-gate a b c)
    (inverter c e)
    (and-gate d e s)
    'ok))
;Value: half-adder



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    A sample simulation
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

(define the-agenda (make-agenda))
;Value: the-agenda

(define inverter-delay 2)
;Value: inverter-delay

(define and-gate-delay 3)
;Value: and-gate-delay

(define or-gate-delay 5)
;Value: or-gate-delay

(define input-1 (make-wire))
;Value: input-1

(define input-2 (make-wire))
;Value: input-2

(define sum (make-wire))
;Value: sum

(define carry (make-wire))
;Value: carry


(probe 'sum sum)

sum 0  New-value = 0
;Unspecified return value

(probe 'carry carry)

carry 0  New-value = 0
;Unspecified return value

(half-adder input-1 input-2 sum carry)
;Value: ok

(set-signal! input-1 1)
;Value: done

(propagate)

sum 8  New-value = 1
;Value: done

(set-signal! input-2 1)
;Value: done

(propagate)

carry 11  New-value = 1
sum 16  New-value = 0
;Value: done

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Implementing the queue
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (front-ptr queue) (car queue))
;Value: front-ptr

(define (rear-ptr queue) (cdr queue))
;Value: rear-ptr

(define (set-front-ptr! queue item) (set-car! queue item))
;Value: set-front-ptr!

(define (set-rear-ptr! queue item) (set-cdr! queue item))
;Value: set-rear-ptr!

(define (empty-queue? queue) (null? (front-ptr queue)))
;Value: empty-queue?

(define (make-queue) (cons '() '()))
;Value: make-queue

(define (front-queue queue)
  (if (empty-queue? queue)
      (error "FRONT called with an empty queue" queue)
      (car (front-ptr queue))))
;Value: front-queue

(define (insert-queue! queue item)
  (let ((new-pair (cons item '())))
    (cond ((empty-queue? queue)
	   (set-front-ptr! queue new-pair)
	   (set-rear-ptr! queue new-pair)
	   queue)
	  (else
	   (set-cdr! (rear-ptr queue) new-pair)
	   (set-rear-ptr! queue new-pair)
	   queue))))
;Value: insert-queue!

(define (delete-queue! queue)
  (cond ((empty-queue? queue)
	 (error "DELETE! called with an empty queue" queue))
	(else
	 (set-front-ptr! queue (cdr (front-ptr queue)))
	 queue)))
;Value: delete-queue!



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Implementing the agenda
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-time-segment time queue)
  (cons time queue))
;Value: make-time-segment

(define (segment-time s) (car s))
;Value: segment-time

(define (segment-queue s) (cdr s))
;Value: segment-queue

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
    (let ((q (make-queue)))
      (insert-queue! q action)
      (make-time-segment time q)))
  (define (add-to-segments! segments)
    (if (= (segment-time (car segments)) time)
	(insert-queue! (segment-queue (car segments))
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
  (let ((q (segment-queue (first-segment agenda))))
    (delete-queue! q)
    (if (empty-queue? q)
	(set-segments! agenda (rest-segments agenda)))))
;Value: remove-first-agenda-item!

(define (first-agenda-item agenda)
  (if (empty-agenda? agenda)
      (error "Agenda is empty -- FIRST-AGENDA-ITEM")
      (let ((first-seg (first-segment agenda)))
	(set-current-time! agenda (segment-time first-seg))
	(front-queue (segment-queue first-seg)))))
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
      (set! action-procedures (cons proc action-procedures)))

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
;;  Primitive function boxes
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (inverter input output)
  (define (invert-input)
    (let ((new-value (logical-not (get-signal input))))
      (after-delay inverter-delay
		   (lambda ()
		     (set-signal! output new-value)))))
  (add-action! input invert-input)
  'ok)
;Value: inverter

(define (logical-not s)
  (cond ((= s 0) 1)
	((= s 1) 0)
	(else (error "Invalid signal" s))))
;Value: logical-not

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

(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value
	   (logical-or (get-signal a1) (get-signal a2))))
      (after-delay or-gate-delay
		   (lambda ()
		     (set-signal! output new-value)))))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure)
  'ok)
;Value: or-gate

(define (logical-or s1 s2)
  (cond ((and (= s1 0) (= s2 0)) 0)
	((or (and (= s1 1) (= s2 1))
	     (and (= s1 1) (= s2 0))
	     (and (= s1 0) (= s2 1)))
	 1)
	(else (error "Invalid signal" s1 s2))))
;Value: logical-or



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;       The half-adder
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (half-adder a b s c)
  (let ((d (make-wire))
	(e (make-wire)))
    (or-gate a b d)
    (and-gate a b c)
    (inverter c e)
    (and-gate d e s)
    'ok))
;Value: half-adder



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    A sample simulation
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

(define the-agenda (make-agenda))
;Value: the-agenda

(define inverter-delay 2)
;Value: inverter-delay

(define and-gate-delay 3)
;Value: and-gate-delay

(define or-gate-delay 5)
;Value: or-gate-delay

(define input-1 (make-wire))
;Value: input-1

(define input-2 (make-wire))
;Value: input-2

(define sum (make-wire))
;Value: sum

(define carry (make-wire))
;Value: carry

(probe 'sum sum)
;Value: ()

(probe 'carry carry)
;Value: ()

(half-adder input-1 input-2 sum carry)
;Value: ok

(set-signal! input-1 1)
;Value: done

(propagate)
;Value: done

(set-signal! input-2 1)
;Value: done

(propagate)

carry 24  New-value = 1
;Value: done

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Implementing the queue
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (front-ptr queue) (car queue))
;Value: front-ptr

(define (rear-ptr queue) (cdr queue))
;Value: rear-ptr

(define (set-front-ptr! queue item) (set-car! queue item))
;Value: set-front-ptr!

(define (set-rear-ptr! queue item) (set-cdr! queue item))
;Value: set-rear-ptr!

(define (empty-queue? queue) (null? (front-ptr queue)))
;Value: empty-queue?

(define (make-queue) (cons '() '()))
;Value: make-queue

(define (front-queue queue)
  (if (empty-queue? queue)
      (error "FRONT called with an empty queue" queue)
      (car (front-ptr queue))))
;Value: front-queue

(define (insert-queue! queue item)
  (let ((new-pair (cons item '())))
    (cond ((empty-queue? queue)
	   (set-front-ptr! queue new-pair)
	   (set-rear-ptr! queue new-pair)
	   queue)
	  (else
	   (set-cdr! (rear-ptr queue) new-pair)
	   (set-rear-ptr! queue new-pair)
	   queue))))
;Value: insert-queue!

(define (delete-queue! queue)
  (cond ((empty-queue? queue)
	 (error "DELETE! called with an empty queue" queue))
	(else
	 (set-front-ptr! queue (cdr (front-ptr queue)))
	 queue)))
;Value: delete-queue!



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Implementing the agenda
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-time-segment time queue)
  (cons time queue))
;Value: make-time-segment

(define (segment-time s) (car s))
;Value: segment-time

(define (segment-queue s) (cdr s))
;Value: segment-queue

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
    (let ((q (make-queue)))
      (insert-queue! q action)
      (make-time-segment time q)))
  (define (add-to-segments! segments)
    (if (= (segment-time (car segments)) time)
	(insert-queue! (segment-queue (car segments))
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
  (let ((q (segment-queue (first-segment agenda))))
    (delete-queue! q)
    (if (empty-queue? q)
	(set-segments! agenda (rest-segments agenda)))))
;Value: remove-first-agenda-item!

(define (first-agenda-item agenda)
  (if (empty-agenda? agenda)
      (error "Agenda is empty -- FIRST-AGENDA-ITEM")
      (let ((first-seg (first-segment agenda)))
	(set-current-time! agenda (segment-time first-seg))
	(front-queue (segment-queue first-seg)))))
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
      (set! action-procedures (cons proc action-procedures)))

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
;;  Primitive function boxes
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (inverter input output)
  (define (invert-input)
    (let ((new-value (logical-not (get-signal input))))
      (after-delay inverter-delay
		   (lambda ()
		     (set-signal! output new-value)))))
  (add-action! input invert-input)
  'ok)
;Value: inverter

(define (logical-not s)
  (cond ((= s 0) 1)
	((= s 1) 0)
	(else (error "Invalid signal" s))))
;Value: logical-not

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

(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value
	   (logical-or (get-signal a1) (get-signal a2))))
      (after-delay or-gate-delay
		   (lambda ()
		     (set-signal! output new-value)))))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure)
  'ok)
;Value: or-gate

(define (logical-or s1 s2)
  (cond ((and (= s1 0) (= s2 0)) 0)
	((or (and (= s1 1) (= s2 1))
	     (and (= s1 1) (= s2 0))
	     (and (= s1 0) (= s2 1)))
	 1)
	(else (error "Invalid signal" s1 s2))))
;Value: logical-or



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;       The half-adder
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (half-adder a b s c)
  (let ((d (make-wire))
	(e (make-wire)))
    (or-gate a b d)
    (and-gate a b c)
    (inverter c e)
    (and-gate d e s)
    'ok))
;Value: half-adder



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    A sample simulation
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

(define the-agenda (make-agenda))
;Value: the-agenda

(define inverter-delay 2)
;Value: inverter-delay

(define and-gate-delay 3)
;Value: and-gate-delay

(define or-gate-delay 5)
;Value: or-gate-delay

(define input-1 (make-wire))
;Value: input-1

(define input-2 (make-wire))
;Value: input-2

(define sum (make-wire))
;Value: sum

(define carry (make-wire))
;Value: carry

(probe 'sum sum)
;Value: ()

(probe 'carry carry)
;Value: ()

(half-adder input-1 input-2 sum carry)
;Value: ok

(set-signal! input-1 1)
;Value: done

(propagate)
;Value: done

(set-signal! input-2 1)
;Value: done

(propagate)

carry 11  New-value = 1
;Value: done

