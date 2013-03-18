<TeXmacs|1.0.7.18>

<style|article>

<\body>
  <strong|<no-indent>Exercise 1.1. ><normal-size|Below is a sequence of
  expressions. What is the result printed by the interpreter in response to
  each expression? Assume that the sequence is to be evaluated in the order
  in which it is presented.>

  <\scm-code>
    10

    (+ 5 3 4)

    (- 9 1)

    (/ 6 2)

    (+ (* 2 4) (- 4 6))

    (define a 3)

    (define b (+ a 1))

    (+ a b (* a b))

    (= a b)

    (if (and (\<gtr\> b a) (\<less\> b (* a b)))

    \ \ \ \ b

    \ \ \ \ a)

    (cond ((= a 4) 6)

    \ \ \ \ \ \ ((= b 4) (+ 6 7 a))

    \ \ \ \ \ \ (else 25))

    (+ 2 (if (\<gtr\> b a) b a))

    (* (cond ((\<gtr\> a b) a)

    \ \ \ \ \ \ \ \ \ ((\<less\> a b) b)

    \ \ \ \ \ \ \ \ \ (else -1))

    \ \ \ (+ a 1))
  </scm-code>

  \;

  <strong|<no-indent>Solution. >

  <\scm-code>
    10

    12

    8

    3

    6

    <with|color|light grey|\<less\>blank\<gtr\>>

    <with|color|light grey|\<less\>blank\<gtr\>>

    19

    #f

    4

    16

    6

    16
  </scm-code>

  <\session|scheme|default>
    \;
  </session>
</body>