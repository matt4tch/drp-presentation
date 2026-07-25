#strong[Problem.]
Let $d = upright(d)/(upright(d) x)$, and let $f in C^infinity (bb(R))$. Suppose that for every $x in bb(R)$, the limit
$
  g(x) := lim_(n -> infinity) d^n f(x) = lim_(n -> infinity) f^((n))(x)
$
exists. We want to show that $g$ is differentiable, and in fact satisfies $g'=g$.

#strong[Theorem 1.]
Let $f in C^infinity (bb(R))$. Define
$
  M(x):=sup{abs(f^((k))(x)) bar.v k>=0}
$
and assume that for each $x in bb(R)$, $M(x)<infinity$. Then $f$ is real analytic with infinite radius of convergence. \
#strong[Proof:]
Suppose this is not the case. Let $X$ denote the set of real numbers $x$ for which there does not exist any entire function that agrees with $f$ on a neighbourhood of $x$. If $X=emptyset$, then every point has a neighbourhood on which $f$ agrees with some entire function. These entire functions agree on overlaps by analytic continuation, and hence glue to a single entire function agreeing with $f$ on all of $bb(R)$, contradicting our assumption. Therefore $X$ is non-empty. \
*Claim:* $X$ is closed.\
*Proof:* Let $(x_n) subset.eq X$. Suppose $x_n -> x in.not X$. Then there exists a neighbourhood $U subset.eq bb(R)$ of $x$, such that there exists an entire $g$ that agrees with $f$ on $U$. But $x_n->x$, so $x_N in U$ for some $N in bb(N)$. But $U$ is a neighbourhood of $x_N$, on which entire function $g$ agrees with $f$, yet $x_N in X$, so such a neighbourhood cannot exist. Therefore, $x in X$, so $X$ is closed. $square$

Now define $S_n:={x in bb(R) | M(x) <= n}$. Then,
$
  S_n & = {x in bb(R) | f^((k)) (x) in [-n, n] space forall k >= 0} \
      & = inter.big_(k >= 0) ((upright(d)^k f)/(upright(d) x^k))^(-1) ([-n,n])
$
Hence each $S_n$ is closed. Also note that
$ bb(R) = union.big_(n in bb(N)) S_n $
So
$
  X = union.big_(n in bb(N)) (S_n inter X)
$
Since $X$ is closed in $bb(R)$, it is complete in the induced metric. Since $X$ is also non-empty, then by BCT, we have that there exists an $N in bb(N)$ with $S_N inter X$ having non-empty interior relative to $X$. In other words, there exist $a,b in bb(R)$ with $a < b$ such that
$
  emptyset != (a,b) inter X subset.eq S_N inter X
$

If $(a,b) \\ X=emptyset$, then $(a,b) subset.eq X subset.eq S_N$. Hence
$
  abs(f^((m))(x)) <= N
$
for all $x in (a,b)$ and all $m >= 0$. The Taylor argument below then shows that every $x_0 in (a,b)$ has a neighbourhood on which $f$ agrees with an entire function, contradicting $(a,b) subset.eq X$. Thus $(a,b) \\ X$ is non-empty.

Now let $(c,e)$ be a maximal interval in the open set $(a,b) \\ X$. Since $(c,e) subset.eq (a,b) \\ X$, for every $x in (c,e)$ there is some neighbourhood of $x$ on which $f$ agrees with an entire function. By analytic continuation, these entire functions agree on overlaps, and hence $f$ agrees with a single entire function $F$ on all of $(c,e)$.

*Claim:* At least one endpoint of $(c,e)$ lies in $(a,b) inter X$.\
*Proof:* Suppose first that $c in (a,b)$. If $c in.not X$, then $c in (a,b) \\ X$. But $(a,b) \\ X$ is open, so there exists a neighbourhood of $c$ contained in $(a,b) \\ X$. This would allow us to extend $(c,e)$ to the left, contradicting the maximality of $(c,e)$. Hence, if $c in (a,b)$, then $c in X$. Similarly, if $e in (a,b)$, then $e in X$.

Now if neither endpoint of $(c,e)$ lies in $(a,b)$, then $(c,e)=(a,b)$. But this is impossible, since $(a,b) inter X != emptyset$. Therefore at least one endpoint of $(c,e)$ lies in $(a,b) inter X$. $square$

The argument below treats the case $c in (a,b) inter X$. If instead $e in (a,b) inter X$, the same argument works with $e$ in place of $c$, expanding around $e$ and using $x -> c^+$ at the end. Since $(a,b) inter X subset.eq S_N$, we have $c in S_N$, and so
$
  abs(f^((m))(c)) <= N
$
for all $m >= 0$.

Since $F|_((c,e))=f|_((c,e))$ and both functions are $C^infinity$ there, we have $F^((r))|_((c,e))=f^((r))|_((c,e))$ for every $r >= 0$. Therefore, using continuity of $F^((r))$ and $f^((r))$,
$
  F^((r))(c) = lim_(x -> c^+) F^((r))(x) = lim_(x -> c^+) f^((r))(x) = f^((r))(c)
$

Now let $x in (c,e)$. Since $F$ is entire, Taylor expansion of $F^((m))$ around $c$ gives, for each $m >= 0$,
$
  f^((m))(x) = F^((m))(x) = sum_(j=0)^infinity (F^((m+j))(c))/(j!) (x-c)^j = sum_(j=0)^infinity (f^((m+j))(c))/(j!) (x-c)^j
