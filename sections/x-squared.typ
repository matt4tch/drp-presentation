#import "@preview/touying:0.7.4": *
#import themes.university: *

== $L_5 f := x^2 f'$

#new-section-slide(level: 2)[]

=== A second-order zero

#slide(
  config: config-page(margin: (top: 2em, bottom: 1.5em, x: 1.6em)),
  align: top,
  setting: body => {
    set text(size: 22pt)
    set block(spacing: 0.5em)
    pad(top: 0.6em, body)
  },
)[
  Suppose $g(x) := lim_(n -> oo) L_5^n f(x)$ exists pointwise.

  *Change coordinates.* On each half-line, $Phi(x) := -1/x$ turns
  $L_5$ into ordinary differentiation, so
  $
    g(x) = C_+ e^(-1/x) quad (x > 0),
    quad
    g(x) = C_- e^(-1/x) quad (x < 0).
  $

  *At the origin.* $lim_(x->0^(-))e^(-1/x) = oo$, so which forces
  $C_- = 0$. Also, $(L_5 h)(0) = 0$ for every smooth $h$, hence $g(0) = 0$.

  *Conclusion.*
  $
    g(x) = cases(
      C e^(-1/x) space & x > 0,
      0 & x <= 0,
    )
  $
  The right-hand term vanishes at $0$. Therefore $g in C^oo (RR)$ and $L_5 g = g$.
]
