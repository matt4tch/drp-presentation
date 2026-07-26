#strong[Problem.]
Let $d = dif/(dif x)$, and let $f in C^oo (RR)$. Suppose that for every $x in RR$, the limit
$
  g(x) := lim_(n -> oo) d^n f(x) = lim_(n -> oo) f^((n))(x)
$
exists. We want to show that $g$ is differentiable, and in fact satisfies $g'=g$.

#strong[Theorem 1.]
Let $f in C^oo (RR)$. Define
$
  M(x):=sup{abs(f^((k))(x)) mid(|) k>=0}
$
and assume that for each $x in RR$, $M(x)<oo$. Then $f$ is real analytic with infinite radius of convergence. \
#strong[Proof:]
Suppose this is not the case. Let $X$ denote the set of real numbers $x$ for which there does not exist any entire function that agrees with $f$ on a neighbourhood of $x$. If $X=emptyset$, then every point has a neighbourhood on which $f$ agrees with some entire function. These entire functions agree on overlaps by analytic continuation, and hence glue to a single entire function agreeing with $f$ on all of $RR$, contradicting our assumption. Therefore $X$ is non-empty. \
*Claim:* $X$ is closed.\
*Proof:* Let $(x_n) subset.eq X$. Suppose $x_n -> x in.not X$. Then there exists a neighbourhood $U subset.eq RR$ of $x$, such that there exists an entire $g$ that agrees with $f$ on $U$. But $x_n->x$, so $x_N in U$ for some $N in NN$. But $U$ is a neighbourhood of $x_N$, on which entire function $g$ agrees with $f$, yet $x_N in X$, so such a neighbourhood cannot exist. Therefore, $x in X$, so $X$ is closed. $square$

Now define $S_n:={x in RR | M(x) <= n}$. Then,
$
  S_n & = {x in RR | f^((k)) (x) in [-n, n] space forall k >= 0} \
      & = inter.big_(k >= 0) ((dif^k f)/(dif x^k))^(-1) ([-n,n])
$
Hence each $S_n$ is closed. Also note that
$ RR = union.big_(n in NN) S_n $
So
$
  X = union.big_(n in NN) (S_n inter X)
$
Since $X$ is closed in $RR$, it is complete in the induced metric. Since $X$ is also non-empty, then by BCT, we have that there exists an $N in NN$ with $S_N inter X$ having non-empty interior relative to $X$. In other words, there exist $a,b in RR$ with $a < b$ such that
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

Since $F|_((c,e))=f|_((c,e))$ and both functions are $C^oo$ there, we have $F^((r))|_((c,e))=f^((r))|_((c,e))$ for every $r >= 0$. Therefore, using continuity of $F^((r))$ and $f^((r))$,
$
  F^((r))(c) = lim_(x -> c^+) F^((r))(x) = lim_(x -> c^+) f^((r))(x) = f^((r))(c)
$

Now let $x in (c,e)$. Since $F$ is entire, Taylor expansion of $F^((m))$ around $c$ gives, for each $m >= 0$,
$
  f^((m))(x) = F^((m))(x) = sum_(j=0)^oo (F^((m+j))(c))/(j!) (x-c)^j = sum_(j=0)^oo (f^((m+j))(c))/(j!) (x-c)^j
$
Thus,
$
  abs(f^((m))(x)) & <= sum_(j=0)^oo abs(f^((m+j))(c))/(j!) abs(x-c)^j \
                  & <= sum_(j=0)^oo N/(j!) abs(x-c)^j \
                  & <= sum_(j=0)^oo N/(j!) (b-a)^j \
                  & = N exp(b-a)
$
for all $m >= 0$ and all $x in (c,e)$. Since $f in C^oo (RR)$, each $f^((m))$ is continuous, so letting $x -> e^-$ gives
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
Letting $K -> oo$, the right hand side goes to $0$. Hence $f$ agrees with its Taylor series on $(x_0-r,x_0+r)$. Since $x_0 in (a,b)$ was arbitrary, $f$ is real analytic on $(a,b)$.

Moreover, the same bound shows that this Taylor series has infinite radius of convergence. Indeed, for every $z in CC$,
$
  sum_(j=0)^oo abs((f^((j))(x_0))/(j!) (z-x_0)^j)
  <= sum_(j=0)^oo (N exp(b-a))/(j!) abs(z-x_0)^j
  = N exp(b-a) exp(abs(z-x_0)) < oo