$
Thus,
$
  abs(f^((m))(x)) & <= sum_(j=0)^infinity abs(f^((m+j))(c))/(j!) abs(x-c)^j \
                  & <= sum_(j=0)^infinity N/(j!) abs(x-c)^j \
                  & <= sum_(j=0)^infinity N/(j!) (b-a)^j \
                  & = N exp(b-a)
$
for all $m >= 0$ and all $x in (c,e)$. Since $f in C^infinity (bb(R))$, each $f^((m))$ is continuous, so letting $x -> e^-$ gives
$
  abs(f^((m))(e)) <= N exp(b-a)
$
for all $m >= 0$. Hence the bound holds for all $m >= 0$ and all $x in [c,e]$.

Now let $(c,e)$ vary over all maximal intervals in $(a,b) \\ X$. If $x in (a,b) \\ X$, then $x$ lies in one such interval, and the above argument gives
$
  abs(f^((m))(x)) <= N exp(b-a)
$
for all $m >= 0$. On the other hand, if $x in (a,b) inter X$, then $x in S_N$, and so
$
  abs(f^((m))(x)) <= N <= N exp(b-a)
$
for all $m >= 0$. Hence
$
  abs(f^((m))(x)) <= N exp(b-a)
$
for all $x in (a,b)$ and all $m >= 0$.

We now show that $f$ is real analytic on $(a,b)$. Let $x_0 in (a,b)$, and choose $r > 0$ such that $(x_0-r,x_0+r) subset.eq (a,b)$. For $x in (x_0-r,x_0+r)$ and $K >= 0$, Taylor's theorem with remainder gives
$
  f(x) = sum_(j=0)^K (f^((j))(x_0))/(j!) (x-x_0)^j + (f^((K+1))(xi))/((K+1)!) (x-x_0)^(K+1)
$
for some $xi$ between $x$ and $x_0$. Therefore,
$
  abs(f(x) - sum_(j=0)^K (f^((j))(x_0))/(j!) (x-x_0)^j) & <= (N exp(b-a))/((K+1)!) abs(x-x_0)^(K+1)
$
Letting $K -> infinity$, the right hand side goes to $0$. Hence $f$ agrees with its Taylor series on $(x_0-r,x_0+r)$. Since $x_0 in (a,b)$ was arbitrary, $f$ is real analytic on $(a,b)$.

Moreover, the same bound shows that this Taylor series has infinite radius of convergence. Indeed, for every $z in bb(C)$,
$
  sum_(j=0)^infinity abs((f^((j))(x_0))/(j!) (z-x_0)^j)
  <= sum_(j=0)^infinity (N exp(b-a))/(j!) abs(z-x_0)^j
  = N exp(b-a) exp(abs(z-x_0)) < infinity
$
Thus the Taylor series at $x_0$ defines an entire function which agrees with $f$ on a neighbourhood of $x_0$. Hence $x_0 in.not X$. Since $x_0 in (a,b)$ was arbitrary, $(a,b) inter X = emptyset$. This contradicts $(a,b) inter X != emptyset$.

Therefore our supposition was false, so $X=emptyset$. Hence every point has a neighbourhood on which $f$ agrees with an entire function. By analytic continuation, these local entire functions agree on overlaps and glue to a single entire function whose restriction to $bb(R)$ is $f$. Therefore $f$ is real analytic with infinite radius of convergence.

$square$


#strong[Application to the problem.]
Assume that $f in C^infinity (bb(R))$ and that
$
  g(x) := lim_(n -> infinity) f^((n))(x)
$
exists for every $x in bb(R)$. Then for each fixed $x$, the sequence $(f^((n))(x))_(n >= 0)$ is convergent, hence bounded. Therefore the hypotheses of Theorem 1 are satisfied, so $f$ is the restriction of an entire function.

Indeed, for each $x in bb(R)$, set
$
  M(x) := sup_(n >= 0) abs(f^((n))(x)).
$
This quantity is finite because $(f^((n))(x))_(n >= 0)$ converges.

For all $k>=0$ and $x in bb(R)$ we have
$
  abs(f^((k))(x)) & = abs(sum_(n=0)^infinity (f^((n+k))(0))/n!x^n) \
                  & <= sum_(n=0)^infinity abs((f^((n+k))(0))/n!x^n) \
                  & = sum_(n=0)^infinity abs(f^((n+k))(0))/n!abs(x)^n \
                  & <= sum_(n=0)^infinity M(0)/n!abs(x)^n \
                  & = M(0)e^abs(x) space (2)
$

Let $a,b in bb(R)$. By Fundamental Theorem of Calculus, we have

$
  f^((n)) (a) - f^((n)) (b) = integral_b^a f^((n+1)) (x) upright(d) x
$
Taking $n -> infinity$, and by (2), we can apply Lebesgue's Dominated Convergence Theorem to obtain

$
  g(a)-g(b) = integral_b^a g(x) upright(d) x
$
and hence
$
  abs(g(a)-g(b)) & = abs(integral_b^a g(x) upright(d) x) \
                 & <= integral_b^a abs(g(x)) upright(d) x \
                 & <= integral_b^a M(0) sup_(y in [a,b]) e^y upright(d) x \
                 & = M(0) sup_(y in [a,b]) e^y abs(a-b)
