;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Exercise_3.24.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Sept 30th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: make-table

(define T1 (make-table equal?))
;Value: t1

(define get-1 (T1 'lookup-proc))
;Value: get-1

(define put-1 (T1 'insert-proc!))
;Value: put-1

(get-1 'math '+)
;Value: #f

(get-1 'math '-)
;Value: #f

(get-1 'math '*)
;Value: #f

(get-1 'letters 'a)
;Value: #f

(get-1 'letters 'b)
;Value: #f

(put-1 'math '+ 43)
;Value: ok

(put-1 'math '- 45)
;Value: ok

(put-1 'math '* 42)
;Value: ok

(put-1 'letters 'a 97)
;Value: ok

(put-1 'letters 'b 98)
;Value: ok

(get-1 'math '+)
;Value: 43

(get-1 'math '-)
;Value: 45

(get-1 'math '*)
;Value: 42

(get-1 'letters 'a)
;Value: 97

(get-1 'letters 'b)
;Value: 98



(define T2
  (make-table (lambda (x y) (< (abs (- x y)) 0.5))))
;Value: t2

(define get-2 (T2 'lookup-proc))
;Value: get-2

(define put-2 (T2 'insert-proc!))
;Value: put-2

(get-2 101 8008)
;Value: #f

(get-2 102 8009)
;Value: #f

(get-2 103 8010)
;Value: #f

(put-2 101 8008 'Joseph)
;Value: ok

(put-2 102 8009 'Rebecca)
;Value: ok

(put-2 103 8010 'Benjamin)
;Value: ok

(get-2 101 8008)
;Value: joseph

(get-2 102 8009)
;Value: rebecca

(get-2 103 8010)
;Value: benjamin

