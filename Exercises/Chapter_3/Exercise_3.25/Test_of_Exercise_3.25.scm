;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Exercise_3.25.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Sept 30th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: make-table

(define T1 (make-table))
;Value: t1

(define get-1 (T1 'lookup-proc))
;Value: get-1

(define put-1 (T1 'insert-proc!))
;Value: put-1

(get-1 '(a))
;Value: #f

(get-1 '(b))
;Value: #f

(get-1 '(c))
;Value: #f

(put-1 '(a) 1)
;Value 17: (*table* (a . 1))

(put-1 '(b) 2)
;Value 17: (*table* (b . 2) (a . 1))

(put-1 '(c) 3)
;Value 17: (*table* (c . 3) (b . 2) (a . 1))

(get-1 '(a))
;Value: 1

(get-1 '(b))
;Value: 2

(get-1 '(c))
;Value: 3



(define T2 (make-table))
;Value: t2

(define get-2 (T2 'lookup-proc))
;Value: get-2

(define put-2 (T2 'insert-proc!))
;Value: put-2

(get-2 '(math +))
;Value: #f

(get-2 '(math -))
;Value: #f

(get-2 '(math *))
;Value: #f

(get-2 '(letters a))
;Value: #f

(get-2 '(letters b))
;Value: #f

(put-2 '(math +) 43)
;Value 16: (*table* (math (+ . 43)))

(put-2 '(math -) 45)
;Value 16: (*table* (math (- . 45) (+ . 43)))

(put-2 '(math *) 42)
;Value 16: (*table* (math (* . 42) (- . 45) (+ . 43)))

(put-2 '(letters a) 97)
;Value 16: (*table* (letters (a . 97)) (math (* . 42) (- . 45) (+ . 43)))

(put-2 '(letters b) 98)
;Value 16: (*table* (letters (b . 98) (a . 97)) (math (* . 42) (- . 45) (+ . 43)))

(get-2 '(math +))
;Value: 43

(get-2 '(math -))
;Value: 45

(get-2 '(math *))
;Value: 42

(get-2 '(letters a))
;Value: 97

(get-2 '(letters b))
;Value: 98



(define T3 (make-table))
;Value: t3

(define get-3 (T3 'lookup-proc))
;Value: get-3

(define put-3 (T3 'insert-proc!))
;Value: put-3

(get-3 '(MIT President))
;Value: #f

(get-3 '(MIT Professor T-18.02))
;Value: #f

(get-3 '(MIT Professor T-18.05))
;Value: #f

(get-3 '(MIT Professor T-18.09))
;Value: #f

(get-3 '(MIT Student Undergradutes Mathematics U-18.2011001))
;Value: #f

(get-3 '(MIT Student Undergradutes Mathematics U-18.2012098))
;Value: #f

(get-3 '(MIT Student Undergradutes Mathematics U-18.2013101))
;Value: #f

(get-3 '(MIT Student Undergradutes EECS U-6.2011008))
;Value: #f

(get-3 '(MIT Student Undergradutes EECS U-6.2012198))
;Value: #f

(get-3 '(MIT Student Undergradutes EECS U-6.2013200))
;Value: #f

(put-3 '(MIT President) 'Reif)
;Value 18: (*table* (mit (president . reif)))

(put-3 '(MIT Professor T-18.02) 'Strang)
;Value 18: (*table* (mit (professor (t-18.02 . strang)) (president . reif)))

(put-3 '(MIT Professor T-18.05) 'Muttark)
;Value 18: (*table* (mit (professor (t-18.05 . muttark) (t-18.02 . strang)) (president . reif)))

(put-3 '(MIT Professor T-18.09) 'Jerison)
;Value 18: (*table* (mit (professor (t-18.09 . jerison) (t-18.05 . muttark) (t-18.02 . strang)) (president . reif)))

(put-3 '(MIT Student Undergradutes Mathematics U-18.2011001) 'James)
;Value 18: (*table* (mit (student (undergradutes (mathematics (u-18.2011001 . james)))) (professor (t-18.09 . jerison) (t-18.05 . muttark) (t-18.02 . strang)) (president . reif)))

(put-3 '(MIT Student Undergradutes Mathematics U-18.2012098) 'Elizabeth)
;Value 18: (*table* (mit (student (undergradutes (mathematics (u-18.2012098 . elizabeth) (u-18.2011001 . james)))) (professor (t-18.09 . jerison) (t-18.05 . muttark) (t-18.02 . strang)) (president . reif)))

(put-3 '(MIT Student Undergradutes Mathematics U-18.2013101) 'Stefani)
;Value 18: (*table* (mit (student (undergradutes (mathematics (u-18.2013101 . stefani) (u-18.2012098 . elizabeth) (u-18.2011001 . james)))) (professor (t-18.09 . jerison) (t-18.05 . muttark) (t-18.02 . strang)) (president . reif)))

(put-3 '(MIT Student Undergradutes EECS U-6.2011008) 'Steward)
;Value 18: (*table* (mit (student (undergradutes (eecs (u-6.2011008 . steward)) (mathematics (u-18.2013101 . stefani) (u-18.2012098 . elizabeth) (u-18.2011001 . james)))) (professor (t-18.09 . jerison) (t-18.05 . muttark) (t-18.02 . strang)) (president . reif)))

(put-3 '(MIT Student Undergradutes EECS U-6.2012198) 'Menlord)
;Value 18: (*table* (mit (student (undergradutes (eecs (u-6.2012198 . menlord) (u-6.2011008 . steward)) (mathematics (u-18.2013101 . stefani) (u-18.2012098 . elizabeth) (u-18.2011001 . james)))) (professor (t-18.09 . jerison) (t-18.05 . muttark) (t-18.02 . strang)) (president . reif)))

(put-3 '(MIT Student Undergradutes EECS U-6.2013200) 'Abel)
;Value 18: (*table* (mit (student (undergradutes (eecs (u-6.2013200 . abel) (u-6.2012198 . menlord) (u-6.2011008 . steward)) (mathematics (u-18.2013101 . stefani) (u-18.2012098 . elizabeth) (u-18.2011001 . james)))) (professor (t-18.09 . jerison) (t-18.05 . muttark) (t-18.02 . strang)) (president . reif)))

(get-3 '(MIT President))
;Value: reif

(get-3 '(MIT Professor T-18.02))
;Value: strang

(get-3 '(MIT Professor T-18.05))
;Value: muttark

(get-3 '(MIT Professor T-18.09))
;Value: jerison

(get-3 '(MIT Student Undergradutes Mathematics U-18.2011001))
;Value: james

(get-3 '(MIT Student Undergradutes Mathematics U-18.2012098))
;Value: elizabeth

(get-3 '(MIT Student Undergradutes Mathematics U-18.2013101))
;Value: stefani

(get-3 '(MIT Student Undergradutes EECS U-6.2011008))
;Value: steward

(get-3 '(MIT Student Undergradutes EECS U-6.2012198))
;Value: menlord

(get-3 '(MIT Student Undergradutes EECS U-6.2013200))
;Value: abel

