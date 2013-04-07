<TeXmacs|1.0.7.18>

<style|generic>

<\body>
  <no-indent><strong|Exercise 1.2. ><normal-size|Translate the following
  expression into prefix form>

  <\equation*>
    <frac|5+4+<around*|(|2-<around*|(|3-<around*|(|6+<frac|4|5>|)>|)>|)>|3*<around*|(|6-2|)>*<around*|(|2-7|)>>
  </equation*>

  \;

  <no-indent><strong|Solution. >

  <\scm-code>
    (/ (+ 5 4

    \ \ \ \ \ \ (- 2

    \ \ \ \ \ \ \ \ \ (- 3

    \ \ \ \ \ \ \ \ \ \ \ \ (+ 6

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (/ 4 5)))))

    \ \ \ (* 3 (- 6 2) (- 2 7)))
  </scm-code>

  \;
</body>