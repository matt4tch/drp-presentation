#import "@preview/touying:0.7.4": *
#import themes.university: *

= Extensions

== $L_2 f := a f'$

#new-section-slide(level: 2)[]

=== The fixed-point equation

#slide(
  config: config-page(margin: (top: 2em, bottom: 2em, x: 1.6em)),
  setting: body => {
    set text(size: 26pt)
    set block(spacing: 0.75em)
    body
  },
)[
  Let $a in C^oo (RR)$ be nowhere zero, and define
  $
    L_2 f := a f'.
  $
  Suppose that the pointwise limit
  $
    g(x) := lim_(n -> oo) L_2^n f(x)
  $
  exists for every $x in RR$.

  We will show that
  $
    L_2 g = g.
  $
]

=== Change coordinates

#slide(
  config: config-page(margin: (top: 2em, bottom: 2em, x: 1.6em)),
  setting: body => {
    set text(size: 25pt)
    set block(spacing: 0.65em)
    body
  },
)[
  Introduce the new coordinate
  $
    Phi: RR -> RR, x mapsto integral_0^x 1/(a(t)) dif t.
  $
  Since $a$ is nowhere zero, $Phi$ is a diffeomorphism from $RR$ onto an open interval
  $I := Phi(RR)$. Set
  $
    F := f compose Phi^(-1): I -> RR.
  $
  The chain rule gives
  $
    F' = (L_2 f) compose Phi^(-1),
  $
  and therefore, for every $n >= 0$,
  $
    F^((n)) = (L_2^n f) compose Phi^(-1).
  $
]

=== Pull back the ordinary result

#slide(
  config: config-page(margin: (top: 2em, bottom: 2em, x: 1.6em)),
  setting: body => {
    set text(size: 24pt)
    set block(spacing: 1.7em)
    body
  },
)[
  Note that
  $
    lim_(n -> oo) F^((n))(y) & = lim_(n -> oo) (L_2^n f)(Phi^(-1)(y)) \
                             & = g(Phi^(-1)(y))
  $
  exists. So, we can define $G(y) := lim_(n -> oo) F^((n))(y)$.
  The ordinary derivative result on the interval $I$ gives
  $
    G' = G.
  $
]

=== Recover the fixed-point equation

#slide(
  config: config-page(margin: (top: 2em, bottom: 2em, x: 1.6em)),
  setting: body => {
    set text(size: 21pt)
    set block(spacing: 0.9em)
    body
  },
)[
  Since $G = g compose Phi^(-1)$, then $g = G compose Phi$. Since $Phi' = 1/a$ (by FTC), then
  $
    g' & = (G' compose Phi) dot Phi' \
       & = (G compose Phi) dot 1/a \
       & = g dot 1/a.
  $
  Hence
  $
    L_2 g & = a g' \
          & = a (g dot 1/a) \
          & = g.
  $
]