$
And thus $g$ is (Lipschitz) continuous. Differentiating  with respect to $a$, and applying FTC,
$
  (upright(d) g)/(upright(d) a) (a) & = upright(d)/(upright(d) a) (g(b)) + upright(d)/(upright(d) a) integral_b^a g(x) upright(d) x \
  g'(a) & = 0 + g(a) \
  & = g(a)
$

So, $g$ differentiable with $g=g'$. Since $g$ is continuous, $g'$ is also continuous, and thus this same argument can be applied inductively to obtain that $g$ is smooth.

#strong[Local form of the ordinary derivative result.]
We will use the same result on open intervals. If $I subset.eq bb(R)$ is a non-empty open interval, $F in C^infinity (I)$, and $lim_(n -> infinity) F^((n))(y)$ exists for every $y in I$, then $F$ is the restriction to $I$ of an entire function. Moreover, the pointwise limit $G$ satisfies
$
  G'=G
$
on $I$.

To see this, apply the Baire argument and Taylor estimate from Theorem 1 on compact subintervals of $I$. Thus every point of $I$ has a neighbourhood on which $F$ agrees with an entire function. These local entire functions agree on overlaps by analytic continuation, and hence glue to a single entire function agreeing with $F$ on all of $I$. The dominated-convergence step is then applied on an arbitrary compact interval $[a,b] subset.eq I$, giving
$
  G(a)-G(b)=integral_b^a G(x) upright(d) x.
$
Since $[a,b]$ was arbitrary, $G'=G$ on all of $I$.

#strong[Extension 1.]
Let $a in C^infinity (bb(R))$ be nowhere zero, and define the operator
$
  L f := a f'
$
on $C^infinity (bb(R))$. Suppose that for every $x in bb(R)$, the limit
$
  g(x) := lim_(n -> infinity) L^n f(x)
$
exists. We want to show that $g$ is differentiable, and in fact satisfies
$
  L g = g,
$
or equivalently,
$
  a g' = g.
$

#strong[Solution to Extension 1.]
Define
$
  Phi: bb(R) -> bb(R), quad Phi(x) := integral_0^x 1/(a(t)) upright(d) t.
$
Since $a$ is nowhere zero, it has constant sign. Thus $Phi'(x)=1/a(x)$ is nowhere zero, so $Phi$ is a smooth diffeomorphism from $bb(R)$ onto the open interval
$
  I := Phi(bb(R)) subset.eq bb(R).
$
Let $Phi^(-1): I -> bb(R)$ denote the inverse diffeomorphism. Define
$
  F := f circle Phi^(-1) : I -> bb(R).
$
Then, for $y in I$, the inverse derivative formula gives
$
  (Phi^(-1))'(y) = 1/(Phi'(Phi^(-1)(y))) = 1/(1/a(Phi^(-1)(y))) = a(Phi^(-1)(y)).
$
Hence, by the chain rule,
$
  F' & = (f' circle Phi^(-1)) (Phi^(-1))' \
     & = (f' circle Phi^(-1)) (a circle Phi^(-1)) \
     & = (L f) circle Phi^(-1).