$
Thus the Taylor series at $x_0$ defines an entire function which agrees with $f$ on a neighbourhood of $x_0$. Hence $x_0 in.not X$. Since $x_0 in (a,b)$ was arbitrary, $(a,b) inter X = emptyset$. This contradicts $(a,b) inter X != emptyset$.

Therefore our supposition was false, so $X=emptyset$. Hence every point has a neighbourhood on which $f$ agrees with an entire function. By analytic continuation, these local entire functions agree on overlaps and glue to a single entire function whose restriction to $RR$ is $f$. Therefore $f$ is real analytic with infinite radius of convergence.

$square$


#strong[Application to the problem.]
Assume that $f in C^oo (RR)$ and that
$
  g(x) := lim_(n -> oo) f^((n))(x)
$
exists for every $x in RR$. Then for each fixed $x$, the sequence $(f^((n))(x))_(n >= 0)$ is convergent, hence bounded. Therefore the hypotheses of Theorem 1 are satisfied, so $f$ is the restriction of an entire function.

Indeed, for each $x in RR$, set
$
  M(x) := sup_(n >= 0) abs(f^((n))(x)).
$
This quantity is finite because $(f^((n))(x))_(n >= 0)$ converges.

For all $k>=0$ and $x in RR$ we have
$
  abs(f^((k))(x)) & = abs(sum_(n=0)^oo (f^((n+k))(0))/n!x^n) \
                  & <= sum_(n=0)^oo abs((f^((n+k))(0))/n!x^n) \
                  & = sum_(n=0)^oo abs(f^((n+k))(0))/n!abs(x)^n \
                  & <= sum_(n=0)^oo M(0)/n!abs(x)^n \
                  & = M(0)e^abs(x) space (2)
$

Let $a,b in RR$. By Fundamental Theorem of Calculus, we have

$
  f^((n)) (a) - f^((n)) (b) = integral_b^a f^((n+1)) (x) dif x
$
Taking $n -> oo$, and by (2), we can apply Lebesgue's Dominated Convergence Theorem to obtain

$
  g(a)-g(b) = integral_b^a g(x) dif x
$
and hence
$
  abs(g(a)-g(b)) & = abs(integral_b^a g(x) dif x) \
                 & <= integral_b^a abs(g(x)) dif x \
                 & <= integral_b^a M(0) sup_(y in [a,b]) e^y dif x \
                 & = M(0) sup_(y in [a,b]) e^y abs(a-b)
$
And thus $g$ is (Lipschitz) continuous. Differentiating  with respect to $a$, and applying FTC,
$
  (dif g)/(dif a) (a) & = dif/(dif a) (g(b)) + dif/(dif a) integral_b^a g(x) dif x \
                g'(a) & = 0 + g(a) \
                      & = g(a)
$

So, $g$ differentiable with $g=g'$. Since $g$ is continuous, $g'$ is also continuous, and thus this same argument can be applied inductively to obtain that $g$ is smooth.

#strong[Local form of the ordinary derivative result.]
We will use the same result on open intervals. If $I subset.eq RR$ is a non-empty open interval, $F in C^oo (I)$, and $lim_(n -> oo) F^((n))(y)$ exists for every $y in I$, then $F$ is the restriction to $I$ of an entire function. Moreover, the pointwise limit $G$ satisfies
$
  G'=G
$
on $I$.

To see this, apply the Baire argument and Taylor estimate from Theorem 1 on compact subintervals of $I$. Thus every point of $I$ has a neighbourhood on which $F$ agrees with an entire function. These local entire functions agree on overlaps by analytic continuation, and hence glue to a single entire function agreeing with $F$ on all of $I$. The dominated-convergence step is then applied on an arbitrary compact interval $[a,b] subset.eq I$, giving
$
  G(a)-G(b)=integral_b^a G(x) dif x.
$
Since $[a,b]$ was arbitrary, $G'=G$ on all of $I$.

#strong[Extension 1.]
Let $a in C^oo (RR)$ be nowhere zero, and define the operator
$
  L f := a f'
$
on $C^oo (RR)$. Suppose that for every $x in RR$, the limit
$
  g(x) := lim_(n -> oo) L^n f(x)
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
  Phi: RR -> RR, quad Phi(x) := integral_0^x 1/(a(t)) dif t.
$
Since $a$ is nowhere zero, it has constant sign. Thus $Phi'(x)=1/a(x)$ is nowhere zero, so $Phi$ is a smooth diffeomorphism from $RR$ onto the open interval
$
  I := Phi(RR) subset.eq RR.
