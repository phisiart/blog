---
layout: post
title: "By Induction on the Derivation of..."
comments: true
categories: 
---

We all (hopefully) have seen mathematical induction in high school (or junior high school).
By having a base case and an inductive step, we can prove that a theorem which involves a natural number holds
for any natural number.

Here's a typical example.

**Theorem**: Let $$s_n = \sum_{i = 0}^{n} i$$,
then $$s_n = n(n+1)/2$$.

**Proof**: By induction on $$n$$.

* **Base case**: Suppose $$n = 0$$.
  Then
  
  $$
  \begin{split}
  s_n &= s_0 = 0 \\
      &= \frac{0 (0 + 1)}{2} \\
      &= \frac{n (n + 1)}{2}
  \end{split}
  $$

* **Inductive step**: Suppose the theorem holds for $$n = k \geq 0$$, we need to show that it also holds for $$n = k + 1$$.
  
  By induction hypothesis, we are given $$s_k = k (k + 1) / 2$$.

  Therefore,
  
  $$
  \begin{split}
  s_{k + 1} &= s_k + (k + 1) \\
            &= \frac{k (k + 1)}{2} + (k + 1) \\
            &= \frac{(k + 1) (k + 2)}{2} \\
            &= \frac{(k + 1) ((k + 1) + 1)}{2}
  \end{split}
  $$

Q.E.D.

The key of success is that $$s_{n}$$ is inductively / recursively defined.
The relation $$s_{n+1} = s_n + (n+1)$$ allows us to build up a solution to a bigger problem from a solution to a smaller one.

A lot of things are defined in this way.
We might want to expand mathematical induction to build up a mechanism of inductive reasoning on other kinds of objects.

## 1. Definition of Natural Numbers

We use the following two inference rules to inductively define natural numbers.

<center>
<img src="{{ site.baseurl }}/images/nat-def.svg">
</center>

First, notation. A rule always has a horizontal bar. Anything on top of the bar (there could be 0 or more) is called a **premise**. The thing below the bar (there could only be exactly one) is called the
**conclusion**. A **rule name** can be given on the right of the bar.

The meaning of the above two rules is as follows:

* Rule $$\texttt{nat} I_0$$ (natural number introduction rule - 0 case) says that there is a thing called $$0$$ that is a natural number. This does not depend on any premise.

* Rule $$\texttt{nat} I_s$$ (natural number introduction rule - successor case) says that if we somehow "know" that $$N$$ is a natural number, then we can safely claim that $$s(N)$$, the "successor" of $$N$$, is also a natural number.

Given these two rules, we can already prove some interesting results.
For example, we can prove that $$s(s(s(0)))$$ (what we call "3" in our daily life) is a natural number:

<center>
<img src="{{ site.baseurl }}/images/sss0-nat.svg">
</center>

Note that I've put quotes on the word "know". What do we mean by saying we know something?

It turns out that in the verificationist's view, which we will take,
to say something is true is to say we have a proof of it.
The proof must be in the form of using a given set of rules (like the two rules in our example).

Think about it in this way: suppose I am a function that is capable of doing something on a term $$N$$.
However, I am desperately dependent on the fact that $$N$$ is a natural number.
That is, I need to take in a argument that somehow encodes the fact that $$N$$ is a natural number, and use it.

The verificationist's view says that my argument must contain the proof,
because to say something is true is to present a proof. It is meaningless to just "point out" the truth.

## 2. Structural Induction

The verificationist's view gives us a strong tool of proving things: structural induction. Let's see an example.

We know that natural numbers can be even or odd. Let's define them using the following rules:

<center>
<img src="{{ site.baseurl }}/images/even-odd.svg">
</center>

Now, an interesting theorem might be:
If $$N : \texttt{nat}$$, then either $$\texttt{even}(N)$$ or $$\texttt{odd}(N)$$.

Note that this theorem is extremely powerful. It isn't limited to a finite set of natural numbers,
it works on all natural numbers. How do we even prove this?

Recall that in the verificationist's view, a proof is the only way of convincing us that something is true.
Therefore, we must provide a proof for either $$\texttt{even}(N)$$ or $$\texttt{odd}(N)$$, "given the fact"
that $$N : \texttt{nat}$$.

However, by "given the fact", we are promised that we will be provided with a proof for $$N : \texttt{nat}$$.

Therefore, our task becomes:

* Construct a transformation from a proof of $$N : \texttt{nat}$$, to a proof of either $$\texttt{even}(N)$$ or $$\texttt{odd}(N)$$.

Now, if we look very hard at the definition of $$N : \texttt{nat}$$, we can see that it is recursive.
It is then very natural to think that our transformation function might be recursive too, which is acturally the case.

Suppose we are given a proof of $$N : \texttt{nat}$$, then what could possibly the last step of it? There can only be two cases:

1. The last step is
   <center>
   <img src="{{ site.baseurl }}/images/nat-I0.svg">
   </center>
   and $$N = 0$$;

