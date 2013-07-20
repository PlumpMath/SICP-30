<TeXmacs|1.0.7.19>

<style|generic>

<\body>
  <\render-exercise|Exercise 2.60>
    \;

    We specified that a set would be represented as a list with no
    duplicates. Now suppose we allow duplicates. For instance, the set
    <math|{1,2,3}> could be represented as the list <scm|(2 3 2 1 3 2 2)>.
    Design procedures <scm|element-of-set?>, <scm|adjoin-set>,
    <scm|union-set>, and <scm|intersection-set> that operate on this
    representation. How does the efficiency of each compare with the
    corresponding procedure for the non-duplicate representation? Are there
    applications for which you would use this representation in preference to
    the non-duplicate one?

    <\answer>
      \;

      In this representation, <scm|element-of-set?> is pretty the same as the
      non-duplicate one:

      <\scm-code>
        (define (element-of-set? x set)

        \ \ (cond ((null? set) false)

        \ \ \ \ \ \ \ \ ((equal? x (car set)) true)

        \ \ \ \ \ \ \ \ (else (element-of-set? x (cdr set)))))
      </scm-code>

      Using this representation, we can implement <scm|adjoin-set> by simply
      adding the element at the head of an existing set:

      <\scm-code>
        (define (adjoin-set x set)

        \ \ (cons x set))
      </scm-code>

      Just as <scm|element-of-set?>, the <scm|intersection-set> operation
      remain the same even though we allow duplicates:

      <\scm-code>
        (define (intersection-set set1 set2)

        \ \ (cond ((or (null? set1) (null? set2)) '())

        \ \ \ \ \ \ \ \ ((element-of-set? (car set1) set2)

        \ \ \ \ \ \ \ \ \ (cons (car set1)

        \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (intersection-set (cdr set1) set2)))

        \ \ \ \ \ \ \ \ (else (intersection-set (cdr set1) set2))))
      </scm-code>

      Things become easy when we perform the <scm|union-set> operation in
      this duplicate representation, all we have to do is to roughly combine
      two existing set into one:

      <\scm-code>
        (define (union-set set1 set2)

        \ \ (append set1 set2))
      </scm-code>

      Now let's come to investigate the efficiency of these operations.
      Notice that both the predicate the <scm|element-of-set?> and the
      <scm|intersection-set> operation remain the same no matter whether the
      set allow duplicate or not. Hence, their efficiencies stay invariant
      with an order of growth as <math|\<Theta\> <around*|(|n|)>> and
      <math|\<Theta\> <around*|(|n<rsup|2>|)>> respectfully. The
      <scm|adjoin-set> operation, obviously, can be accomplish by one
      step<emdash>just add that particular element in the front of a
      designated set. Thus, the number of steps required grows as
      <math|\<Theta\> <around*|(|1|)>>. Since the operation <scm|union-set>
      relies on another operation <scm|append>, which has an order of growth
      of <math|\<Theta\> <around*|(|n|)>>. Hence, the number of steps it
      required also grows as <math|\<Theta\> <around*|(|n|)>>.

      Although, this duplicate representation might seem awkward to us, there
      are still many application in peference to it. For example, when we try
      to store the raw data on statistics, representation of set that allow
      duplicate will therefore becomes a better choice.
    </answer>
  </render-exercise>
</body>

<\initial>
  <\collection>
    <associate|font-base-size|11>
  </collection>
</initial>