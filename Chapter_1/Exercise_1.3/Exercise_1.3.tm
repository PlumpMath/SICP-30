<TeXmacs|1.0.7.18>

<style|generic>

<\body>
  <strong|Exercise 1.3. ><small|<normal-size|Define a procedure that takes
  three numbers as arguments and returns the sum of the squares of the two
  larger numbers.>>

  \;

  <strong|Analysis. ><normal-size|As we have been apprised of the procedure
  <scm|sum-of-squares> in <name|<underline|1.1.4>>, then the crucial point to
  solve this problem lay in how to find out the two larger numbers.>

  \;

  <strong|Solution. >

  <\scm-code>
    (define (sum-of-squares-of-two-largest a b c)

    \ \ \ \ (cond ((and (\<less\> a b) (\<less\> a c)) (sum-of-squares b c))

    \ \ \ \ \ \ \ \ \ \ ((and (\<less\> b a) (\<less\> b c)) (sum-of-squares
    a c))

    \ \ \ \ \ \ \ \ \ \ (sum-of-squares a b)))
  </scm-code>
</body>