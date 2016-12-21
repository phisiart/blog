---
layout: post
title: "By Induction on the Derivation of..."
comments: true
categories: 
---

## 1. Natural Numbers

We use the following two rules to inductively define natural numbers.

<center>
<img src="{{ site.baseurl }}/images/nat-def.svg">
</center>

The first rule says that there is a thing called $$0$$ that is a natural number.

The second rule says that if we somehow "know" that $$N$$ is a natural number,
then we can safely claim that $$s(N)$$, the "successor" of $$N$$, is also a natural number.

Given these two rules, we can already prove some interesting results.
For example, we can prove that $$s(s(s(0)))$$ is a natural number:

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

## The Complete Proof

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


## Addition
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