$
Let $Phi^(-1): I -> RR$ denote the inverse diffeomorphism. Define
$
  F := f compose Phi^(-1) : I -> RR.
$
Then, for $y in I$, the inverse derivative formula gives
$
  (Phi^(-1))'(y) = 1/(Phi'(Phi^(-1)(y))) = 1/(1/a(Phi^(-1)(y))) = a(Phi^(-1)(y)).
$
Hence, by the chain rule,
$
  F' & = (f' compose Phi^(-1)) (Phi^(-1))' \
     & = (f' compose Phi^(-1)) (a compose Phi^(-1)) \
     & = (L f) compose Phi^(-1).
$
Applying the same computation to $L f$ gives
$
  F'' & = ((L f)' compose Phi^(-1)) (Phi^(-1))' \
      & = ((L f)' compose Phi^(-1)) (a compose Phi^(-1)) \
      & = (L (L f)) compose Phi^(-1) \
      & = (L^2 f) compose Phi^(-1).
$
Applying the same identity inductively gives
$
  F^((n)) = (L^n f) compose Phi^(-1)
$
on $I$ for every $n >= 0$.

Now define
$
  G: I -> RR, quad G(y) := lim_(n -> oo) F^((n))(y).
$
This limit exists because for every $y in I$, we have $Phi^(-1)(y) in RR$, and so
$
  G(y) = lim_(n -> oo) (L^n f)(Phi^(-1)(y)) = g(Phi^(-1)(y)).
$
Thus
$
  G = g compose Phi^(-1).
$
Now $F in C^oo (I)$, and we have just shown that $lim_(n -> oo) F^((n))(y)$ exists for every $y in I$. The proof of the original problem applies locally on any open interval, so applying it to $F: I -> RR$ gives
$
  G'=G.
$
Since $G=g compose Phi^(-1)$, we also have $g=G compose Phi$. Therefore, for $x in RR$,
$
  g' & = (G' compose Phi) Phi' \
     & = (G compose Phi) 1/a \
     & = g/a.
$
Hence
$
  a g' = g,
$
or equivalently, $L g=g$.

#strong[Extension 2]
Let $a in C^oo (RR)$ be nowhere zero, and define the operator
$
  L f := a f' + f
$
on $C^oo (RR)$. Suppose that for every $x in RR$, the limit
$
  g(x) := lim_(n -> oo) L^n f(x)
$
exists. We want to show that $g$ is differentiable, and in fact satisfies
$
  L g = g
$

#strong[Solution to Extension 2]
Define
$
  Phi: RR -> RR, quad Phi(x) := integral_0^x 1/(a(t)) dif t,
$
and let
$
  I := Phi(RR) subset.eq RR
$
As before, $Phi$ is a smooth diffeomorphism from $RR$ onto $I$. Let $Phi^(-1): I -> RR$ denote the inverse diffeomorphism.
Define
$
  E: I -> RR, quad E(y) := exp(y)
$
Then $E'=E$. Define the function
$
  F := E (f compose Phi^(-1)) : I -> RR
$
Then, using the same calculation as in the first extension,
$
  F' & = E' (f compose Phi^(-1)) + E ((a f') compose Phi^(-1)) \
     & = E ((f+a f') compose Phi^(-1)) \
     & = E ((L f) compose Phi^(-1))
$
Applying the same computation to $L f$ gives
$
  F'' & = E' ((L f) compose Phi^(-1)) + E ((a (L f)') compose Phi^(-1)) \
      & = E (((L f)+a (L f)') compose Phi^(-1)) \
      & = E ((L (L f)) compose Phi^(-1)) \
      & = E ((L^2 f) compose Phi^(-1))
$
Applying the same identity inductively gives
$
  F^((n)) = E ((L^n f) compose Phi^(-1))
$
on $I$ for every $n >= 0$.

Now define
$
  G: I -> RR, quad G(y) := lim_(n -> oo) F^((n))(y)
$
This limit exists because for every $y in I$,
$
  G(y) = E(y) lim_(n -> oo) (L^n f)(Phi^(-1)(y)) = E(y) g(Phi^(-1)(y))
$
Thus
$
  G = E (g compose Phi^(-1))
$
Now $F in C^oo (I)$, and we have just shown that $lim_(n -> oo) F^((n))(y)$ exists for every $y in I$. The proof of the original problem applies locally on any open interval, so applying it to $F: I -> RR$ gives
$
  G'=G
$
Then
$
  G' = E' (g compose Phi^(-1)) + E (g compose Phi^(-1))' = E (g compose Phi^(-1)) + E (g compose Phi^(-1))'
$
Since $G'=G=E (g compose Phi^(-1))$, we get
$
  (g compose Phi^(-1))'=0
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
Let $a,b in C^oo (RR)$, with $a$ nowhere zero, and define the operator
$
  L f := a f' + b f
$
on $C^oo (RR)$. Suppose that for every $x in RR$, the limit
$
  g(x) := lim_(n -> oo) L^n f(x)
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
  Phi: RR -> RR, quad Phi(x) := integral_0^x 1/(a(t)) dif t,
$
and let
$
  I := Phi(RR) subset.eq RR
$
As before, $Phi$ is a smooth diffeomorphism from $RR$ onto $I$. Let $Phi^(-1): I -> RR$ denote the inverse diffeomorphism Fix $y_0 in I$, and define
$
  W: I -> RR, quad W(y) := exp(integral_(y_0)^y b(Phi^(-1)(s)) dif s)
$
Then by the Fundamental Theorem of Calculus,
$
  W' = W (b compose Phi^(-1))
$
Define the function
$
  F := W (f compose Phi^(-1)) : I -> RR
$
Then, using the same calculation as in the first extension,
$
  F' & = W' (f compose Phi^(-1)) + W ((a f') compose Phi^(-1)) \
     & = W ((b f) compose Phi^(-1)) + W ((a f') compose Phi^(-1)) \
     & = W ((L f) compose Phi^(-1))
$
Applying the same computation to $L f$ gives
$
  F'' & = W' ((L f) compose Phi^(-1)) + W ((a (L f)') compose Phi^(-1)) \
      & = W ((b (L f)) compose Phi^(-1)) + W ((a (L f)') compose Phi^(-1)) \
      & = W ((L (L f)) compose Phi^(-1)) \
      & = W ((L^2 f) compose Phi^(-1))
$
Applying the same identity inductively gives
$
  F^((n)) = W ((L^n f) compose Phi^(-1))
$
on $I$ for every $n >= 0$.

Now define
$
  G: I -> RR, quad G(y) := lim_(n -> oo) F^((n))(y)
$
This limit exists because for every $y in I$,
$
  G(y) = W(y) lim_(n -> oo) (L^n f)(Phi^(-1)(y)) = W(y) g(Phi^(-1)(y))
$
Thus
$
  G = W (g compose Phi^(-1))
$
Now $F in C^oo (I)$, and we have just shown that $lim_(n -> oo) F^((n))(y)$ exists for every $y in I$. The proof of the original problem applies locally on any open interval, so applying it to $F: I -> RR$ gives
$
  G'=G
$
Then
$
  G' = W' (g compose Phi^(-1)) + W (g compose Phi^(-1))' = W (b compose Phi^(-1)) (g compose Phi^(-1)) + W (g compose Phi^(-1))'
$
Since $G'=G=W(g compose Phi^(-1))$, we get
$
  (g compose Phi^(-1))' + (b compose Phi^(-1)) (g compose Phi^(-1)) = g compose Phi^(-1)
$
Now compose this identity with $Phi$ Since $g=(g compose Phi^(-1)) compose Phi$, the chain rule gives
$
  g' = ((g compose Phi^(-1))' compose Phi) Phi' = ((g compose Phi^(-1))' compose Phi) / a
