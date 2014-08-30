<TeXmacs|1.99.1>

<style|<tuple|generic|compact-list>>

<\body>
  <\hide-preamble>
    \;

    <assign|item|<macro|<next-item><render-item|<the-item>>>>

    <assign|itemize-dot|<\macro|body>
      <list|<macro|name|<aligned-item|<arg|name>
      \ >>|<macro|name|<with|mode|math|\<bullet\>>>|<arg|body>>
    </macro>>
  </hide-preamble>

  <\render-exercise|Exercise 5.12>
    \;

    The simulator can be used to help determine the data paths required for
    implementing a machine with a given controller. Extend the assembler to
    store the following information in the machine model:

    <math|\<bullet\>> a list of all instructions, with duplicates removed,
    sorted by instruction type (<scm|assign>, <scm|goto>, and so on);

    <math|\<bullet\>> a list (without duplicates) of registers used to hold
    entry points (these are the registers referenced by <scm|goto>
    instructions);

    <math|\<bullet\>> a list (without duplicates) of the registers that are
    <scm|save>d or <scm|restore>d;

    <math|\<bullet\>> for each register, a list (without duplicates) of the
    sources from which it is assigned (for example, the sources for register
    <scm|val> in the factorial machine of figure 5.11 are <scm|(const 1)> and
    <scm|((op *) (reg n) (reg val))>).

    Extend the message-passing interface to the machine to provide access to
    this new information. To test your analyzer, define the Fibbonacci
    machine from figure 5.12 and examine the lists you constructed.

    <\answer>
      \;

      \;
    </answer>
  </render-exercise>
</body>

<\initial>
  <\collection>
    <associate|exercise-indentation|0tab>
    <associate|font-base-size|12>
  </collection>
</initial>