$
Applying the same computation to $L f$ gives
$
  F'' & = ((L f)' circle Phi^(-1)) (Phi^(-1))' \
      & = ((L f)' circle Phi^(-1)) (a circle Phi^(-1)) \
      & = (L (L f)) circle Phi^(-1) \
      & = (L^2 f) circle Phi^(-1).
$
Applying the same identity inductively gives
$
  F^((n)) = (L^n f) circle Phi^(-1)
$
on $I$ for every $n >= 0$.

Now define
$
  G: I -> bb(R), quad G(y) := lim_(n -> infinity) F^((n))(y).
$
This limit exists because for every $y in I$, we have $Phi^(-1)(y) in bb(R)$, and so
$
  G(y) = lim_(n -> infinity) (L^n f)(Phi^(-1)(y)) = g(Phi^(-1)(y)).
$
Thus
$
  G = g circle Phi^(-1).
$
Now $F in C^infinity (I)$, and we have just shown that $lim_(n -> infinity) F^((n))(y)$ exists for every $y in I$. The proof of the original problem applies locally on any open interval, so applying it to $F: I -> bb(R)$ gives
$
  G'=G.
$
Since $G=g circle Phi^(-1)$, we also have $g=G circle Phi$. Therefore, for $x in bb(R)$,
$
  g' & = (G' circle Phi) Phi' \
     & = (G circle Phi) 1/a \
     & = g/a.
$
Hence
$
  a g' = g,
$
or equivalently, $L g=g$.

#strong[Extension 2]
Let $a in C^infinity (bb(R))$ be nowhere zero, and define the operator
$
  L f := a f' + f
$
on $C^infinity (bb(R))$. Suppose that for every $x in bb(R)$, the limit
$
  g(x) := lim_(n -> infinity) L^n f(x)
$
exists. We want to show that $g$ is differentiable, and in fact satisfies
$
  L g = g
$

#strong[Solution to Extension 2]
Define
$
  Phi: bb(R) -> bb(R), quad Phi(x) := integral_0^x 1/(a(t)) upright(d) t,
$
and let
$
  I := Phi(bb(R)) subset.eq bb(R)
$
As before, $Phi$ is a smooth diffeomorphism from $bb(R)$ onto $I$. Let $Phi^(-1): I -> bb(R)$ denote the inverse diffeomorphism.
Define
$
  E: I -> bb(R), quad E(y) := exp(y)
$
Then $E'=E$. Define the function
$
  F := E (f circle Phi^(-1)) : I -> bb(R)
$
Then, using the same calculation as in the first extension,
$
  F' & = E' (f circle Phi^(-1)) + E ((a f') circle Phi^(-1)) \
     & = E ((f+a f') circle Phi^(-1)) \
     & = E ((L f) circle Phi^(-1))
$
Applying the same computation to $L f$ gives
$
  F'' & = E' ((L f) circle Phi^(-1)) + E ((a (L f)') circle Phi^(-1)) \
      & = E (((L f)+a (L f)') circle Phi^(-1)) \
      & = E ((L (L f)) circle Phi^(-1)) \
      & = E ((L^2 f) circle Phi^(-1))
$
Applying the same identity inductively gives
$
  F^((n)) = E ((L^n f) circle Phi^(-1))
$
on $I$ for every $n >= 0$.

Now define
$
  G: I -> bb(R), quad G(y) := lim_(n -> infinity) F^((n))(y)
$
This limit exists because for every $y in I$,
$
  G(y) = E(y) lim_(n -> infinity) (L^n f)(Phi^(-1)(y)) = E(y) g(Phi^(-1)(y))
$
Thus
$
  G = E (g circle Phi^(-1))
$
Now $F in C^infinity (I)$, and we have just shown that $lim_(n -> infinity) F^((n))(y)$ exists for every $y in I$. The proof of the original problem applies locally on any open interval, so applying it to $F: I -> bb(R)$ gives
$
  G'=G
$
Then
$
  G' = E' (g circle Phi^(-1)) + E (g circle Phi^(-1))' = E (g circle Phi^(-1)) + E (g circle Phi^(-1))'
$
Since $G'=G=E (g circle Phi^(-1))$, we get
$
  (g circle Phi^(-1))'=0
$
Composing with $Phi$ gives
$
  g'=0
$
Hence
$
  a g' + g = g,
$
and therefore $L g=g$.

It is worth noting that in this case the conclusion is stronger than just $L g=g$: since $a$ is nowhere zero, the equation $a g' + g = g$ forces $g'=0$. Thus convergence under this operator forces the limiting function $g$ to be constant.

#strong[Extension 3]
Let $a,b in C^infinity (bb(R))$, with $a$ nowhere zero, and define the operator
$
  L f := a f' + b f
$
on $C^infinity (bb(R))$. Suppose that for every $x in bb(R)$, the limit
$
  g(x) := lim_(n -> infinity) L^n f(x)
$
exists. We want to show that $g$ is differentiable, and in fact satisfies
$
  L g = g,
$
or equivalently,
$
  a g' + b g = g
$

#strong[Solution to Extension 3]
Define
$
  Phi: bb(R) -> bb(R), quad Phi(x) := integral_0^x 1/(a(t)) upright(d) t,
$
and let
$
  I := Phi(bb(R)) subset.eq bb(R)
$
As before, $Phi$ is a smooth diffeomorphism from $bb(R)$ onto $I$. Let $Phi^(-1): I -> bb(R)$ denote the inverse diffeomorphism Fix $y_0 in I$, and define
$
  W: I -> bb(R), quad W(y) := exp(integral_(y_0)^y b(Phi^(-1)(s)) upright(d) s)
$
Then by the Fundamental Theorem of Calculus,
$
  W' = W (b circle Phi^(-1))
$
Define the function
$
  F := W (f circle Phi^(-1)) : I -> bb(R)
$
Then, using the same calculation as in the first extension,
$
  F' & = W' (f circle Phi^(-1)) + W ((a f') circle Phi^(-1)) \
     & = W ((b f) circle Phi^(-1)) + W ((a f') circle Phi^(-1)) \
     & = W ((L f) circle Phi^(-1))
$
Applying the same computation to $L f$ gives
$
  F'' & = W' ((L f) circle Phi^(-1)) + W ((a (L f)') circle Phi^(-1)) \
      & = W ((b (L f)) circle Phi^(-1)) + W ((a (L f)') circle Phi^(-1)) \
      & = W ((L (L f)) circle Phi^(-1)) \
      & = W ((L^2 f) circle Phi^(-1))
$
Applying the same identity inductively gives
$
  F^((n)) = W ((L^n f) circle Phi^(-1))
$
on $I$ for every $n >= 0$.

Now define
$
  G: I -> bb(R), quad G(y) := lim_(n -> infinity) F^((n))(y)
$
This limit exists because for every $y in I$,
$
  G(y) = W(y) lim_(n -> infinity) (L^n f)(Phi^(-1)(y)) = W(y) g(Phi^(-1)(y))
$
Thus
$
  G = W (g circle Phi^(-1))
$
Now $F in C^infinity (I)$, and we have just shown that $lim_(n -> infinity) F^((n))(y)$ exists for every $y in I$. The proof of the original problem applies locally on any open interval, so applying it to $F: I -> bb(R)$ gives
$
  G'=G
$
Then
$
  G' = W' (g circle Phi^(-1)) + W (g circle Phi^(-1))' = W (b circle Phi^(-1)) (g circle Phi^(-1)) + W (g circle Phi^(-1))'
$
Since $G'=G=W(g circle Phi^(-1))$, we get
$
  (g circle Phi^(-1))' + (b circle Phi^(-1)) (g circle Phi^(-1)) = g circle Phi^(-1)
$
Now compose this identity with $Phi$ Since $g=(g circle Phi^(-1)) circle Phi$, the chain rule gives
$
  g' = ((g circle Phi^(-1))' circle Phi) Phi' = ((g circle Phi^(-1))' circle Phi) / a
