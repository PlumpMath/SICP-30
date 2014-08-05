;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Exercise_3.23.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Sept 29th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: front-ptr

;Value: rear-ptr

;Value: set-front-ptr!

;Value: set-rear-ptr!

;Value: empty-deque?

;Value: make-deque

;Value: front-deque

;Value: rear-deque

;Value: front-insert-deque!

;Value: rear-insert-deque!

;Value: front-delete-deque!

;Value: rear-delete-deque!

;Value: print-deque

(define dq (make-deque))
;Value: dq

(print-deque (rear-insert-deque! dq 'b))
;Value 43: (b)

(print-deque (front-insert-deque! dq 'a))
;Value 44: (a b)

(print-deque (front-delete-deque! dq))
;Value 45: (b)

(print-deque (rear-insert-deque! dq 'c))
;Value 46: (b c)

(print-deque (rear-delete-deque! dq))
;Value 47: (b)

(print-deque (rear-insert-deque! dq 'd))
;Value 48: (b d)

(print-deque (front-delete-deque! dq))
;Value 49: (d)

(print-deque (front-delete-deque! dq))
;Value: ()

(front-deque dq)

;FRONT-DEQUE called with an empty deque (())
;To continue, call RESTART with an option number:
; (RESTART 1) => Return to read-eval-print level 1.

(RESTART 1)

;Abort!

(rear-deque dq)

;REAR-DEQUE called with an empty deque (())
;To continue, call RESTART with an option number:
; (RESTART 1) => Return to read-eval-print level 1.

(RESTART 1)

;Abort!

(print-deque (front-insert-deque! dq 'Steve))
;Value 50: (steve)

(print-deque (rear-insert-deque! dq 'Bill))
;Value 51: (steve bill)

(print-deque (rear-insert-deque! dq 'Larry))
;Value 52: (steve bill larry)

(print-deque (rear-insert-deque! dq 'Mark))
;Value 53: (steve bill larry mark)

(front-deque dq)
;Value: steve

(rear-deque dq)
;Value: mark

