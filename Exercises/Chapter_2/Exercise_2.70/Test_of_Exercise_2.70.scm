;Value: make-leaf

;Value: leaf?

;Value: symbol-leaf

;Value: weight-leaf

;Value: make-code-tree

;Value: left-branch

;Value: right-branch

;Value: symbols

;Value: weight

;Value: adjoin-set

;Value: make-leaf-set

;Value: generate-huffman-tree

;Value: successive-merge

;Value: encode

;Value: encode-symbol

;Value: element-of-set?

(define alphabet '((A 2) (BOOM 1) (GET 2) (JOB 2) (NA 16) (SHA 3) (YIP 9) (WAH 1)))
;Value: alphabet

(define lyrics-encoding-tree (generate-huffman-tree alphabet))
;Value: lyrics-encoding-tree

(display lyrics-encoding-tree)
((leaf na 16) ((leaf yip 9) (((leaf a 2) ((leaf wah 1) (leaf boom 1) (wah boom) 2) (a wah boom) 4) ((leaf sha 3) ((leaf job 2) (leaf get 2) (job get) 4) (sha job get) 7) (a wah boom sha job get) 11) (yip a wah boom sha job get) 20) (na yip a wah boom sha job get) 36)
;Unspecified return value

(define lyrics1 '(Get a job))
;Value: lyrics1

(define lyrics2 '(Sha na na na na na na na na))
;Value: lyrics2

(define lyrics3 '(Wah yip yip yip yip yip yip yip yip yip))
;Value: lyrics3

(define lyrics4 '(Sha boom))
;Value: lyrics4

(encode lyrics1 lyrics-encoding-tree)
;Value 20: (1 1 1 1 1 1 1 0 0 1 1 1 1 0)

(encode lyrics2 lyrics-encoding-tree)
;Value 21: (1 1 1 0 0 0 0 0 0 0 0 0)

(encode lyrics1 lyrics-encoding-tree)
;Value 22: (1 1 1 1 1 1 1 0 0 1 1 1 1 0)

(encode lyrics2 lyrics-encoding-tree)
;Value 23: (1 1 1 0 0 0 0 0 0 0 0 0)

(encode lyrics3 lyrics-encoding-tree)
;Value 24: (1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0)

(encode lyrics4 lyrics-encoding-tree)
;Value 25: (1 1 1 0 1 1 0 1 1)