1. The last step is
   <center>
   <img src="{{ site.baseurl }}/images/nat-Is-2.svg">
   </center>
   and $$N = s(N')$$.

If we have case 1, then we can use the rule $$\texttt{even}I_0$$ to construct a
proof for $$\texttt{even}(0)$$, which is just $$\texttt{even}(N)$$.
This is the easy case.

If we have case 2, things get a little bit tricky. We seem to only have access to the last step of the proof.
However, with the power of recursion, we can still tackle this case.

We pass $$N'$$ as argument, and call our transformation function recursively, which will give us a proof of
either $$\texttt{even}(N')$$ or $$\texttt{odd}(N')$$.

If we have got $$\texttt{even}(N')$$, then by using $$\texttt{odd} I_s$$, we get $$\texttt{odd}(N)$$;

If we have got $$\texttt{odd}(N')$$, then by using $$\texttt{even} I_s$$, we get $$\texttt{even}(N)$$.

With that in mind, let's show the complete, formal proof:

## 3. The Complete Proof

By induction on the derivation of $$N : \texttt{nat}$$.

* Case: Suppose the last step is
  <center>
  <img src="{{ site.baseurl }}/images/nat-I0.svg">
  </center>
  
  We get $$N = 0$$.

  By $$\texttt{even}I_0$$, we get $$\texttt{even}(0)$$, which is just $$\texttt{even}(N)$$.

* Case: Suppose the last step is
  <center>
  <img src="{{ site.baseurl }}/images/nat-Is-2.svg">
  </center>
  
  We get $$N = s(N')$$.

  By induction hypothesis, either $$\texttt{even}(N')$$ or $$\texttt{odd}(N')$$.

  * If $$\texttt{even}(N')$$, by $$\texttt{odd}I_s$$, we get $$\texttt{odd}(s(N'))$$, which is just $$\texttt{odd}(N)$$.

  * If $$\texttt{odd}(N')$$, by $$\texttt{even} I_s$$, we get $$\texttt{even}(s(N'))$$, which is just $$\texttt{even}(N)$$.


## 4. Addition

Note that our "even or odd theorem" still involves a single natural number. The proof doesn't differ
too much from a mathematical induction proof. Now let's add some new tastes to our natural numbers,
and try to prove something more complicated.

Let's define addition of two natural numbers as follows.
We'll use $$\texttt{plus}(M, N, P)$$ to denote $$M + N = P$$.


<center>
<img src="{{ site.baseurl }}/images/plus-def.svg">
</center>

### Lemma 1: For any $$N$$, if $$N : \texttt{nat}$$, then $$\texttt{plus}(N, 0, N)$$.

**Proof of Lemma 1:**

By induction on the derivation of $$N : \texttt{nat}$$.

* Case: suppose the last rule is
  <center>
  <img src="{{ site.baseurl }}/images/nat-I0.svg">
  </center>

  We get $$N = 0$$.

  By $$\texttt{plus}I_0$$, we get $$\texttt{plus}(0, 0, 0)$$, which is just $$\texttt{plus}(N, 0, N)$$.

* Case: suppose the last rule is
  <center>
  <img src="{{ site.baseurl }}/images/nat-Is-2.svg">
  </center>

  We get $$N = s(N')$$.

  By induction hypothesis, we get $$\texttt{plus}(N', 0, N')$$.

  By $$\texttt{plus}I_s$$, we get $$\texttt{plus}(s(N'), 0, s(N'))$$, which is just $$\texttt{plus}(N, 0, N)$$.

### Lemma 2: For any $$N$$, if $$\texttt{plus}(M, N, P)$$, then $$\texttt{plus}(M, s(N), s(P))$$.

**Proof of Lemma 2:**

By induction on the derivation of $$\texttt{plus}(M, N, P)$$.

* Case: suppose the last rule is
  <center>
  <img src="{{ site.baseurl }}/images/plus-I0.svg">
  </center>

  We get $$M = 0$$, and $$P = 0$$, and $$N : \texttt{nat}$$.

  By $$\texttt{nat}I_s$$, we get $$s(N) : \texttt{nat}$$.

  By $$\texttt{plus}I_0$$, we get $$\texttt{plus}(0, s(N), s(N))$$, which is just $$\texttt{plus}(M, s(N), s(P))$$.

* Case: suppose the last rule is
  <center>
  <img src="{{ site.baseurl }}/images/plus-Is-2.svg">
  </center>

  We get $$M = s(M')$$, and $$P = s(P')$$, and $$\texttt{plus}(M', N, P')$$.

  By induction hypothesis, we get $$\texttt{plus}(M', s(N), P')$$.

  By $$\texttt{plus}I_s$$, we get $$\texttt{plus}(s(M'), s(N), s(P'))$$, which is just $$\texttt{plus}(M, s(N), s(P))$$.

### Theorem 3 (Commutative Property of Addition): For any $$M$$, $$N$$, and $$P$$, if $$\texttt{plus}(M, N, P)$$, then $$\texttt{plus}(N, M, P)$$.

**Proof of Theorem 3:**

By induction on the derivation of $$\texttt{plus}(M, N, P)$$.

* Case: suppose the last rule is
  <center>
  <img src="{{ site.baseurl }}/images/plus-I0.svg">
  </center>

  We get $$M = 0$$, and $$P = 0$$, and $$N : \texttt{nat}$$.

  By Lemma 1, we get $$\texttt{plus}(N, 0, N)$$, which is just $$\texttt{plus}(N, M, P)$$.

* Case: suppose the last rule is
  <center>
  <img src="{{ site.baseurl }}/images/plus-Is-2.svg">
  </center>

  We get $$M = s(M')$$, and $$P = s(P')$$, and $$\texttt{plus}(M', N, P')$$.

  By induction hypothesis, we get $$\texttt{plus}(N, M', P')$$.

  By Lemma 2, we get $$\texttt{plus}(N, s(M'), s(P'))$$, which is just $$\texttt{plus}(N, M, P)$$.

## Read More
* 15-317: Constructive Logic. Lecture Notes on Natural Numbers.
  
  [http://symbolaris.com/course/constlog16/06-nat.pdf](http://symbolaris.com/course/constlog16/06-nat.pdf)

* Wikipedia. Structural Induction.

  [https://en.wikipedia.org/wiki/Structural_induction](https://en.wikipedia.org/wiki/Structural_induction)

* Practical Foundations for Programming Languages. Chapter 2: Inductive Definitions.

  [http://www.cs.cmu.edu/~rwh/pfpl.html](http://www.cs.cmu.edu/~rwh/pfpl.html)

