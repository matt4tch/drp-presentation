#import "@preview/touying:0.7.4": *
#import themes.university: *

// Record the stronger conclusion for this special case.

== $L_3 f := a f' + b f$

#new-section-slide(level: 2)[]

=== Absorbing the zeroth-order term

#slide(
  config: config-page(margin: (top: 2em, bottom: 1.5em, x: 1.6em)),
  align: top,
  setting: body => {
    set text(size: 21pt)
    set block(spacing: 0.7em)
    pad(top: 0.4em, body)
  },
)[
  Let $a, b in C^oo (RR)$, with $a$ nowhere zero, and suppose
  $L_3^n f -> g$ pointwise on $RR$.

  As in the $a f'$ case, set
  $
    Phi(x) := integral_0^x 1/(a(t)) dif t quad (x in RR),
    quad I := Phi(RR),
    quad beta := b compose Phi^(-1): I -> RR.
  $
  For $y in I$, define
  $
    w(y) := exp(integral_0^y beta(s) dif s),
    quad (T f)(y) := w(y) f(Phi^(-1)(y)).
  $

  The chain rule gives
  $
    T(L_3 f) = (T f)', quad
    T(L_3^n f) = (T f)^((n)).
  $

  Thus $ lim_(n->oo) (T f)^((n)) = T g. $

  The ordinary derivative result gives $T(L_3 g) = (T g)' = T g$. Since $T$ is injective, *$L_3 g = g$.*
]
