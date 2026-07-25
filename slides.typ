#import "@preview/touying:0.7.4": *
#import themes.university: *
#import "@preview/thmbox:0.3.0": thmbox

#import "@preview/numbly:0.1.0": numbly

#let thm = thmbox.with(
  color: rgb("#C5283D"),
  variant: [Theorem],
  fill: rgb("#fdf1f2"),
  numbering: none,
  sans: false,
  title-fonts: ("Libertinus Serif",),
)

#show: university-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Iteration of linear differential operators],
    author: [Jake Edmonstone and Matthew Tchouikine],
    date: datetime.today(),
    institution: [
      #emph[Mentor: Paul Cusson]
      #linebreak()
      #emph[University of Waterloo, Directed Reading Program]
    ],
  ),
)

#set heading(numbering: numbly("{1}.", default: "1.1"))
#set text(size: 19pt)

#title-slide(authors: ([Jake Edmonstone], [Matthew Tchouikine]))

= The original problem

== Iterating the derivative

#align(center)[
  #emph[After differentiating forever, what can remain?]
]

#thm[
  Let $D = upright(d)/(upright(d)x)$ and let $f in C^infinity(RR)$. Suppose that
  $
    g(x) := lim_(n -> infinity) D^n f(x)
  $
  exists for every $x in RR$. Then $g$ is smooth and satisfies
  $
    g'=g.
  $
  Hence $g(x)=C exp(x)$ for some $C in RR$.
]

- If $f$ is a polynomial, then $D^n f -> 0$.
- If $f=exp+p$ with $p$ a polynomial, then $D^n f -> exp$.
- The difficulty: pointwise convergence alone does not let us interchange a limit and a derivative.

== Tao's analyticity theorem

#thm[
  Let $f in C^infinity(RR)$ and define
  $
    M(x):=sup_(k>=0) abs(f^((k))(x)).
  $
  If $M(x)<infinity$ for every $x in RR$, then $f$ is the restriction of an entire function.
]

#grid(
  columns: (1fr, 1fr),
  gutter: 1.2em,
  [
    *Why it applies*

    For each fixed $x$, the sequence
    $
      (f^((n))(x))_(n>=0)
    $
    converges, so it is bounded.
  ],
  [
    *What it gives*

    The pointwise hypothesis secretly forces global analytic rigidity and the estimate
    $
      abs(f^((k))(x)) <= M(0) exp(abs(x)).
    $
  ],
)

The proof uses Baire category to turn pointwise bounds into local uniform control, followed by Taylor's theorem.

== The limit equation $g'=g$

For $a,b in RR$, the Fundamental Theorem of Calculus gives
$
  f^((n))(a)-f^((n))(b)
  = integral_b^a f^((n+1))(x) upright(d)x.
$

The analytic estimate supplies a common integrable bound on every compact interval. Dominated convergence therefore gives
$
  g(a)-g(b)=integral_b^a g(x) upright(d)x.
$

Consequently, $g$ is continuous and
$
  g'(a)=g(a).
$

#align(center)[
  #thm[
    Every possible limit is of the form $g(x)=C exp(x)$.
  ]
]

= Extensions and examples

== The operator $L f=a f'$

Assume $a in C^infinity (RR)$ is nowhere zero and
$
  (L f)(x)=a(x)f'(x).
$

Straighten the vector field with
$
  Phi(x):=integral_0^x 1/(a(t)) upright(d)t,
  quad F:=f compose Phi^(-1).
$
Then
$
  F^((n))=(L^n f) compose Phi^(-1).
$

The ordinary-derivative result applied to $F$ yields:

#thm[
  If $L^n f(x)$ converges pointwise to $g(x)$, then
  $
    L g=g,
    quad "equivalently" quad a g'=g.
  $
]

== The operator $L f=a f'+f$

Again assume that $a$ is nowhere zero, but now let
$
  L f=a f'+f.
$

With the same coordinate $y=Phi(x)$, introduce the integrating factor
$
  F(y):=exp(y)f(Phi^(-1)(y)).
$
Then
$
  F^((n))(y)
  =exp(y)(L^n f)(Phi^(-1)(y)).
$

