# The Mathlingua Language

Mathlingua is a declarative language designed to precisely and concisely describe statements of mathematical definitions, axioms, theorems, and conjectures, such that anyone familiar with reading and writing mathematical literature can easily learn to read and write Mathlingua text.

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

and the following is an example of a theorem:

```yaml
[\euclids.lemma]
Theorem:
given: p, a, b
where:
. 'p is \prime.integer'
. 'a, b is \integer'
if: 'p \divides/ a * b'
then:
. oneOf:
  . 'p \divides/ a'
  . 'p \divides/ b'
Documented:
. called: "Euclid's Lemma"
Proof:
. "Suppose $a$ and $n$ are coprime.  Then by {{\bezouts.lemma}}
   there exists $r$ and $s$ such that {{r,s is \integer}}
   \[
     rn + sa = 1
   \]
   Next, multiply by $b$ to obtain
   \[
     rnb + sab = b
   \]
   and notice $n | rnb$ and, since $n | ab$, that $n | sab$.
   Hence $n$ divides $rnb + sab = b$."
```

The above is the source code for the items that are *rendered* as:

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

and

<span class='mlg-box'>
<span class='mlg-title'>Euclid's Lemma</span>
<span class='mlg-header'>Theorem:</span><br/>
<span class='mlg-header'>given:</span> $p, a, b$<br/>
<span class='mlg-header'>where:</span><br/>
&centerdot;&nbsp;$p$ is prime integer<br/>
&centerdot;&nbsp;$a, b$ is integer<br/>
<span class='mlg-header'>if:</span> $p | ab$<br/>
<span class='mlg-header'>then:</span><br/>
&centerdot;&nbsp;<span class='mlg-header'>oneOf:</span><br/>
&nbsp;&nbsp;&centerdot;&nbsp;$p | a$<br/>
&nbsp;&nbsp;&centerdot;&nbsp;$p | b$<br/>
</span>
<span class='mlg-proof-box'>
<span class='mlg-header'>Proof</span><br/>
   Suppose $a$ and $n$ are coprime.  Then by *Bezout's Lemma*<br/>
   there exists $r$ and $s$ such that $r$, $s$ is *integer*<br/>
   $$
     rn + sa = 1
   $$
   Next, multiply by $b$ to obtain<br/>
   $$
     rnb + sab = b
   $$
   and notice $n | rnb$ and, since $n | ab$, that $n | sab$.  Hence <br/>
   $n$ divides $rnb + sab = b$. $\square$<br/>
</span>

Note that the name `\prime.integer` uses the `.` character to specify that the *prime* being described is a prime *integer*.  For a prime element in an arbitrary *commutative algebra*, a different definition would be created, perhaps called `\prime.element:of{A}` that specifies that `A` must be a `\commutative.algebra`.

Next, the definition describes how a prime integer is related to an integer by stating that it *extends* an integer.  That is, a prime integer is an integer with additional properties.  

Although not shown here, Mathlingua also allows one to describe that something can be *viewed as* something else, perhaps through a morphism.

Further, not only is the precise mathematical statement of the definition and theorem expressed, but further information, such as what the items are called, is encoded.

Although not shown here, Mathlingua allows for describing a much larger assortment of knowledge associated with a mathematical item, such as how a symbol or expression is written (i.e. `a \divides/ b` is written as $a | b$), the item's history, discoverer(s), importance, informal description, references, relationship to other mathematical concepts, etc. in not only English but in any other written language.

The purpose of Mathlingua is to express all information associated with a mathematical definition, axiom, conjecture, or theorem.

Last note that the proof of the theorem is be written in LaTeX where the `{{...}}` syntax is used to reference definitions.  That is, the definition and theorem *statements* are required to be written in Mathlingua, but the proof can be written in LaTeX.

## What is the purpose of the language?

The Mathlingua language is designed to create [Mathlore](./mathlore.md), a knowledgebase of all mathematical knowledge in a format that is easy for math enthusiasts to read and write, where automatic checks of the knwledgebase can be performed that verify, for example:

* no definition or symbol is used that is not specified in the knowledgebase
* no duplicate definitions occur
* no definition is used incorrectly (i.e. the inputs to any definition used are of the correct count and type)
* no statement is ambiguous (i.e. text such as $a * b$ where the meaning of $*$ cannot be determined is not allowed)

> Note: Mathlore is still under development and has not been released yet.

# In progess

This document and Mathlingua is still progress.  Check back often for the addition of information including, but not limited to, why Mathlingua is needed when LaTeX, MathML, etc. (as well as theorem provers like Lean, Coq, etc.) already exist, how does Mathlingua improve the mathematics ecosystem, how does Mathlingua relate to Large Language Models, and much more.
