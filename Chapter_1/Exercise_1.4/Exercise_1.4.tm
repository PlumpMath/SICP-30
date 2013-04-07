<TeXmacs|1.0.7.18>

<style|generic>

<\body>
  <strong|Exercise 1.4. ><normal-size|Observe that our model of evaluation
  allows for combinations whose operators are compound expressions. Use this
  observation to describe the behavior of the following procedure:>

  <\scm-code>
    (define (a-plus-abs-b a b)

    \ \ ((if (\<gtr\> b 0) + -) a b))
  </scm-code>

  \;

  <strong|Solution. ><small|<normal-size|It is obvious that the <scm|if>
  conditional here returns either the <scm|+> or the <scm|-> operator,
  whichever will later be applied to the operands, that is, <scm|a> and
  <scm|b>. Consequently, the procedure above evaluate the expression
  <math|a+<around*|\||b|\|>> mathematically.>>
</body>

<\initial>
  <\collection>
    <associate|info-flag|minimal>
  </collection>
</initial>