#thm[
  If $L^n f$ converges pointwise to $g$, then $L g=g$. In this special case,
  $
    a g'+g=g,
  $
  so $g'=0$: every possible limit is constant.
]

== The operator $L f=a f'+b f$

Let $a,b in C^infinity(RR)$ with $a$ nowhere zero, and set
$
  L f=a f'+b f.
$

The coordinate change $y=Phi(x)$ and the integrating factor
$
  W(y):=exp(integral_(y_0)^y b(Phi^(-1)(s)) upright(d)s)
$
transform iteration of $L$ into ordinary differentiation.

#thm[
  If $L^n f$ converges pointwise to $g$, then
  $
    L g=g.
  $
  Thus either $g=0$, or
  $
    g(x)=C exp(integral_(x_0)^x (1-b(t))/(a(t)) upright(d)t).
  $
]

== A simple zero: $L f=x f'$

Now the coefficient of $f'$ vanishes, so there is no single global change of coordinates.

On each half-line, use
$
  y=log abs(x).
$
This turns $x D$ into ordinary differentiation. The two half-line solutions must then be matched smoothly at $0$.

#thm[
  If $(x D)^n f(x)$ converges for every $x$, then
  $
    f(x)=alpha+beta x
  $
  and
  $
    g(x)=beta x.
  $
]

The simple zero is still rigid: smoothness at the origin forces the two sides to agree.

== A double zero: $L f=x^2 f'$

Use the coordinate
$
  y=-1/x
$
separately on the two half-lines.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    $x>0$

    $x->0^+$ corresponds to $y->-infinity$.

    A flat eigenfunction can survive.
  ],
  [
    $x<0$

    $x->0^-$ corresponds to $y->+infinity$.

    Boundedness forces the eigenfunction coefficient to vanish.
  ],
)

#thm[
  Every pointwise limit has the form
  $
    g(x)=cases(
      C exp(-1/x)\, & x>0,
      0\, & x<=0.
    )
  $
  Every $C in RR$ can occur.
]

== One proof in detail: the double zero

Define $Phi_+(x)=-1/x$ on $(0,infinity)$ and
$
  F_+:=f compose Phi_+^(-1).
$
The chain rule gives
$
  F_+^((n))=(L^n f) compose Phi_+^(-1).
$

Thus the local ordinary-derivative result gives
$
  G_+(y):=lim_(n->infinity)F_+^((n))(y)=C_+ exp(y),
$
and hence $g(x)=C_+ exp(-1/x)$ for $x>0$.

On $x<0$, the same calculation gives $G_-(y)=C_- exp(y)$. But
$
  F_-(y)=f(-1/y)->f(0)
$
as $y->infinity$, so $F_-$ is bounded and $C_-=0$. Smooth gluing at $0$ finishes the proof.

== The spaces $A$, $B$, and $C$

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 0.8em,
  [
    #align(center)[*Transient*]
    $
      A={h: L^n h -> 0}.
    $
  ],
  [
    #align(center)[*Inputs*]
    $
      B={f: L^n f " converges"}.
    $
  ],
  [
    #align(center)[*Fixed points*]
    $
      C={g: L g=g}.
    $
  ],
)

Whenever pointwise limits are smooth and satisfy $L g=g$,
$
  B=A+C.
$

Indeed, if $f in B$ and $g=lim_n L^n f$, then
$
  f=(f-g)+g,
  quad f-g in A,
  quad g in C.
$

Conversely, $h in A$ and $g in C$ imply
$
  L^n (h+g)=L^n h+g -> g.
$

= Future directions

== Open problems and next steps

- *Zeros of the leading coefficient:* classify the limits when $a$ vanishes to arbitrary order or changes sign.

- *Higher-order operators:* understand iteration of
  $
    L=sum_(k=0)^m a_k (x) D^k.
  $

- *Other notions of convergence:* replace pointwise convergence by convergence in $C^k$, $L^p$, or distributional topologies.

- *Dynamics and spectrum:* interpret
  $
    f mapsto lim_(n->infinity) L^n f
  $
  as a projection onto the fixed-point space.

#align(center)[
  #emph[How much of a function can survive infinite iteration?]
]

#focus-slide[
  Questions?
]