$
Thus
$
  ((g circle Phi^(-1))' circle Phi) = a g'
$
Also, $((b circle Phi^(-1)) circle Phi)=b$ and $((g circle Phi^(-1)) circle Phi)=g$ Therefore composing with $Phi$ gives
$
  a g' + b g = g
$
Therefore $L g=g$

This also gives an explicit description of the possible limits. Indeed,
$
  a g' + b g = g
$
is equivalent to
$
  g' = (1-b)/a g
$
Thus either $g=0$, or for some constant $C$,
$
  g(x) = C exp(integral_(x_0)^x (1-b(t))/(a(t)) upright(d) t)
$
This recovers the previous cases: if $b=0$, then $g$ is a scalar multiple of $exp(integral (1/a))$, while if $b=1$, then $g$ is constant.

#strong[Degenerate example]
Now consider the operator
$
  L f := x f'
$
This is the simplest example where the coefficient of $f'$ vanishes, so the previous change of variables cannot be applied globally. In this case, however, the argument is still rigid enough to determine the limit.

Suppose that for every $x in bb(R)$, the limit
$
  g(x) := lim_(n -> infinity) L^n f(x)
$
exists.

We will use the following standard uniqueness lemma for entire functions with controlled exponential growth. An entire function $H:bb(C)->bb(C)$ is said to have exponential type at most $1$ if it grows no faster than $exp(abs(z))$, up to an arbitrarily small change in the exponent. More precisely, for every $epsilon>0$, there is a constant $C_epsilon$ such that
$
  abs(H(z)) <= C_epsilon exp((1+epsilon) abs(z))
$
for every $z in bb(C)$. In the arguments below, we will prove the stronger and more concrete estimate
$
  abs(H(z)) <= C exp(abs(z))
$
for a fixed constant $C$. This immediately implies exponential type at most $1$.

*Lemma.* If $H$ is entire of exponential type at most $1$ and
$
  abs(H(t)) <= A exp(alpha t)
$
for some constants $A>0$, $alpha>1$, and $T in bb(R)$, and for every real $t<=T$, then $H=0$.

Intuitively, the lemma says this: an entire function whose total complex-plane growth is no faster than $exp(abs(z))$ cannot decay along the negative real axis as fast as $exp(2t)$, $exp(3t)$, or any $exp(alpha t)$ with $alpha>1$, unless it is identically zero. We use this as a standard consequence of the Phragmen-Lindelof indicator theorem. In terms of the indicator $h_H (theta)$, the decay on the negative real axis gives $h_H (pi) <= -alpha$, while type at most $1$ gives $h_H (0)<=1$. For a non-zero entire function of exponential type, one has
$
  h_H (0)+h_H (pi)>=0,
$
which is impossible if $alpha>1$.

Now work on the positive half-line. Define
$
  Phi_+: (0,infinity) -> bb(R), quad Phi_+(x) := log x
$
Then $Phi_+^(-1)(y)=exp(y)$. Define
$
  F_+ := f circle Phi_+^(-1) : bb(R) -> bb(R)
$
For $y in bb(R)$,
$
  F_+ '(y) & = (f circle Phi_+^(-1))'(y) \
           & = f'(Phi_+^(-1)(y)) (Phi_+^(-1))'(y) \
           & = f'(exp(y)) exp(y) \
           & = (L f)(exp(y))
$
Thus
$
  F_+ ' = (L f) circle Phi_+^(-1),
$
and inductively,
$
  F_+^((n)) = (L^n f) circle Phi_+^(-1)
$
Therefore the original result applies to $F_+$. In particular, $F_+$ extends to an entire function. It also has exponential type at most $1$: since $F_+^((n))(0)$ converges as $n -> infinity$, there is an $M>0$ such that $abs(F_+^((n))(0))<=M$ for every $n>=0$. Hence its Taylor series at $0$ satisfies
$
  abs(F_+(z))
  <= sum_(n=0)^infinity M/(n!) abs(z)^n
  = M exp(abs(z)).
$

The derivative-limit
$
  G_+(y) := lim_(n -> infinity) F_+^((n))(y)
$
satisfies $G_+ '=G_+$. Hence $G_+(y)=C_+ exp(y)$ for some constant $C_+$. Since
$
  G_+ = g circle Phi_+^(-1),
$
we get
$
  g(x)=C_+ x
$
for $x>0$.

We now show that $f$ itself is affine on $(0,infinity)$. Since $f$ is smooth at $0$, there are constants
$
  a:=f(0), quad b:=f'(0)
$
such that the second-order Taylor remainder is bounded near $0$. Concretely, there are constants $delta>0$ and $K>0$ such that whenever $abs(x)<delta$,
$
  abs(f(x)-a-b x) <= K x^2.
$
Choose $Y<0$ so that $exp(y)<delta$ for every $y<=Y$. Then for $y<=Y$,
$
  abs(F_+(y)-a-b exp(y))
  = abs(f(exp(y))-a-b exp(y))
  <= K exp(2y).
$
Set
$
  H_+(y):=F_+(y)-a-b exp(y).
$
Then $H_+$ is entire of exponential type at most $1$, and
$
  abs(H_+(y)) <= K exp(2y)
$
for every $y<=Y$. By the standard fact above, applied with $alpha=2$, $H_+=0$. Thus
$
  F_+(y)=a+b exp(y),
$
and hence
$
  f(x)=a+b x
$
for $x>0$.

Similarly, on $(-infinity,0)$, define
$
  Phi_-: (-infinity,0) -> bb(R), quad Phi_-(x) := log(-x)
$
Then $Phi_-^(-1)(y)=-exp(y)$. Define
$
  F_- := f circle Phi_-^(-1) : bb(R) -> bb(R)
$
For $y in bb(R)$,
$
  F_- '(y) & = (f circle Phi_-^(-1))'(y) \
           & = f'(Phi_-^(-1)(y)) (Phi_-^(-1))'(y) \
           & = f'(-exp(y)) (-exp(y)) \
           & = (L f)(-exp(y))
$
Thus
$
  F_-^((n)) = (L^n f) circle Phi_-^(-1)
$
for every $n>=0$. Again $F_-$ extends to an entire function of exponential type at most $1$ by the same Taylor-coefficient bound, and its derivative-limit has the form $C exp(y)$. Hence there is a constant $C_-$ such that
$
  g(x)=C_- x
$
for $x<0$.

The same Taylor-remainder estimate at $0$ gives, for $y<=Y$,
$
  abs(F_-(y)-a+b exp(y))
  = abs(f(-exp(y))-a+b exp(y))
  <= K exp(2y).
$
Set
$
  H_-(y):=F_-(y)-a+b exp(y).
$
Then $H_-$ is entire of exponential type at most $1$, and
$
  abs(H_-(y)) <= K exp(2y)
$
for every $y<=Y$. The same indicator argument, again with $alpha=2$, gives $H_-=0$. Hence
$
  F_-(y)=a-b exp(y),
$
and since $x=-exp(y)$, this says
$
  f(x)=a+b x
$
for $x<0$.

Since $f(0)=a$, we have globally
$
  f(x)=a+b x.
$
Finally,
$
  L f=x f'(x)=b x,
$
and therefore $L^n f=b x$ for every $n>=1$. Hence
$
  g(x)=b x.
$
In particular the pointwise limit is smooth and satisfies
$
  L g = g.
$

The difference from the $x^2 D$ example below is that for $x D$, both sides of $0$ correspond to $y=log abs(x) -> -infinity$. Smoothness at $0$ therefore forces the same affine asymptotic on both sides. For $x^2 D$, one side corresponds instead to $y -> +infinity$, which allows a right-sided flat eigenfunction to survive.
#pagebreak()

#strong[Degenerate example 2]
Now consider the operator $L: C^oo (RR, RR) -> C^oo (RR, RR)$ defined by
$       f & mapsto L f \
L f (x) & = x^2 f'(x) quad forall x in RR. $ Note that $L$ is well-defined since $x mapsto x^2$ is smooth, and since $f'$ is smooth (since $f$ is smooth), so that $L f$ is smooth.
As before, suppose that for every $x in RR$, the limit
$
  g(x) := lim_(n -> infinity) L^n f(x)
$
exists.

Define
$
  Phi_+: (0,infinity) & -> bb(R) \
                    x & mapsto -1 / x
$
Note that $Phi_+$ is self-inverse, so $(Phi_+^(-1))'(x)= Phi_+ '(x)=1/x^2$ for all $x in (0,oo)$. Denote $F_+ = f compose Phi_+^(-1)$.

*Lemma 1*: For all $n in NN$, $F_+^((n)) = (L^((n)) f) compose Phi_+^(-1)$.

*Proof of Lemma 1*: Applying the chain rule, we have $ F_+^' = (f compose phi_+^(-1))'=f' compose Phi_+^(-1) dot (Phi_+^(-1))' $
Therefore, for $y in (-oo,0)$, we have
$
  F_+^' (y) & = f'(Phi_+^(-1)(y)) (Phi_+^(-1))'(y) \
            & =f'(-1/y) (1/y^2) \
            & =f'(Phi_+^(-1) (y)) (Phi_+^(-1) (y))^2 \
            & =(L f)(Phi_+^(-1)(y)).
$
So $F_+^'=(L f) compose Phi_+^(-1)$.

We also have
$
  F_+^((2)) & = ((L f) compose Phi_+^(-1))' \
            & = ((L f)' compose Phi_+^(-1)) (Phi_+^(-1))' \
$
Therefore, for $y in (-oo,0)$, we have
$
  F_+^((2))(y) & = (L f)'(Phi_+^(-1)(y)) (Phi_+^(-1)(y))^2 \
               & = L ((L f)(Phi_+^(-1)(y)) \
               & = (L^2 f)(Phi_+^(-1)(y)).
