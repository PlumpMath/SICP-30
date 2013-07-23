<TeXmacs|1.0.7.19>

<style|generic>

<\body>
  <\render-exercise|Exercise 2.64>
    \;

    The following procedure <scm|list-\<gtr\>tree> converts an ordered list
    to a balanced binary tree. The helper procedure <scm|partial-tree> takes
    as arguments an integer <math|n> and list of at least <math|n> elements
    and constructs a balanced tree containing the first <math|n> elements of
    the list. The result returned by <scm|partial-tree> is a pair (formed
    with <scm|cons>) whose <scm|car> is the constructed tree and whose
    <scm|cdr> is the list of elements not included in the tree.

    <\scm-code>
      (define (list-\<gtr\>tree elements)

      \ \ (car (partial-tree elements (length elements))))
    </scm-code>

    <\scm-code>
      (define (partial-tree elts n)

      \ \ (if (= n 0)

      \ \ \ \ \ \ (cons '() elts)

      \ \ \ \ \ \ (let ((left-size (quotient (- n 1) 2)))

      \ \ \ \ \ \ \ \ (let ((left-result (partial-tree elts left-size)))

      \ \ \ \ \ \ \ \ \ \ (let ((left-tree (car left-result))

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (non-left-elts (cdr left-result))

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (right-size (- n (+ left-size 1))))

      \ \ \ \ \ \ \ \ \ \ \ \ (let ((this-entry (car non-left-elts))

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (right-result (partial-tree (cdr
      non-left-elts)

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ right-size)))

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ (let ((right-tree (car right-result))

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (remaining-elts (cdr
      right-result)))

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (cons (make-tree this-entry left-tree
      right-tree)

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ remaining-elts))))))))
    </scm-code>

    a. Write a short paragraph explaining as clearly as you can how
    <scm|partial-tree> works. Draw the tree produced by
    <scm|list-\<gtr\>tree> for the list <scm|(1 3 5 7 9 11)>.

    b. What is the order of growth in the number of steps required by
    <scm|list-\<gtr\>tree> to convert a list of <math|n> elements?

    <\answer>
      \;

      a. The <scm|partial-tree> procedure works as follows:

      <hspace|3ex><math|\<bullet\>> If the number of elements is <math|0>,
      return a pair whos<strong|>e <scm|car> is <scm|nil> and whose <scm|cdr>
      is the original list.

      <hspace|3ex><math|\<bullet\>> Otherwise, we first seperate the first
      <math|<frac|n-1|2>> elements from the rest to construct the left
      balanced subtree and pick the entry element. Then devide elements of
      its right part from those remainings to build the right balanced
      subtree. Finally, we return a pair whose <scm|car> is the balanced
      binary tree we just built and whose <scm|cdr> is a list containing the
      remaining elements.

      Figure <reference|Exercise_2.64-Figure_1> shows the tree produced by
      <scm|list-\<gtr\>tree> for the list <scm|(1 3 5 7 9 11)>.

      <\big-figure>
        <label|Exercise_2.64-Figure_1><math|<tree|5|<tree|1|<scm|'()>|3>|<tree|9|7|11>>>
        </big-figure|The tree produced by <scm|list-\<gtr\>tree> for the list
      <scm|(1 3 5 7 9 11)>.>

      b. Note that what we are about to build is a balanced binary tree, so
      each of these subtrees will be about half the size of the original.
      Thus, in one step we habe reduced the problem of building a tree of
      size <math|n> to build a tree of size <math|<frac*|n|2>>. Since the
      number of steps needed to search a tree of size <math|n> grows as
      <math|\<Theta\> <around*|(|log n|)>>.\ 
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
    <associate|Exercise_2.64-Figure_1|<tuple|1|?>>
    <associate|auto-1|<tuple|1|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal||<pageref|auto-1>>
    </associate>
  </collection>
</auxiliary>