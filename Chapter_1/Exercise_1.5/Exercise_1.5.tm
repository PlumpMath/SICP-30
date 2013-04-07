<TeXmacs|1.0.7.18>

<style|generic>

<\body>
  <strong|Exercise 1.5. ><normal-size|Ben Bitdiddle has invented a test to
  determine whether the interpreter he is faced with is using
  <em|applicative-order evaluation> or <em|normal-order evaluation>. He
  defines the following two procedures:>

  <\scm-code>
    (define (p) (p))

    \;

    (define (test x y)

    \ \ (if (= x 0)

    \ \ \ \ \ \ 0

    \ \ \ \ \ \ y))
  </scm-code>

  <normal-size|Then he evaluates the expression>

  <\scm-code>
    (test 0 (p))
  </scm-code>

  <normal-size|What behavior will Ben observe with an interpreter that uses
  <em|applicative-order evaluation>? What behavior will he observe with an
  interpreter that uses <em|normal-order evaluation>? Explain your answer.
  (Assume that the evaluation rule for the special form <scm|if> is the same
  whether the interpreter is using <em|normal> or <em|applicative> order: The
  predicate expression is evaluated first, and the result determines whether
  to evaluate the consequent or the alternative expression.)>

  \;

  <strong|Solution. ><normal-size|Well, this is interesting! In brief, Ben
  will find that the interpreter never terminates with no output while using
  the <em|applicative-order evaluation>. In <em|normal-order evaluation>, he
  will see that interpreter prints an <scm|0> immediately after the
  procedures being executed. The reason is presented as the following: >

  <normal-size|According to the description of <em|applicative-order
  evaluation> and <em|normal-order evaluation> in section <underline|1.1.5>,
  the <em|applicative-order evaluation> model would not applied the operator
  to the operands until both have been evaluated. On the contrary, the
  <em|normal-order evaluation> methord indicates that the interpreter would
  not evaluate the operands until their value were needed. In other words, so
  long as the value of some particular operands is not needed at present, the
  <em|normal-order evaluation> methord will continue to substitute operand
  expression without noticing them.>

  <normal-size|As shown in Figure <reference|Figure_1>, the
  <em|applicative-order evaluation> strategy keeps the interpreter evaluating
  the operand <scm|p>, whose value is unavailable here. Because, under the
  environment of <em|applicative-order evaluation> model, the expression
  <scm|(test 0 (p))> here is identical to itself after being extracted.
  Undoutfully, this puts the interpreter in keeping evaluating the expression
  <scm|(test 0 (p))> infinitely in Environment <math|\<b-up-I\>> . Thus,
  nothing is output:>

  <\scm-code>
    (test 0 (p))

    (test 0 (p))

    ...

    (test 0 (p))

    ...
  </scm-code>

  <\float|float|tbh>
    <big-figure|<label|Figure_1><with|gr-mode|<tuple|group-edit|move>|gr-frame|<tuple|scale|1cm|<tuple|0.529997gw|0.5gh>>|gr-geometry|<tuple|geometry|1par|0.6par>|gr-arrow-end|\<gtr\>|gr-auto-crop|true|<graphics||<with|arrow-begin|\<less\>|<line|<point|-5.82614|3.25786>|<point|-5.8|-0.0999999999999999>|<point|-3.8|-0.0999999999999999>|<point|-1.0|-0.0999999999999999>|<point|-1.00010914142082|0.146335494112978>>>|<with|dash-style|1111010|<line|<point|-5.3|2.9>|<point|0.4|2.9>|<point|0.4|-0.4>|<point|-5.3|-0.4>|<point|-5.3|2.9>>>|<gr-group|<cline|<point|-4.63256713851039|0.59966265379018>|<point|-2.63256713851039|0.59966265379018>|<point|-3.03256713851039|0.199662653790183>|<point|-5.13256713851039|0.199662653790183>>|<text-at|<scm|(return
    y)>|<point|-4.75835097235085|0.295591348061913>>>|<with|dash-style|1111010|<line|<point|-7.0|4.0>|<point|-7.0|3.1>|<point|-4.5|3.1>|<point|-4.5|4.0>|<point|-7.0|4.0>>>|<with|magnify|1.47648230602334|<cline|<point|-3.83932748908585|2.52291565700081>|<point|-4.87286510330219|2.07997096519381>|<point|-3.83932748908585|1.63702627338681>|<point|-2.80578987486951|2.07997096519381>>>|<with|arrow-begin|\<less\>|<line|<point|-3.8|-0.0999999999999999>|<point|-3.81529633549411|0.209835957137187>>>|<cline|<point|-6.74237132160339|3.61581558407197>|<point|-4.74237132160339|3.61581558407197>|<point|-4.74237132160339|3.21581558407197>|<point|-6.74237132160339|3.21581558407197>>|<with|arrow-end|\<gtr\>|<line|<point|-3.83113036927723|1.59855637812062>|<point|-3.82651953534176|0.61045428881467>>>|<text-at|<scm|(test
    x y)>|<point|-6.64237132160339|3.31581558407197>>|<with|arrow-end|\<gtr\>|<spline|<point|-2.8|3.1>|<point|-3.5|3.0>|<point|-3.8|2.5>>>|<with|arrow-end|\<gtr\>|dash-style|10|<spline|<point|-4.70138|3.44676>|<point|-3.82817|3.6477>|<point|-4.02817|2.9477>>>|<text-at|<scm|(=
    x 0)?>|<point|-4.54063017608149|1.94694410978966>>|<text-at|<math|\<b-up-I\>>|<point|-4.7713884111655|3.7175684614367>>|<gr-group|<cline|<point|-1.78662521497552|0.55567866119857>|<point|0.21337478502448|0.55567866119857>|<point|-0.186625214975519|0.15567866119857>|<point|-2.18662521497552|0.15567866119857>>|<text-at|<scm|(return
    0)>|<point|-1.95151805794417|0.23427314949067>>>|<with|arrow-end|\<gtr\>|<line|<point|-2.8|2.1>|<point|-1.0|2.1>|<point|-1.00010914142082|0.56967191427438>>>|<text-at|<math|\<b-up-I\>\<b-up-I\>>|<point|-0.4|2.3>>>>|Flow
    Chart for Exercise 1.5>

    <normal-size|By comparision, in the <em|normal-order evaluation> model,
    <scm|p> in expression <scm|(test 0 (p))> here would not be evaluated
    until it is needed.>

    <normal-size|Obviously, as is the case in Figure <reference|Figure_1>,
    the interpreter will proceed to Environment
    <strong|<math|\<b-up-I\>\<b-up-I\>>> immediately and reveal its procedure
    as the following: >

    <\scm-code>
      (if (= 0 0) 0 p)

      (if #t 0 p)

      (0)
    </scm-code>

    Consequently, <scm|0> will be output immediately after the procedures
    above being executed.
  </float>
</body>

<\references>
  <\collection>
    <associate|1|<tuple|?|?>>
    <associate|Figure_1|<tuple|1|1>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|Flow Chart for Exercise 1.5|<pageref|auto-1>>
    </associate>
  </collection>
</auxiliary>