$

So $F^((2))_+ = (L^((2)) f) compose Phi_+^(-1)$.

Inductively,
$
  F_+^((n)) = (L^n f) compose Phi_+^(-1)
$
which concludes the proof of *Lemma 1*. $qed$

Note that $F_+ in C^infinity ((-oo,0))$. Moreover, by Lemma 1 and the hypothesis on $L^((n)) f$, $lim_(n -> infinity) F_+^((n))(y)$ exists for every $y in (-oo,0)$, the *Local form of the ordinary derivative result* stated above applies directly to $F_+$. Thus, if
$
  G_+(y) := lim_(n -> infinity) F_+^((n))(y),
$
then $G_+^'=G_+$ on $(-oo,0)$, so
$
  G_+(y)=C_+ exp(y)
$
for some $C_+ in RR$. Note that $G_+=g compose Phi_+^(-1)$, so $g = G_+ compose Phi_+$. Therefore, for $x>0$ we get
$
  g(x)=C_+ exp(-1/x)
$

Now, define
$
  Phi_-: (-infinity,0) & -> bb(R) \
                quad x & mapsto -1 / x
$
and denote $F_- = f compose Phi_-^(-1)$.

*Lemma 2*: For all $n in NN$, $F_-^((n)) = (L^n f) compose Phi_-^(-1)$

