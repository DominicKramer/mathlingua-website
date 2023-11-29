# The Mathlingua Language

Mathlingua is a declarative language designed to precisely and concisely describe statements of mathematical definitions, axioms, theorems, and conjectures, such that anyone familiar with reading and writing mathematical literature can easily learn to read and write Mathlingua text, and content written in Mathlingua has automated checks such as (but not limited to):

* no definition or symbol is used that is not unknown
* no duplicate definitions occur
* no definition is used incorrectly (i.e. the inputs to any definition used are of the correct count and type)
* no statement is ambiguous (i.e. text such as $a * b$ where the meaning of $*$ cannot be determined is not allowed)

## Why is it needed?

When learning mathematics, books, articles, and encyclopediae can be a great resources that are generally easy to read and write.  Sometimes though, the content in these resources can be informal and sometimes ambiguous when the meaning of some symbols need to be implied by the context.

Next, proof assistants such as Lean, Coq, Isabelle, and others are very formal but have a very steep learning curve and, although they can be used to write proofs that can be verified by computer, can be very difficult to read and write.

Mathlingua aims to take the best of both approaches.  In particular, it is designed to be easy to read and write, be precise and concise, and allow proofs to be expresed, with some checks done.  The language isn't rigid enough to allow proofs to be automatically verified by the system, but has enough structure to allow people to write proofs that can have the checks mentioned above automatically performed so that humans can focus on checking the logic of the proof.

## What is the purpose of the language?

The Mathlingua language is designed to create [Mathlore](./mathlore.md), a free and open knowledgebase of mathematical knowledge to allow anyone access to precise mathematical knowledge.

## What does it look like?

To get a feel for the language, the following is a definition of a *prime integer*:

```yaml
[\prime.integer]
Describes: p
extends: 'p is \integer'
satisfies:
. 'p != 1'
. not:
  . exists: a, b
    where: 'a, b is \integer'
    suchThat:
    . 'a != 1'
    . 'b != 1'
    . 'p = a * b'
Documented:
. called: "prime natural number"
```
that is *rendered* as:

<span class='mlg-box'>
<span class='mlg-id'>[\prime.integer]</span><br/>
<span class='mlg-header'>Describes:</span> $p$<br/>
<span class='mlg-header'>extends:</span> $p$ is integer<br/>
<span class='mlg-header'>satisfies:</span><br/>
&centerdot;&nbsp;$p \neq 1$<br/>
&centerdot;&nbsp;<span class='mlg-header'>not:</span><br/>
&nbsp;&nbsp;. <span class='mlg-header'>exists:</span> $a, b$<br/>
&nbsp;&nbsp;&nbsp;&nbsp;<span class='mlg-header'>where:</span> $a, b$ is integer<br/>
&nbsp;&nbsp;&nbsp;&nbsp;<span class='mlg-header'>suchThat:</span><br/>
&nbsp;&nbsp;&nbsp;&nbsp;. $a \neq 1$<br/>
&nbsp;&nbsp;&nbsp;&nbsp;. $b \neq 1$<br/>
&nbsp;&nbsp;&nbsp;&nbsp;. $p = ab$<br/>
<span class='mlg-header'>Documented:</span><br/>
&centerdot;&nbsp;<span class='mlg-header'>called:</span> prime natural number<br/>
</span>

Next, the following is an example of a theorem:

```yaml
[\euclids.lemma]
Theorem:
given: p, a, b
where:
. 'p is \prime.integer'
. 'a, b is \integer'
if: 'p | a * b'               (1)
then:
. anyOf:
  . 'p | a'
  . 'p | b'
Documented:
. called: "Euclid's Lemma"
Proof:
. withoutLossOfGenerality:
  . suppose: 'p \coprime.to/ a'
    then:
    . sequentially:
      . notice:
        . exists: r, s
          where: 'r, s is \integer'
          suchThat: 'r*p + s*a = 1'
        by: '\bezouts.lemma'
      . hence: 'r*p*b + s*a*b = b'              (2)
        because: "multiply both sides by $b$"
      . notice: 'p | r*p*b'
      . next: 'p | s*a*b'
        by: '\(1)'
        because: 'p | a * b'
      . thus: 'p | r*p*b + s*a*b'
      . hence: 'p | b'
        by: '\(2)'
      . qed:
```

Note that the name `\prime.integer` uses the `.` character to specify that the *prime* being described is a prime *integer*.  For a prime element in an arbitrary *commutative algebra*, a different definition would be created, perhaps called `\prime.element:of{A}` that specifies that `A` must be a `\commutative.algebra`.

Next, the definition describes how a prime integer is related to an integer by stating that it *extends* an integer.  That is, a prime integer is an integer with additional properties.  

Although not shown here, Mathlingua also allows one to describe that something can be *viewed as* something else, perhaps through a morphism.

Further, not only is the precise mathematical statement of the definition and theorem expressed, but further information, such as what the items are called, is encoded.

Although not shown here, Mathlingua allows for describing a much larger assortment of knowledge associated with a mathematical item, such as how a symbol or expression is written, the item's history, discoverer(s), importance, informal description, references, relationship to other mathematical concepts, etc. in not only English but in any other written language.