$
Thus
$
  ((g compose Phi^(-1))' compose Phi) = a g'
$
Also, $((b compose Phi^(-1)) compose Phi)=b$ and $((g compose Phi^(-1)) compose Phi)=g$ Therefore composing with $Phi$ gives
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
  g(x) = C exp(integral_(x_0)^x (1-b(t))/(a(t)) dif t)
$
This recovers the previous cases: if $b=0$, then $g$ is a scalar multiple of $exp(integral (1/a))$, while if $b=1$, then $g$ is constant.

#strong[Degenerate example 1]
Now consider the operator
$
  L f := x f'
$
This is the simplest example where the coefficient of $f'$ vanishes, so the previous change of variables cannot be applied globally.

Suppose that $f in C^oo (RR)$ and that for every $x in RR$, the limit
$
  g(x) := lim_(n -> oo) L^n f(x)
$
exists.

We will use the following form of the Phragmen-Lindelof uniqueness theorem.

*Theorem.* Let $H: CC -> CC$ be entire. Suppose there are constants $C,A>0$, $tau>=0$, $alpha>tau$, and $T in RR$ such that
$
  abs(H(z)) <= C exp(tau abs(z))
$
for every $z in CC$, and
$
  abs(H(t)) <= A exp(alpha t)
$
for every real $t<=T$. Then $H=0$.

We will show that $f$ is affine. The proof has three steps: conjugate $L$ to the ordinary derivative on each half-line, control the growth of the resulting entire functions, and use their behaviour near $0$ to force them to be affine-exponential.

Fix $sigma in {-1,1}$ and define
$
  I_sigma := cases(
    (0,oo) & "if" sigma=1,
    (-oo,0) & "if" sigma=-1,
  )
$
and
$
  Phi_sigma: I_sigma --> RR, quad Phi_sigma (x) := log(sigma x).
$
Then $Phi_sigma$ is a smooth diffeomorphism with inverse
$
  Phi_sigma^(-1): RR --> I_sigma, quad Phi_sigma^(-1) (y)=sigma exp(y).
$
Define
$
  F_sigma := f compose Phi_sigma^(-1): RR --> RR.
$
*Claim 1:* For every $n>=0$,
$
  F_sigma^((n)) = (L^n f) compose Phi_sigma^(-1).
$
*Verification:* Since
$
  (Phi_sigma^(-1))'=Phi_sigma^(-1),
$
the chain rule gives
$
  F_sigma ' & = (f' compose Phi_sigma^(-1)) (Phi_sigma^(-1))' \
            & = (f' compose Phi_sigma^(-1)) Phi_sigma^(-1) \
            & = (L f) compose Phi_sigma^(-1).