*Proof of Lemma 2*: Analogous to the proof of Lemma 1. $qed$

Analogously, the *local form of the ordinary derivative result* gives
$
  G_-(y) := lim_(n -> infinity) F_-^((n))(y) = C_- exp(y)
$
for some $C_- in RR$.

*Lemma 3*: $C_-= 0$.

*Proof of Lemma 3*:
First note that since $f$ is continuous at $0$ (since $f$ is smooth), then
$
  lim_(y->oo) F_-(y)=lim_(y->oo) f(-1/y)= f(lim_(y->oo) -1/y) = f(0)
$
In particular, $F_-$ is bounded for all sufficiently large $y$. Thus there exist $Y>0$ and $M>0$ such that
$
  abs(F_-(y)) <= M
$
for every $y>=Y$.

By the *local ordinary derivative result*, $F_-$ agrees on $(0,infinity)$ with the restriction of an entire function $tilde(F)_-$. Therefore, for every $y_0>0$, its Taylor series centered at $y_0$ has infinite radius of convergence. Set
$
  H(y) := F_-(y) - C_- exp(y)
$
on $(0,infinity)$. Since entire functions are closed under linear combinations, the function
$
  tilde(H)(z) := tilde(F)_-(z) - C_- exp(z)
$
is entire. Moreover, for every $y in (0,infinity)$,
$
  tilde(H)(y) = F_-(y) - C_- exp(y) = H(y).
$
Thus $H$ agrees on $(0,infinity)$ with the restriction of the entire function $tilde(H)$. Also, for every $y>0$,
$
  H^((n))(y)
  = F_-^((n))(y) - C_- exp(y)
  ->_(n->oo) 0
$
because $F_-^((n))(y) ->_(n->oo) C_- exp(y)$.

Fix $y_0>0$, and define
$
  a_k := H^((k))(y_0).
$
For $r>0$, we have $ H(r)=sum_(k=0)^oo a_k/ k! (r-y_0)^k $
so
$
  H(y_0+r)=sum_(k=0)^infinity a_k/(k!) r^k
$
since $y_0+r >0$
and hence
$
  exp(-r) H(y_0+r)
  = sum_(k=0)^infinity a_k exp(-r) r^k / k!
$
We claim that the right hand side tends to $0$ as $r -> infinity$. Let $epsilon>0$. Since $a_k -> 0$, choose $K$ such that $abs(a_k)<epsilon/2$ for every $k>=K$. Then
$
  abs(exp(-r)H(y_0+r)) & =abs(sum_(k=0)^infinity a_k exp(-r) r^k / k!) \
  & <= sum_(k=0)^(K-1) abs(a_k) exp(-r) r^k/k! + epsilon/2 sum_(k=K)^infinity exp(-r) r^k/k! #strong[(1)]
$
However, $ sum_(k=0)^(K-1) abs(a_k) exp(-r)r^k/k! =sum_(k=0)^(K-1) abs(a_k)/k! r^k/(exp(r)) ->_(r->oo) 0 quad #strong[(2)] $
because $r^k in o(exp(r))$ for any $k in NN$. Note further that
$
  epsilon/2 sum_(k=K)^oo exp(-r) r^k/k! =epsilon/2 exp(-r) sum_(k=K)^oo r^k/k! <= epsilon/2 exp(-r) exp(r)=epsilon/2 #strong[(3)]
$
because $r^k/k! >= 0$ for all $r>=0$.

Combining *(1)--(3)*, we have
$
  abs(exp(-r)H(y_0+r))
  <= sum_(k=0)^(K-1) abs(a_k) exp(-r) r^k/k! + epsilon.
$
By *(2)*, the finite sum is less than $epsilon/2$ for all sufficiently large $r$. Hence
$
  abs(exp(-r)H(y_0+r)) < epsilon
$
for all sufficiently large $r$. Since $epsilon>0$ was arbitrary,
$
  lim_(r->oo) exp(-r) H(y_0+r) = 0
$
Now let $y=y_0+r$. Then
$
  exp(-y)H(y) & = exp(-y_0-r)H(y) \
              & = exp(-y_0) exp(-r)H(y_0+r).
