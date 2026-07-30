#import "@preview/touying:0.7.4": *
#import themes.university: *

// Record the stronger conclusion for this special case.

== $L_3 f := a f' + b f$

#new-section-slide(level: 2)[]

=== Absorb the zeroth-order term

#slide(
  config: config-page(margin: (top: 2em, bottom: 1.5em, x: 1.6em)),
  align: top,
  setting: body => {
    set text(size: 25pt)
    set block(spacing: 0.8em)
    pad(top: 0.4em, body)
  },
)[
  Let $a, b in C^oo (RR)$, with $a$ nowhere zero, and suppose
  $ lim_(n->oo) L_3^n f(x)=g(x) $ for every $x in RR$.

  As in the $a f'$ case, set
  $
    Phi(x) := integral_0^x 1/(a(t)) dif t quad (x in RR),
    quad I := Phi(RR),
    quad beta := b compose Phi^(-1): I -> RR.
  $
  For $y in I$, define
  $
    w(y) := exp(integral_0^y beta(s) dif s),
    quad H := w dot (f compose Phi^(-1)).
  $
]


=== Iterate derivatives of $H$

#slide(
  config: config-page(margin: (top: 2em, bottom: 1.5em, x: 1.6em)),
  align: top,
  setting: body => {
    set text(size: 24pt)
    set block(spacing: 0.9em)
    pad(top: 0.4em, body)
  },
)[
  The chain rule gives
  $
    H' = w dot (L_3 f) compose Phi^(-1).
  $
  By induction, we have that for $n>=0$,
  $
    H^((n)) = w dot (L_3^n f) compose Phi^(-1)
  $

  Therefore, the pointwise limit is
  $
    G(y) & := lim_(n->oo) H^((n))(y) \
         & = lim_(n->oo) w(y) (L^n_3 f)(Phi^(-1)(y)) \
         & = w(y) g(Phi^(-1)(y)).
  $
  The local ordinary derivative result on $I$ gives $G'=G$.
]

=== Recover the fixed-point equation

#slide(
  config: config-page(margin: (top: 2em, bottom: 1.5em, x: 1.6em)),
  align: top,
  setting: body => {
    set text(size: 24pt)
    set block(spacing: 0.9em)
    pad(top: 0.4em, body)
  },
)[
  Since
  $
    g(x) = G(Phi(x)) / w(Phi(x)),
  $
  $g$ is smooth. Applying the same chain-rule computation to $g$
  gives
  $
    G'(y) = w(y) (L_3 g)(Phi^(-1)(y)).
  $
  Since
  $
    G'=G=w(y) g(Phi^(-1)(y))
  $
  and $w(y)>0$, we conclude that
  $L_3 g = g.$
]
