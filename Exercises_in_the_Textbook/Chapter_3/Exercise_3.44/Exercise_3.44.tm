<TeXmacs|1.0.7.20>

<style|generic>

<\body>
  <\render-exercise|Exercise 3.44>
    \;

    Consider the problem of transferring an amount from one account to
    another. Ben Bitdiddle claims that this can be accomplished with the
    following procedure, even if there are multiple people concurrently
    transferring money among multiple accounts, using any account mechanism
    that serializes deposit and withdrawal transactions, for example, the
    version of make-account in the text above.

    <\scm-code>
      (define (transfer from-account to-account amount)

      \ \ ((from-account 'withdraw) amount)

      \ \ ((to-account 'deposit) amount))
    </scm-code>

    Louis Reasoner claims that there is a problem here, and that we need to
    use a more sophisticated method, such as the one required for dealing
    with the exchange problem. Is Louis right? If not, what is the essential
    difference between the transfer problem and the exchange problem? (You
    should assume that the balance in <scm|from-account> is at least
    <scm|amount>.)

    <\answer>
      \;

      Louis is wrong. The transfer operation fetches a designated amount of
      money from one account and deposits it into the other one. The timing
      diagram in figure <\float|float|tbh>
        <big-figure|<label|Exercise_3.44-Figure_1><with|gr-mode|<tuple|edit|text-at>|gr-frame|<tuple|scale|1cm|<tuple|0.490001gw|0.939956gh>>|gr-geometry|<tuple|geometry|1par|0.6par>|gr-grid|<tuple|empty>|gr-grid-old|<tuple|cartesian|<point|0|0>|1>|gr-edit-grid-aspect|<tuple|<tuple|axes|none>|<tuple|1|none>|<tuple|10|none>>|gr-edit-grid|<tuple|empty>|gr-edit-grid-old|<tuple|cartesian|<point|0|0>|1>|gr-auto-crop|true|gr-arrow-end|o|<graphics||<carc|<point|-3.0|3.0>|<point|-2.0|3.0>|<point|-2.5|3.5>>|<text-at|<math|a3>|<point|3.3|3.9>>|<text-at|<math|a1>
        new value: <math|10+10=20>|<point|-0.0683100000000001|-1.72577>>|<arc|<point|4.1|-1.32577>|<point|4.4|-1.62577>|<point|4.1|-1.92577>>|<arc|<point|-2.8|2.02742>|<point|-2.5|1.72742>|<point|-2.8|1.42742>>|<text-at|Access
        <math|a1> balance: <math|$10>|<point|-6.26831|1.62742>>|<line|<point|-6.2|2.02742>|<point|-2.8|2.02742>>|<arc|<point|0.28901|-2.38505504528978>|<point|-0.0109900000000001|-2.68505504528978>|<point|0.28901|-2.98505504528978>>|<line|<point|0.28901|-2.98505504528978>|<point|3.68901|-2.98505504528978>>|<line|<point|-8.32667268468867e-17|-1.32577>|<point|4.1|-1.32577>>|<line|<point|-6.2|1.42742>|<point|-2.8|1.42742>>|<arc|<point|3.68901|-2.38505504528978>|<point|3.98901|-2.68505504528978>|<point|3.68901|-2.98505504528978>>|<arc|<point|-8.32667268468867e-17|-1.32577>|<point|-0.3|-1.62577>|<point|-8.32667268468867e-17|-1.92577>>|<line|<point|-8.32667268468867e-17|-1.92577>|<point|4.1|-1.92577>>|<arc|<point|-6.2|2.02742>|<point|-6.5|1.72742>|<point|-6.2|1.42742>>|<text-at|time|<point|-7.34066|-12.3>>|<text-at|Peter|<point|-4.9|3.9>>|<text-at|Paul|<point|5.2|3.9>>|<text-at|<math|a1>|<point|-2.65243|3.89334765282429>>|<text-at|<math|a2>|<point|0.3|3.9>>|<text-at|$10|<point|-2.77435758385107|2.88004034925255>>|<text-at|$30|<point|3.26292241614893|2.88004034925255>>|<carc|<point|3.03728|3.0>|<point|4.03728|3.0>|<point|3.53728|3.5>>|<carc|<point|2.77555756156289e-17|3.0>|<point|1.0|3.0>|<point|0.5|3.5>>|<text-at|$20|<point|0.22564241614893|2.88004034925255>>|<arc|<point|-5.3|0.92742>|<point|-5.6|0.62742>|<point|-5.3|0.32742>>|<line|<point|-5.3|0.32742>|<point|-1.9|0.32742>>|<line|<point|-5.3|0.92742>|<point|-1.9|0.92742>>|<text-at|Access
        <math|a2> balance: <math|$20>|<point|-5.36831|0.52742>>|<arc|<point|-1.9|0.92742>|<point|-1.6|0.62742>|<point|-1.9|0.32742>>|<arc|<point|-3.4|-0.2>|<point|-3.1|-0.5>|<point|-3.4|-0.8>>|<text-at|account:
        <math|$10>|<point|-6.26831|-0.6>>|<arc|<point|-6.2|-0.2>|<point|-6.5|-0.5>|<point|-6.2|-0.8>>|<arc|<point|6.4|0.92742>|<point|6.7|0.62742>|<point|6.4|0.32742>>|<arc|<point|5.5|2.02742>|<point|5.8|1.72742>|<point|5.5|1.42742>>|<text-at|Access
        <math|a3> balance: <math|$30>|<point|2.93169|0.52742>>|<text-at|Access
        <math|a1> balance: <math|$10>|<point|2.03169|1.62742>>|<arc|<point|4.8|-0.2>|<point|5.1|-0.5>|<point|4.8|-0.8>>|<text-at|account:
        <math|$10>|<point|2.03169|-0.6>>|<line|<point|2.1|-0.2>|<point|4.8|-0.186908837924601>>|<line|<point|2.1|-0.8>|<point|4.8|-0.8>>|<arc|<point|2.1|-0.2>|<point|1.8|-0.5>|<point|2.1|-0.8>>|<line|<point|2.1|2.02742>|<point|5.5|2.02742>>|<line|<point|2.1|1.42742>|<point|5.5|1.42742>>|<arc|<point|2.1|2.02742>|<point|1.8|1.72742>|<point|2.1|1.42742>>|<line|<point|3.0|0.92742>|<point|6.4|0.92742>>|<line|<point|3.0|0.32742>|<point|6.4|0.32742>>|<arc|<point|3.0|0.92742>|<point|2.7|0.62742>|<point|3.0|0.32742>>|<with|arrow-end|\<gtr\>|<line|<point|-3|3>|<point|-4.5|3.0>|<point|-4.5|2.02742>>>|<with|arrow-end|\<gtr\>|<line|<point|-2|3>|<point|-1.0|3.0>|<point|-1.0|1.7>|<point|1.7|1.7>>>|<line|<point|0.5|2.5>|<point|0.5|1.8>>|<with|arrow-end|\<gtr\>|<line|<point|4.03728|3>|<point|6.0|3.0>|<point|6.0|0.92742>>>|<with|arrow-end|\<gtr\>|<line|<point|0.5|1.6>|<point|0.5|0.6>|<point|-1.5|0.6>>>|<line|<point|0.28901|-2.38505504528978>|<point|3.68901|-2.38505504528978>>|<text-at|set!
        <math|a1> balance to <math|$20>|<point|0.2207|-2.78505504528978>>|<line|<point|-6.2|-0.8>|<point|-3.4|-0.8>>|<line|<point|-6.2|-0.2>|<point|-3.4|-0.2>>|<text-at|<math|a3>
        new value: <math|30-10=20>|<point|2.23169|-3.82577>>|<arc|<point|6.4|-3.42577>|<point|6.7|-3.72577>|<point|6.4|-4.02577>>|<arc|<point|5.98901|-4.48505504528978>|<point|6.28901|-4.78505504528978>|<point|5.98901|-5.08505504528978>>|<text-at|set!
        <math|a3> balance to <math|$20>|<point|2.5207|-4.88505504528978>>|<line|<point|2.3|-3.42577>|<point|6.4|-3.42577>>|<line|<point|2.3|-4.02577>|<point|6.4|-4.02577>>|<arc|<point|2.3|-3.42577>|<point|2.0|-3.72577>|<point|2.3|-4.02577>>|<line|<point|2.58901|-4.48505504528978>|<point|5.98901|-4.48505504528978>>|<line|<point|2.58901|-5.08505504528978>|<point|5.98901|-5.08505504528978>>|<arc|<point|2.58901|-4.48505504528978>|<point|2.28901|-4.78505504528978>|<point|2.58901|-5.08505504528978>>|<with|arrow-end|\<gtr\>|<line|<point|2.3|-1.92577>|<point|2.3|-2.38505504528978>>>|<with|arrow-end|\<gtr\>|<line|<point|4.6|-4.02577>|<point|4.6|-4.48505504528978>>>|<carc|<point|-3.0|-4.0>|<point|-2.0|-4.0>|<point|-2.5|-3.5>>|<text-at|$20|<point|-2.77435758385107|-4.11995965074745>>|<with|arrow-end|\<gtr\>|<line|<point|1|-3>|<point|1.0|-4.0>|<point|-2.0|-4.0>>>|<text-at|$20|<point|3.22564241614893|-6.11995965074745>>|<carc|<point|3.0|-6.0>|<point|4.0|-6.0>|<point|3.5|-5.5>>|<with|arrow-end|\<gtr\>|<line|<point|4.6|-5.08506>|<point|4.6|-6.0>|<point|4.0|-6.0>>>|<arc|<point|-5.91099|-8.4850550452898>|<point|-6.21099|-8.7850550452898>|<point|-5.91099|-9.0850550452898>>|<line|<point|-5.91099|-9.0850550452898>|<point|-2.51099|-9.0850550452898>>|<arc|<point|-2.81099|-6.28505504528978>|<point|-3.11099|-6.58505504528978>|<point|-2.81099|-6.88505504528978>>|<arc|<point|-3.1|-5.22577>|<point|-3.4|-5.52577>|<point|-3.1|-5.82577>>|<line|<point|-5.91099|-8.4850550452898>|<point|-2.51099|-8.4850550452898>>|<line|<point|-2.81099|-6.88505504528978>|<point|0.58901|-6.88505504528978>>|<line|<point|-3.1|-5.82577>|<point|1.0|-5.82577>>|<line|<point|-2.81099|-6.28505504528978>|<point|0.58901|-6.28505504528978>>|<arc|<point|-6.2|-7.42577>|<point|-6.5|-7.72577>|<point|-6.2|-8.02577>>|<with|arrow-end|\<gtr\>|<line|<point|-4.3|-8.02577>|<point|-4.3|-8.4850550452898>>>|<line|<point|-3.1|-5.22577>|<point|1.0|-5.22577>>|<line|<point|-6.2|-8.02577>|<point|-2.1|-8.02577>>|<line|<point|-6.2|-7.42577>|<point|-2.1|-7.42577>>|<with|arrow-end|\<gtr\>|<line|<point|-0.8|-5.82577>|<point|-0.8|-6.28505504528978>>>|<arc|<point|-2.51099|-8.4850550452898>|<point|-2.21099|-8.7850550452898>|<point|-2.51099|-9.0850550452898>>|<text-at|set!
        <math|a1> balance to <math|$10>|<point|-5.9793|-8.8850550452898>>|<arc|<point|-2.1|-7.42577>|<point|-1.8|-7.72577>|<point|-2.1|-8.02577>>|<text-at|set!
        <math|a2> balance to <math|$30>|<point|-2.8793|-6.68505504528978>>|<arc|<point|0.58901|-6.28505504528978>|<point|0.88901|-6.58505504528978>|<point|0.58901|-6.88505504528978>>|<text-at|<math|a1>
        new value: <math|20-10=10>|<point|-6.26831|-7.82577>>|<arc|<point|1.0|-5.22577>|<point|1.3|-5.52577>|<point|1.0|-5.82577>>|<text-at|<math|a2>
        new value: <math|20+10=30>|<point|-3.16831|-5.62577>>|<text-at|$30|<point|0.22564241614893|-8.61995965074745>>|<carc|<point|-1.38777878078145e-17|-8.5>|<point|1.0|-8.5>|<point|0.5|-8.0>>|<with|arrow-end|\<gtr\>|<line|<point|-0.8|-6.88506>|<point|-0.8|-8.5>|<point|0.0|-8.5>>>|<text-at|$10|<point|-2.77435758385107|-10.6199596507474>>|<carc|<point|-3.0|-10.5>|<point|-2.0|-10.5>|<point|-2.5|-10.0>>|<with|arrow-end|\<gtr\>|<line|<point|-4.3|-9.0850550452898>|<point|-4.3|-10.5>|<point|-3.0|-10.5>>>|<with|line-width|3ln|arrow-end|\<gtr\>|<line|<point|-7|4>|<point|-7.0|-12.0>>>|<line|<point|-6.6|-0.5>|<point|-6.8|-0.499999999999999>>|<with|arrow-end|\<gtr\>|<line|<point|-2.5|0.32742>|<point|-2.5|-2.0>|<point|-4.0|-2.0>|<point|-4.0|-5.5>|<point|-3.5|-5.5>>>|<line|<point|-3.1|-0.5>|<point|-2.5|-0.5>>|<point|-6.8|-0.5>|<point|-2.5|-0.5>|<with|arrow-end|\<gtr\>|<line|<point|-6.6|1.7>|<point|-6.8|1.7>|<point|-6.8|-2.0>|<point|-5.5|-2.0>|<point|-5.5|-7.42577>>>|<with|arrow-end|\<gtr\>|<line|<point|2.4|1.42742>|<point|2.4|1.0>|<point|1.3|1.0>|<point|1.3|-1.32577>>>|<with|arrow-end|o|<line|<point|1.7|-0.5>|<point|1.3|-0.5>>>|<with|arrow-end|\<gtr\>|<line|<point|5.8|0.32742>|<point|5.8|-3.42577>>>|<with|arrow-end|o|<line|<point|5.1|-0.5>|<point|5.8|-0.5>>>>>|>
      </float> depicts an order of events where the <scm|balance>s of three
      account <math|a1>, <math|a2> and <math|a3> starts at <math|$10>,
      <math|$20> and <math|$30> respectively, Peter transfers <math|$10> from
      <math|a1> to <math|a2> exactly the same moment when Paul tries to
      transfer the same amount of money from <math|a3> to <math|a1> and, Paul
      completes his transaction just before Peter is able to complete the
      transfer.<new-line> <hspace|2ex>We see that the essential difference
      between the transfer operation here and the exchange operation above is
      that the amount of money been transferred between two account is
      specified by the account owner, which is irrelevant with the account
      balances involved, whereas the exchange operation swaps balances in two
      account based on their difference, whose value is highly hinged on the
      current balances of the accounts. This indicates that the transfer
      problem here is free from the consistency problem related to the
      account status, while the exchange problem above is
      inconsistency-prone, as we saw in exercise 3.43.
    </answer>
  </render-exercise>
</body>

<\initial>
  <\collection>
    <associate|font-base-size|11>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|Exercise_3.44-Figure_1|<tuple|1|?>>
    <associate|auto-1|<tuple|1|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal||<pageref|auto-1>>
    </associate>
  </collection>
</auxiliary>