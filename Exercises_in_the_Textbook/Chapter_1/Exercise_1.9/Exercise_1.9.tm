<TeXmacs|1.0.7.18>

<style|generic>

<\body>
  <\render-exercise|Exercise 1.9>
    Each of the following two procedures defines a method for adding two
    positive integers in terms of the procedures <scm|inc>, which increments
    its argument by <math|1>, and <scm|dec>, which decrements its argument by
    <math|1>.

    <\scm-code>
      (define (+ a b)

      \ \ (if (= a 0)

      \ \ \ \ \ \ b

      \ \ \ \ \ \ (inc (+ (dec a) b))))

      \;

      (define (+ a b)

      \ \ (if (= a 0)

      \ \ \ \ \ \ b

      \ \ \ \ \ \ (+ (dec a) (inc b))))
    </scm-code>

    Using the substitution model, illustrate the process generated by each
    procedure in evaluating <scm|(+ 4 5)>. Are these processes iterative or
    recursive?

    <\answer>
      Consider the process generated by the first procedure,

      <\scm-code>
        (+ 4 5)

        ;;(inc (+ (dec 4) 5))

        (inc (+ 3 5))

        ;;(inc (inc (+ (dec 3) 5)))

        (inc (inc (+ 2 5)))

        ;;(inc (inc (inc (+ (dec 2) 5))))

        (inc (inc (inc (+ 1 5))))

        ;;(inc (inc (inc (inc (+ (dec 1) 5)))))

        (inc (inc (inc (inc (+ 0 5)))))

        (inc (inc (inc (inc 5))))

        (inc (inc (inc 6)))

        (inc (inc 7))

        (inc 8)

        9
      </scm-code>

      we can intuitively conclude that the process above is recursive.

      Generated by the second procedure is the following process,

      <\scm-code>
        (+ 4 5)

        ;;(+ (dec 4) (inc 5))

        (+ 3 6)

        ;;(+ (dec 3) (inc 6))

        (+ 2 7)

        ;;(+ (dec 2) (inc 7))

        (+ 1 8)

        ;;(+ (dec 1) (inc 8))

        (+ 0 9)

        9
      </scm-code>

      undoubtfully, this process is iterative.
    </answer>
  </render-exercise>
</body>