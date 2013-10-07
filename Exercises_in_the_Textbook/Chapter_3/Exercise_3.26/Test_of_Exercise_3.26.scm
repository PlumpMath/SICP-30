;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Exercise_3.26.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Oct 7th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   One dimentional table
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: make-table

(define T2 (make-table))
;Value: t2

(define get-2 (T2 'lookup-proc))
;Value: get-2

(define put-2 (T2 'insert-proc!))
;Value: put-2

(get-2 1600)
;Value: #f

(get-2 901)
;Value: #f

(get-2 512)
;Value: #f

(get-2 1024)
;Value: #f

(get-2 2400)
;Value: #f

(get-2 5050)
;Value: #f



(put-2 1600 'Cai)
;Value: ok

(put-2 901 'Zhang)
;Value: ok

(put-2 512 'Qian)
;Value: ok

(put-2 1024 'Liu)
;Value: ok

(put-2 2400 'Sun)
;Value: ok

(put-2 5050 'Yan)
;Value: ok



(get-2 1600)
;Value: cai

(get-2 901)
;Value: zhang

(get-2 512)
;Value: qian

(get-2 1024)
;Value: liu

(get-2 2400)
;Value: sun

(get-2 5050)
;Value: yan



(put-2 2400 'Zhao)
;Value: ok

(put-2 512 'Yin)
;Value: ok

(put-2 1600 'Lin)
;Value: ok



(get-2 1600)
;Value: lin

(get-2 901)
;Value: zhang

(get-2 512)
;Value: yin

(get-2 1024)
;Value: liu

(get-2 2400)
;Value: zhao

(get-2 5050)
;Value: yan





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Two dimentional table
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: make-table



(define GB 044)
;Value: gb

(define RU 007)
;Value: ru

(define ES 034)
;Value: es

(define JP 081)
;Value: jp

(define HK 852)
;Value: hk



(define T5 (make-table))
;Value: t5

(define get-5 (T5 'lookup-proc))
;Value: get-5

(define put-5 (T5 'insert-proc!))
;Value: put-5



(get-5 GB 024)
;Value: #f

(get-5 GB 005)
;Value: #f

(get-5 GB 117)
;Value: #f

(get-5 GB 76)
;Value: #f

(get-5 RU 061)
;Value: #f

(get-5 RU 012)
;Value: #f

(get-5 RU 248)
;Value: #f

(get-5 ES 062)
;Value: #f

(get-5 ES 006)
;Value: #f

(get-5 ES 138)
;Value: #f

(get-5 JP 058)
;Value: #f

(get-5 JP 003)
;Value: #f

(get-5 JP 108)
;Value: #f

(get-5 HK 036)
;Value: #f

(get-5 HK 009)
;Value: #f

(get-5 HK 148)
;Value: #f

(get-5 HK 086)
;Value: #f



(put-5 GB 024 'Shakespear)
;Value: ok

(put-5 GB 005 'Hamlet)
;Value: ok

(put-5 GB 117 'Montycu)
;Value: ok

(put-5 GB 76 'Jones)
;Value: ok

(put-5 RU 061 'Smirnov)
;Value: ok

(put-5 RU 012 'Ivanov)
;Value: ok

(put-5 RU 248 'Lebedev)
;Value: ok

(put-5 ES 062 'Apellido)
;Value: ok

(put-5 ES 006 'Nombre)
;Value: ok

(put-5 ES 138 'Izqierdo)
;Value: ok

(put-5 JP 058 'Aida)
;Value: ok

(put-5 JP 003 'Ezaki)
;Value: ok

(put-5 JP 108 'Kikuti)
;Value: ok

(put-5 HK 036 'Zen)
;Value: ok

(put-5 HK 009 'Wu)
;Value: ok

(put-5 HK 148 'Liang)
;Value: ok

(put-5 HK 086 'Chan)
;Value: ok



(get-5 GB 024)
;Value: shakespear

(get-5 GB 005)
;Value: hamlet

(get-5 GB 117)
;Value: montycu

(get-5 GB 76)
;Value: jones

(get-5 RU 061)
;Value: smirnov

(get-5 RU 012)
;Value: ivanov

(get-5 RU 248)
;Value: lebedev

(get-5 ES 062)
;Value: apellido

(get-5 ES 006)
;Value: nombre

(get-5 ES 138)
;Value: izqierdo

(get-5 JP 058)
;Value: aida

(get-5 JP 003)
;Value: ezaki

(get-5 JP 108)
;Value: kikuti

(get-5 HK 036)
;Value: zen

(get-5 HK 009)
;Value: wu

(get-5 HK 148)
;Value: liang

(get-5 HK 086)
;Value: chan



(put-5 HK 148 'Shi)
;Value: ok

(put-5 JP 108 'Morris)
;Value: ok

(put-5 ES 138 'Munoz)
;Value: ok

(put-5 RU 061 'Kuzinetsov)
;Value: ok

(put-5 GB 076 'Wentshall)
;Value: ok



(get-5 GB 024)
;Value: shakespear

(get-5 GB 005)
;Value: hamlet

(get-5 GB 117)
;Value: montycu

(get-5 GB 76)
;Value: wentshall

(get-5 RU 061)
;Value: kuzinetsov

(get-5 RU 012)
;Value: ivanov

(get-5 RU 248)
;Value: lebedev

(get-5 ES 062)
;Value: apellido

(get-5 ES 006)
;Value: nombre

(get-5 ES 138)
;Value: munoz

(get-5 JP 058)
;Value: aida

(get-5 JP 003)
;Value: ezaki

(get-5 JP 108)
;Value: morris

(get-5 HK 036)
;Value: zen

(get-5 HK 009)
;Value: wu

(get-5 HK 148)
;Value: shi

(get-5 HK 086)
;Value: chan





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Multi-dimentional table
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: make-table



;; Universities and Colleges

(define Havard 001)
;Value: havard

(define MIT 002)
;Value: mit

(define Cambridge 003)
;Value: cambridge

(define Oxford 004)
;Value: oxford

(define Harvy-Mudd 005)
;Value: harvy-mudd

(define Stanford 006)
;Value: stanford

(define HKU 007)
;Value: hku

(define TokyoU 008)
;Value: tokyou



;; Stuff Rank

(define Student 01)
;Value: student

(define Teacher 02)
;Value: teacher

(define President 03)
;Value: president



;; Schools and Departments

(define Philosophy 01)
;Value: philosophy

(define Mathematics 02)
;Value: mathematics

(define Law 03)
;Value: law

(define Physics 04)
;Value: physics

(define Chemistry 05)
;Value: chemistry

(define EECS 06)
;Value: eecs

(define Biology 07)
;Value: biology

(define Mechanics 08)
;Value: mechanics

(define Bussiness 09)
;Value: bussiness



;; Students Rank

(define Undergraduate 01)
;Value: undergraduate

(define Graduate 02)
;Value: graduate



;; Teacher Rank

(define Lecturer 01)
;Value: lecturer

(define Assistant-Professor 02)
;Value: assistant-professor

(define Associate-Professor 03)
;Value: associate-professor

(define Professor 04)
;Value: professor

(define Tenure-Professor 05)
;Value: tenure-professor



(define T9 (make-table))
;Value: t9

(define get-9 (T9 'lookup-proc))
;Value: get-9

(define put-9 (T9 'insert-proc!))
;Value: put-9



(get-9 (list Harvy-Mudd Student Undergraduate Physics 106))
;Value: #f

(get-9 (list Harvy-Mudd Student Undergraduate EECS 010))
;Value: #f

(get-9 (list Harvy-Mudd Student Graduate Mechanics 068))
;Value: #f

(get-9 (list Harvy-Mudd Teacher Tenure-Professor 012))
;Value: #f

(get-9 (list Harvy-Mudd Teacher Lecturer 048))
;Value: #f

(get-9 (list Harvy-Mudd President))
;Value: #f



(get-9 (list Oxford Student Undergraduate Philosophy 020))
;Value: #f

(get-9 (list Oxford Student Undergraduate Mathematics 088))
;Value: #f

(get-9 (list Oxford Student Graduate Physics 120))
;Value: #f

(get-9 (list Oxford Teacher Associate-Professor 001))
;Value: #f

(get-9 (list Oxford Teacher Professor 005))
;Value: #f

(get-9 (list Oxford President))
;Value: #f



(put-9 (list Harvy-Mudd Student Undergraduate Physics 106) 'Fennyman)
;Value: ok

(put-9 (list Harvy-Mudd Student Undergraduate EECS 010) 'Worz)
;Value: ok

(put-9 (list Harvy-Mudd Student Graduate Mechanics 068) 'Water)
;Value: ok

(put-9 (list Harvy-Mudd Teacher Tenure-Professor 012) 'Anderson)
;Value: ok

(put-9 (list Harvy-Mudd Teacher Lecturer 048) 'Barmer)
;Value: ok

(put-9 (list Harvy-Mudd President) 'Arthur)
;Value: ok



(get-9 (list Harvy-Mudd Student Undergraduate Physics 106))
;Value: fennyman

(get-9 (list Harvy-Mudd Student Undergraduate EECS 010))
;Value: worz

(get-9 (list Harvy-Mudd Student Graduate Mechanics 068))
;Value: water

(get-9 (list Harvy-Mudd Teacher Tenure-Professor 012))
;Value: anderson

(get-9 (list Harvy-Mudd Teacher Lecturer 048))
;Value: barmer

(get-9 (list Harvy-Mudd President))
;Value: arthur



(put-9 (list Oxford Student Undergraduate Philosophy 020) 'Rusolve)
;Value: ok

(put-9 (list Oxford Student Undergraduate Mathematics 088) 'Hardy)
;Value: ok

(put-9 (list Oxford Student Graduate Physics 120) 'Newton)
;Value: ok

(put-9 (list Oxford Teacher Associate-Professor 001) 'Wentshall)
;Value: ok

(put-9 (list Oxford Teacher Professor 005) 'Spingsir)
;Value: ok

(put-9 (list Oxford President) 'Hilbert)
;Value: ok



(get-9 (list Oxford Student Undergraduate Philosophy 020))
;Value: rusolve

(get-9 (list Oxford Student Undergraduate Mathematics 088))
;Value: hardy

(get-9 (list Oxford Student Graduate Physics 120))
;Value: newton

(get-9 (list Oxford Teacher Associate-Professor 001))
;Value: wentshall

(get-9 (list Oxford Teacher Professor 005))
;Value: spingsir

(get-9 (list Oxford President))
;Value: hilbert

