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
    set text(size: 22pt)
    set block(spacing: 0.55em)
    pad(top: 0.5em, body)
  },
)[
  Let $a, b in C^oo (RR)$, with $a$ nowhere zero, and suppose
  $L_3^n f -> g$ pointwise.

  Use the same coordinate change as for $a f'$, together with an integrating
  factor, to define
  $
    Phi(x) := integral_0^x 1/(a(t)) dif t,
    quad beta := b compose Phi^(-1).
  $
  $
    w(y) := exp(integral_0^y beta(s) dif s),
    quad (T f)(y) := w(y) f(Phi^(-1)(y)).
  $

  The chain rule gives the conjugacy
  $
    T(L_3 f) = (T f)', quad
    T(L_3^n f) = (T f)^((n)).
  $

  Hence $(T f)^((n)) -> T g$. By the ordinary derivative result,
  $(T g)' = T g$. But $(T g)' = T(L_3 g)$, and $T$ is injective, so
  *$L_3 g = g$.*
]
