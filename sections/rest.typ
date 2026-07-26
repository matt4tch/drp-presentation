#import "@preview/touying:0.7.4": *
#import themes.university: *

= Future directions

== Structure and open problems

// Present the transient, input, and fixed-point spaces.
=== The spaces $A$, $B$, and $C$

#slide(
  config: config-page(margin: (top: 2em, bottom: 1.5em, x: 1.6em)),
  align: top,
  setting: body => {
    set text(size: 22pt)
    set block(spacing: 0.80em)
    pad(top: 0.6em, body)
  },
)[
  For a linear differential operator $L: C^oo (RR) -> C^oo (RR)$, define

  $
    A := {h in C^oo (RR) bar.v lim_(n -> oo) L^n h(x) = 0
      " for every " x in RR}.
  $
  *Transient space:* the iterates of $h$ disappear pointwise.

  $
    B := {f in C^oo (RR) bar.v lim_(n -> oo) L^n f(x)
      " exists for every " x in RR}.
  $
  *Input space:* these are precisely the functions for which the iteration
  problem makes sense.

  $
    C := {g in C^oo (RR) bar.v L g = g}.
  $
  *Fixed-point space:* every iterate of $g$ is already equal to $g$.
]

=== Why $B = A + C$

#slide(
  config: config-page(margin: (top: 2em, bottom: 1.5em, x: 1.6em)),
  align: top,
  setting: body => {
    set text(size: 22pt)
    set block(spacing: 0.55em)
    pad(top: 0.6em, body)
  },
)[
  Assume every pointwise limit of iterates is smooth and fixed by $L$.
  If $f in B$, let
  $
    g(x) := lim_(n -> oo) L^n f(x), quad h := f - g.
  $
  Then $g in C$, while
  $
    L^n h = L^n f - g -> 0,
  $
  so $h in A$. Hence $f = h + g in A + C$.

  Conversely, if $f = h + g$ with $h in A$ and $g in C$, then
  $
    L^n f = L^n h + g -> g.
  $
  Thus $f in B$, and therefore
  $
    B = A + C.
  $

  In other words: *every convergent orbit is a transient part plus its
  limiting fixed point.*
]

=== Beyond first-order ODEs

#slide(
  config: config-page(margin: (top: 2em, bottom: 1.5em, x: 1.6em)),
  align: top,
  setting: body => {
    set text(size: 21pt)
    set block(spacing: 0.45em)
    pad(top: 0.4em, body)
  },
)[
  The guiding question is:
  $
    L^n f -> g " pointwise" quad ==> quad g in C^oo " and " L g = g?
  $

  *1. Higher-order ODEs.* Study
  $
    L f(x) = sum_(k=0)^m a_k (x) f^((k))(x), quad m >= 2.
  $
  Which conditions on the coefficients recover local derivative bounds when
  the first-order change of coordinates is unavailable?

  *2. Partial differential operators.* For
  $
    L f(x) = sum_(abs(alpha) <= m) a_alpha (x) partial^alpha f(x)
    quad "on" quad RR^d,
  $
  Begin with constant-coefficient or elliptic operators. Can their regularity
  theory justify passing the limit through $L$?

]

#focus-slide[
  Questions?
]
