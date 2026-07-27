#import "@preview/touying:0.7.4": *
#import themes.university: *

== $L_4 f := x f'$

#new-section-slide(level: 2)[]

=== A simple zero

#slide(
  config: config-page(margin: (top: 2em, bottom: 2em, x: 1.8em)),
  setting: body => {
    set text(size: 24pt)
    set block(spacing: 0.9em)
    body
  },
)[
  Suppose $g(x) := lim_(n -> oo) L_4^n f(x)$ exists pointwise.

  *Change coordinates.* For $sigma in {-1,1}$, set
  $
    Phi_sigma (x) := log(sigma x),
    quad
    F_sigma := f compose Phi_sigma^(-1).
  $
  $
    F_sigma^((n))
    = (L_4^n f) compose Phi_sigma^(-1).
  $
  The ordinary derivative result makes $F_sigma$ entire.

  *Remove the affine part.* If $a:=f(0)$ and $b:=f'(0)$, define
  $
    H_sigma (y) := F_sigma (y) - a - b Phi_sigma^(-1) (y).
  $

  *Apply Phragmén–Lindelöf.* It forces $H_sigma=0$. Hence
  $f(x)=a+b x$ on $RR$, so $g(x)=b x$ and $L_4 g=g$.
]
