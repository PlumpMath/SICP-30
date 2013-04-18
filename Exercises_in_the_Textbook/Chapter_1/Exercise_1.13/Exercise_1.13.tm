<TeXmacs|1.0.7.19>

<style|generic>

<\body>
  <\render-exercise|Exercise 1.13>
    Prove that <math|Fib (n)> is the closest integer to
    <math|<frac*|\<phi\><rsup|n>|<sqrt|5>>>, where
    <math|\<phi\>=<frac*|<around*|(|1+<sqrt|5>|)>|2>>. Hint: Let
    <math|\<psi\>=<frac*|<around*|(|1-<sqrt|5>|)>|2>>. Use induction and the
    definition of the Fibonacci numbers (see section <underline|1.2.2>) to
    prove that <math|Fib <around*|(|n|)>=<frac*|<around*|(|\<phi\><rsup|n>-\<psi\><rsup|n>|)>|<sqrt|5>>>.

    <\proof>
      As is indicated in the problem, in order to prove that <math|Fib (n)>
      is the closest integer to <math|<frac*|\<phi\><rsup|n>|<sqrt|5>>>, we
      had better prove\ 

      <\lemma*>
        <math|Fib <around*|(|n|)>=<frac*|<around*|(|\<phi\><rsup|n>-\<psi\><rsup|n>|)>|<sqrt|5>>>
        for all <math|n> greater than <math|0>.
      </lemma*>

      first.

      Well, let's go! Inspired by the hint given above, the lemma <math|Fib
      <around*|(|n|)>=<frac*|<around*|(|\<phi\><rsup|n>-\<psi\><rsup|n>|)>|<sqrt|5>>>
      can be prove through mathematical induction.\ 

      <strong|Base Case:> <math|<around*|(|n=0|)> Fib<around*|(|0|)>> is true
      because <math|Fib <around*|(|0|)>=0=<frac*|<around*|(|\<phi\><rsup|0>-\<psi\><rsup|0>|)>|<sqrt|5>>>,
      and <math|<around*|(|n=1|)> Fib<around*|(|1|)>> is also true by
      <math|Fib <around*|(|1|)>=1=<frac|<frac*|<around*|(|1+<sqrt|5>|)>|2>-<frac*|<around*|(|1-<sqrt|5>|)>|2>|<sqrt|5>>=<frac*|<around*|(|\<phi\><rsup|1>-\<psi\><rsup|1>|)>|<sqrt|5>>>.

      <strong|Inductive Step:> Suppose that <math|n\<geq\>2> and
      <math|<around*|(|n=k|)> Fib <around*|(|k|)> and <around*|(|n=k+1|)> Fib
      <around*|(|k+1|)>> holds where <math|Fib
      <around*|(|k|)>=<frac*|<around*|(|\<phi\><rsup|k>-\<psi\><rsup|k>|)>|<sqrt|5>>
      and Fib <around*|(|k+1|)>=<frac*|<around*|(|\<phi\><rsup|k+1>-\<psi\><rsup|k+1>|)>|<sqrt|5>>>.
      We must show that <math|<around*|(|n=k+2|)> Fib<around*|(|k+2|)>>
      holds, namely, that <math|Fib <around*|(|k+2|)>=<frac*|<around*|(|\<phi\><rsup|k+2>-\<psi\><rsup|k+2>|)>|<sqrt|5>>>.
      Having been mentioned in the problem, we can use the defintion of the
      Fibonacci numbers

      <\equation*>
        \<phi\><rsup|2>=\<phi\>+1 <around*|(|or \<psi\><rsup|2>=\<psi\>+1
        identically|)>
      </equation*>

      \ to help us to argue:

      <\eqnarray*>
        <tformat|<table|<row|<cell|Fib <around*|(|k+2|)>>|<cell|=>|<cell|Fib
        <around*|(|k|)>+Fib<around*|(|k+1|)>>>|<row|<cell|>|<cell|=>|<cell|<frac*|<around*|(|\<phi\><rsup|k>-\<psi\><rsup|k>|)>|<sqrt|5>>+<frac*|<around*|(|\<phi\><rsup|k+1>-\<psi\><rsup|k+1>|)>|<sqrt|5>>>>|<row|<cell|>|<cell|=>|<cell|<frac|\<phi\><rsup|k>+\<phi\><rsup|k+1>-<around*|(|\<psi\><rsup|k>+\<psi\><rsup|k+1>|)>|<sqrt|5>>>>|<row|<cell|>|<cell|=>|<cell|<frac|\<phi\><rsup|k>*<around*|(|1+\<phi\>|)>-\<psi\><rsup|k>*<around*|(|1+\<psi\>|)>|<sqrt|5>>>>|<row|<cell|>|<cell|=>|<cell|<frac|\<phi\><rsup|k>*\<phi\><rsup|2>-\<psi\><rsup|k>*\<psi\><rsup|2>|<sqrt|5>>>>|<row|<cell|>|<cell|=>|<cell|<frac*|<around*|(|\<phi\><rsup|k+2>-\<psi\><rsup|k+2>|)>|<sqrt|5>>>>>>
      </eqnarray*>

      Therefore, <math|<around*|(|n=k+2|)> Fib <around*|(|k+2|)>> holds for
      every <math|n\<geq\>2>, which completes the proof of Lemma by strong
      induction that <math|Fib <around*|(|n|)>> holds for all
      <math|n\<geq\>0>.

      In order to approach to the final conclusion, notice that the value of
      <math|\<psi\><rsup|n>> keeps oscillating between the negtive real
      number <math|\<phi\><rsup|>=<frac*|<around*|(|1-<sqrt|5>|)>|2>> and the
      positive integer <math|\<phi\><rsup|0>=1> with its sign changing
      alternately as <math|n> varies. So,\ 

      it becomes insignificant as <math|n> going larger and larger.
      Therefore, <math|Fib (n)> is the closest integer to
      <math|<frac*|\<phi\><rsup|n>|<sqrt|5>>>.\ 
    </proof>
  </render-exercise>
</body>