$
Applying the same computation to $L f$ gives
$
  F_sigma '' & = ((L f)' compose Phi_sigma^(-1)) (Phi_sigma^(-1))' \
             & = ((L f)' compose Phi_sigma^(-1)) Phi_sigma^(-1) \
             & = (L^2 f) compose Phi_sigma^(-1).
$
Applying the identity inductively,
$
  F_sigma^((n)) = (L^n f) compose Phi_sigma^(-1)
$
for every $n>=0$. $square$

By Claim 1, the original derivative result applies to $F_sigma$, so $F_sigma$ is the restriction of an entire function, which we continue to denote by $F_sigma$. Set
$
  a:=f(0), quad b:=f'(0),
$
and define the entire function
$
  H_sigma (z) := F_sigma (z)-a-sigma b exp(z).
$

*Claim 2:* There is a constant $C_sigma>0$ such that
$
  abs(H_sigma (z)) <= C_sigma exp(abs(z))
$
for every $z in CC$.

*Verification:* Since $Phi_sigma^(-1) (0)=sigma$, we have
$
  F_sigma^((n)) (0) = (L^n f)(sigma).
$
Thus the sequence $(F_sigma^((n)) (0))_(n=0)^oo$ converges and is therefore bounded. Choose $M_sigma>0$ such that
$
  abs(F_sigma^((n)) (0)) <= M_sigma
$
for every $n>=0$. The Taylor series of $F_sigma$ at $0$ then gives, for every $z in CC$,
$
  abs(F_sigma (z))
  <= sum_(n=0)^oo frac(M_sigma, n!) abs(z)^n
  = M_sigma exp(abs(z)).
$
Since $abs(exp(z))<=exp(abs(z))$, it follows that
$
  abs(H_sigma (z))
  <= (M_sigma+abs(a)+abs(b)) exp(abs(z)).
$
Thus we may take $C_sigma=M_sigma+abs(a)+abs(b)$.
$square$

*Claim 3:* There are constants $K>0$ and $Y in RR$ such that
$
  abs(H_sigma (y)) <= K exp(2y)
$
for every real $y<=Y$.

*Verification:* By Taylor's theorem, there are constants $delta,K>0$ such that
$
  abs(f(x)-a-b x) <= K x^2
$
whenever $abs(x)<delta$. Choose $Y in RR$ such that $exp(Y)<delta$. If $y<=Y$, then
$
  abs(Phi_sigma^(-1) (y))=exp(y)<delta,
$
and hence
$
  abs(F_sigma (y)-a-b Phi_sigma^(-1) (y))
  <= K exp(2y).
$
Since $Phi_sigma^(-1) (y)=sigma exp(y)$, this is exactly
$
  abs(H_sigma (y)) <= K exp(2y)
$
for every real $y<=Y$. $square$

Claims 2 and 3 verify the two growth hypotheses of the Phragmen-Lindelof uniqueness theorem with $tau=1$ and $alpha=2$. Therefore $H_sigma=0$, and hence
$
  F_sigma (y)=a+b Phi_sigma^(-1) (y)
$
for every $y in RR$. Composing this identity with $Phi_sigma$ gives
$
  f(x)=a+b x
$
for every $x in I_sigma$.

Since $sigma in {-1,1}$ was arbitrary, this identity holds on both half-lines. Since $f(0)=a$, we conclude that
$
  f(x)=a+b x
$
for every $x in RR$.

It follows that
$
  L f(x)=x f'(x)=b x
$
and
$
  L(b x)=b x.
$
Thus $L^n f(x)=b x$ for every $n>=1$, and consequently
$
  g(x)=b x.
$
In particular, $g$ is smooth and satisfies
$
  L g = g.
$

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

*Why $C_- != 0$ in general:*
The constant $C_+$ need not be zero. On the negative half-line, $x->0^-$ corresponds to $y->oo$, where $F_-$ is bounded and $exp(-y)->0$, forcing $C_-=0$. On the positive half-line, $x->0^+$ corresponds instead to $y->-oo$, where $exp(-y)->oo$, so the same argument fails. Indeed, for any $C in RR$, the smooth function
$
  f_C (x)=cases(C exp(-1/x)\, & x>0, 0\, & x<=0)
$
satisfies $L f_C=f_C$. Hence $L^n f_C=f_C$ for every $n$, showing that any value $C_+=C$ can occur.


#strong[Three important spaces]
Let $L: C^oo (RR) -> C^oo (RR)$ be a linear differential operator, and define
$
  A := {h in C^oo (RR) mid(|) lim_(n -> oo) L^n h(x) = 0 "for every" x in RR}
$
This is the transient space. Define
$
  B := {f in C^oo (RR) mid(|) lim_(n -> oo) L^n f(x) "exists for every" x in RR}
$
This is the input space. Finally, define
$
  C := {g in C^oo (RR) mid(|) L g = g}
$
This is the fixed-point space.

The following decomposition holds once the main regularity property has been proved for the operator $L$: assume that for every $f in B$, the pointwise limit
$
  g(x) := lim_(n -> oo) L^n f(x)
$
belongs to $C^oo (RR)$ and satisfies $L g = g$. Under this hypothesis,
$
  B = A + C
$

First let $f in B$, and define
$
  g(x) := lim_(n -> oo) L^n f(x)
$
By the hypothesis, $g in C$. Let
$
  h := f - g
$
Then $h in C^oo (RR)$, and for every $x in RR$,
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
Since $L g = g$, we have $L^n g = g$ for every $n >= 0$. Hence, for every $x in RR$,
$
  L^n f(x)
  = L^n h(x) + L^n g(x)
  = L^n h(x) + g(x)
  -> g(x)
$
Therefore the limit $lim_(n -> oo) L^n f(x)$ exists for every $x in RR$, so $f in B$. Hence
$
  A + C subset.eq B
$

Combining the two inclusions gives
$
  B = A + C
$


------------

$
  f(x) = f(0) + f'(0)x + h_1 (x)x
$

$
  lim_(x->0) h_1 (x) =0.
$

$
       x (dif f)/(dif x) & = f'(0)x + x(h_1 ' (x)x +h_1 (x)) \
                         & = f'(0) x + h_1 (x) x + h_1 ' (x) x^2 \
                         & = f(x) - f(0) + h_1 ' (x) x^2 \
  x (dif (x f'))/(dif x) & = x f' (x) + x(h_1 '' (x) x^2 + h_1 ' (x) 2x) \
                         & = f(x) - f(0) + 3 x^2 h_1 '(x) + x^3 h_1 '' (x)
$

Inductively define
$
  h_n (x) = h_n (0) + h_n ' (0) x + h_(n+1) (x) x,\
  lim_(x -> 0) h_n (x) =0.
$

$
  h_n (x) = h_n (0) + x (h_n ' (0) + h_(n+1)(0)) + x^2 (h_(n+1) ' (0) + h_(n+2) (x))
$

$
  h_1 (x) = h_1 (0) + sum_(k=1)^(N) (h_(k) ' (0) + h_(k+1) (0))x^k + h_(N+1) ' (0)x^(N+1) + h_(N+2) (x) x^(N+1)
$

