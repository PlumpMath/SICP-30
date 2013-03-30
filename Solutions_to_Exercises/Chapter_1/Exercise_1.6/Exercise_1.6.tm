<TeXmacs|1.0.7.18>

<style|generic>

<\body>
  <\render-exercise|Exercise 1.6>
    Alyssa P. Hacker doesn't see why <scm|if> needs to be provided as a
    special form. ``Why can't I just define it as an ordinary procedure in
    terms of <scm|cond>?'' she asks. Alyssa's friend Eva Lu Ator claims this
    can indeed be done, and she defines a new version of <scm|if>:

    <\scm-code>
      (define (new-if predicate then-clause else-clause)

      \ \ (cond (predicate then-clause)

      \ \ \ \ \ \ \ \ (else else-clause)))
    </scm-code>

    Eva demonstrates the program for Alyssa:

    <\scm-code>
      (new-if (= 2 3) 0 5)

      5
    </scm-code>

    <\scm-code>
      (new-if (= 1 1) 0 5)

      0
    </scm-code>

    Delighted, Alyssa uses <scm|new-if> to rewrite the square-root program:

    <\scm-code>
      (define (sqrt-iter guess x)

      \ \ (new-if (good-enough? guess x)

      \ \ \ \ \ \ \ \ \ \ guess

      \ \ \ \ \ \ \ \ \ \ (sqrt-iter (improve guess x)

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ x)))
    </scm-code>

    What happens when Alyssa attempts to use this to compute square roots?
    Explain.

    <\answer>
      The interpreter turns out to never terminate without any result ouput
      when Alyssa attempts to compute square root in this way.\ 

      Note that we have been informed the application process for compound
      procedures in <underline|1.1.5>. That is, to apply a compound procedure
      to arguments, evaluate the body of the procedure with each formal
      parameter replaced by the corresponding argument.

      After receiving the combination <scm|(sqrt-iter guess x)>, the
      interpreter extracts it into:\ 

      <\scm-code>
        \ (new-if (good-enough? guess x)

        \ \ \ \ \ \ \ \ \ \ guess

        \ \ \ \ \ \ \ \ \ \ (sqrt-iter (improve guess x)

        \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ x)))
      </scm-code>

      Obvious, in order to get the compound procedure <scm|new-if> applied,
      all the arguments in the latter expression above have to be evaluated.
      That is, the <scm|(good-enough? guess x)>, <scm|guess> and
      <scm|(sqrt-iter (improve guess x) x)>. To evaluate <scm|(sqrt-iter
      (improve guess x) x)>, the interpreter has to call <scm|new-if> again.
      Continue in this process, we can see that the argument <scm|(sqrt-iter
      (improve guess x) x)> would be evaluated recursively with
      \ <scm|new-if> being called infinitely. Thus, a borderless recursion
      was formed and the interpreter would never terminate with nothing
      output.\ 
    </answer>
  </render-exercise>
</body>