$
Since $exp(-y_0)$ is constant and $r->oo$ if and only if $y->oo$, it follows that
$
  lim_(y->oo) exp(-y)H(y)=0.
$

Now,
$
  exp(-y) F_-(y) & =exp(-y) (C_- exp(y) + H(y)) quad ("by definition of" H) \
                 & = C_- + exp(-y) H(y),
$
so
$
  lim_(y->oo) exp(-y) F_-(y) = C_- #strong[(4)]
$
However, by the choice of $Y$ and $M$, for every $y>=Y$ we have
$
  abs(exp(-y)F_-(y)) <= exp(-y) abs(F_-(y)) <= M exp(-y).
$
Since $lim_(y->oo) M exp(-y) = 0$, the squeeze theorem gives
$
  lim_(y->oo) exp(-y) F_-(y) = 0 #strong[(5)]
$
Therefore, by *(4)* and *(5)*, we have $C_-=0$.
$qed$

*Lemma 4 (Smooth gluing lemma).* Let $h in C^infinity ((0,oo))$ and suppose that
$
  lim_(x->0^+) h^((n))(x)=0
$
for every $n>=0$. Then the extension
$
  tilde(h)(x)=
  cases(
    h(x)\, & x>0,
    0\, & x<=0
  )
$
belongs to $C^infinity (RR)$.

*Proof of Lemma 4*: See #link("https://ems.press/content/serial-article-files/51546")[Francis, Lemma 6.2], which proves the more general extension-by-zero principle in $RR^d$. $qed$

Since $C_-=0$, then $G_-equiv 0$, yet $G_-=g compose Phi_-^(-1)$ with $Phi_-^(-1)(y)=-1/y != 0$ for any $y in (0,oo)$. Therefore, $g(x)=0$
for $x<0$. Also, at $x=0$, we have $(L h)(0)=0$ for every smooth function $h$, so $g(0)=0$. Therefore any pointwise limit has the form
$
  g(x)=
  cases(
    C_+ exp(-1/x)\, & x>0,
    0\, & x<=0
  )
$
Note that $g$ is clearly smooth on $RR^*$. On $(-oo,0]$, every derivative of $g$ is zero. For every $n>=0$, the $n$th derivative of the right-hand piece has the form
$
  P_n (1/x) exp(-1/x)=(P_n (1/x))/exp(1/x)
$
for some polynomial $P_n$, which tends to $0$ as $x -> 0^+$ because exponential growth dominates polynomial growth. Thus, by Lemma 4, $g$ is smooth at $0$, and therefore $g in C^infinity (RR)$, as desired.

The constant $C_+$ need not be zero. On the negative half-line, $x->0^-$ corresponds to $y->oo$, where $F_-$ is bounded and $exp(-y)->0$, forcing $C_-=0$. On the positive half-line, $x->0^+$ corresponds instead to $y->-oo$, where $exp(-y)->oo$, so the same argument fails. Indeed, for any $C in RR$, the smooth function
$
  f_C (x)=cases(C exp(-1/x)\, & x>0, 0\, & x<=0)
$
satisfies $L f_C=f_C$. Hence $L^n f_C=f_C$ for every $n$, showing that any value $C_+=C$ can occur.

#pagebreak()
#strong[Three important spaces]
Let $L: C^infinity (bb(R)) -> C^infinity (bb(R))$ be a linear differential operator, and define
$
  A := {h in C^infinity (bb(R)) bar.v lim_(n -> infinity) L^n h(x) = 0 " for every " x in bb(R)}
$
This is the transient space. Define
$
  B := {f in C^infinity (bb(R)) bar.v lim_(n -> infinity) L^n f(x) " exists for every " x in bb(R)}
$
This is the input space. Finally, define
$
  C := {g in C^infinity (bb(R)) bar.v L g = g}
$
This is the fixed-point space.

The following decomposition holds once the main regularity property has been proved for the operator $L$: assume that for every $f in B$, the pointwise limit
$
  g(x) := lim_(n -> infinity) L^n f(x)
$
belongs to $C^infinity (bb(R))$ and satisfies $L g = g$. Under this hypothesis,
$
  B = A + C
$

First let $f in B$, and define
$
  g(x) := lim_(n -> infinity) L^n f(x)
$
By the hypothesis, $g in C$. Let
$
  h := f - g
$
Then $h in C^infinity (bb(R))$, and for every $x in bb(R)$,
$
  L^n h(x)
  = L^n f(x) - L^n g(x)
  = L^n f(x) - g(x)
  -> 0
$
Thus $h in A$, and therefore
$
  f = h + g in A + C
$
So $B subset.eq A + C$.

Conversely, let $f in A + C$. Then there exist $h in A$ and $g in C$ such that
$
  f = h + g
$
Since $L g = g$, we have $L^n g = g$ for every $n >= 0$. Hence, for every $x in bb(R)$,
$
  L^n f(x)
  = L^n h(x) + L^n g(x)
  = L^n h(x) + g(x)
  -> g(x)
$
Therefore the limit $lim_(n -> infinity) L^n f(x)$ exists for every $x in bb(R)$, so $f in B$. Hence
$
  A + C subset.eq B
$

Combining the two inclusions gives
$
  B = A + C
$
