#import "@preview/touying:0.7.4": *
#import themes.university: *
#import "@preview/thmbox:0.3.0": thmbox

#import "@preview/numbly:0.1.0": numbly

#let nospace = $#h(0pt)$


#let thm = thmbox.with(
  color: rgb("#245EA8"),
  variant: [Theorem 1],
  fill: rgb("#F1F5FA"),
  numbering: none,
  sans: false,
  title-fonts: ("Libertinus Serif",),
)

#let theme-primary = rgb("#04364A")
#let theme-secondary = rgb("#176B87")
#let theme-tertiary = rgb("#448C95")
#let intro-paper = rgb("#F5F3EF")
#let intro-border = rgb("#D7DEE2")
#let header-title-inset = 0.4em

#show: university-theme.with(
  aspect-ratio: "16-9",
  align: horizon,
  header: self => pad(
    top: header-title-inset,
    utils.display-current-heading(depth: self.slide-level, style: auto),
  ),
  header-right: self => pad(
    top: header-title-inset,
    context {
      let current = utils.current-heading(depth: self.slide-level)
      let parent-level = if current != none and current.level == 3 { 2 } else { 1 }
      (
        box(utils.display-current-heading(
          level: parent-level,
          depth: self.slide-level,
        ))
          + h(0.3em)
          + self.info.logo
      )
    },
  ),
  config-common(slide-level: 3),
  config-page(
    margin: (top: 2em, bottom: 2em, x: 2em),
  ),
  config-colors(
    primary: theme-primary,
    secondary: theme-secondary,
    tertiary: theme-tertiary,
  ),
  config-info(
    title: [Iteration of linear differential operators],
    author: [Jake Edmonstone, Matthew Tchouikine],
    date: datetime.today(),
    institution: [
      #emph[Mentor: Paul Cusson]
      #linebreak()
      #emph[University of Waterloo, Directed Research Program]
    ],
  ),
)

#set heading(numbering: numbly("{1}.", default: "1.1"))

#title-slide(authors: ([Jake Edmonstone], [Matthew Tchouikine]))

= The original problem

#slide(
  config: config-page(
    fill: intro-paper,
    margin: 1em,
    header: none,
    footer: none,
  ),
  align: horizon,
)[
  #set text(fill: theme-primary, weight: "regular")
  #align(center)[
    #block(
      fill: white,
      stroke: 0.8pt + intro-border,
      radius: 8pt,
      inset: 4pt,
    )[
      #image(
        "assets/mathoverflow/question-crop-left-tight.png",
        width: 650pt,
      )

      #place(bottom + right, dx: -12pt, dy: -12pt)[
        #block(
          width: 215pt,
          fill: white,
          stroke: 1.2pt + theme-secondary,
          radius: 7pt,
          inset: 4pt,
        )[
          #image(
            "assets/mathoverflow/paul-cusson-badge.png",
            width: 207pt,
          )
        ]
      ]
    ]
  ]
]

== The original question

Let $f in C^oo (RR)$, and write
$
  L_1 := frac(dif, dif x).
$

Suppose that for every $x in RR$ the pointwise limit
$
  g(x) := lim_(n -> oo) L_1^n f(x)
$
exists.

#strong[Question.] Must $g$ be smooth? Moreover, can we prove $L_1 g=g$?

#slide(
  config: config-page(
    fill: intro-paper,
    margin: 1em,
    header: none,
    footer: none,
  ),
  align: horizon,
)[
  #set text(fill: theme-primary, weight: "regular")
  #align(center)[
    #stack(
      dir: ttb,
      spacing: 12pt,
      align(center)[
        #text(size: 22pt, weight: "bold")[
          A direct answer:
        ]
      ],
      block(
        fill: white,
        stroke: 0.8pt + intro-border,
        radius: 8pt,
        inset: 4pt,
      )[
        #image(
          "assets/mathoverflow/tao-theorem.png",
          width: 640pt,
        )
      ],
      block(width: 650pt)[
        #grid(
          columns: (1fr, 155pt),
          column-gutter: 18pt,
          align: horizon,
          [
            #text(size: 16pt, weight: "bold")[
              The convergence hypothesis actually forces $f$ to be a restriction of an entire function.
            ]
          ],
          [
            #block(
              width: 155pt,
              fill: white,
              stroke: 1.2pt + theme-secondary,
              radius: 7pt,
              inset: 4pt,
            )[
              #image(
                "assets/mathoverflow/terence-tao-badge.png",
                width: 147pt,
              )
            ]
          ],
        )
      ],
    )
  ]
]

== Tao's analyticity theorem

// State the theorem and outline its role in the original problem.
#thm[
  Let $f in C^oo (RR)$, and suppose that for every $x in RR$,
  $
    M(x) := sup_(m >= 0) abs(f^((m)) (x)) < oo.
  $
  Then $f$ is the restriction to $RR$ of an entire function. Equivalently,
  $f$ is real analytic with infinite radius of convergence.
]

== Why Tao's theorem applies

For each fixed $x in RR$, the sequence
$
  (f^((n))(x))nospace_(n>=0)
$
converges, hence is bounded. Therefore
$
  M(x) = sup_(n>=0) abs(f^((n))(x)) < oo,
$
so Tao's theorem applies immediately: $f$ is the restriction of an entire
function.

== One bound for every derivative

Since $f$ is the restriction of an entire function, expand $f^((k))$ at $0$. Every coefficient is
controlled by the _single_ number $M(0)$:
$
       f^((k))(x) & = sum_(n=0)^oo (f^((n+k))(0))/(n!) x^n, \
  abs(f^((k))(x)) & <= sum_(n=0)^oo M(0)/(n!) abs(x)^n
                    = M(0) e(abs(x)).
$

Note that for all $n in NN$ and $x in [a,b]$,

$
  abs(f^((n+1))(x)) <= C_([a,b]) := sup_(x in [a,b]) M(0) e^(abs(x)) < oo.
$

== Pass the limit through the integral

#slide(
  config: config-page(margin: (top: 2em, bottom: 2em, x: 1.6em)),
  setting: body => {
    set text(size: 23pt)
    set block(spacing: 0.75em)
    body
  },
)[
  Fix $a<b$. For every $n$, the Fundamental Theorem of Calculus gives the identity
  $
    f^((n))(b)-f^((n))(a)
    = integral_a^b f^((n+1))(x) dif x
  $
  For $x in [a,b]$, we have
  $
    lim_(n->oo) f^((n+1))(x) = g(x)
    quad "and" quad
    abs(f^((n+1))(x)) <= C_([a,b]).
  $

  Therefore, by Lebesgue's Dominated Convergence Theorem,
  $
    lim_(n -> oo) integral_a^b f^((n+1))(x) dif x & = integral_a^b lim_(n -> oo) f^((n+1))(x) dif x \
                                                  & = integral_a^b g(x) dif x.
  $
]

== The limit is continuous

#slide(
  config: config-page(margin: (top: 2em, bottom: 2em, x: 1.6em)),
  setting: body => {
    set text(size: 26pt)
    set block(spacing: 0.9em)
    body
  },
)[
  Using the locally uniform bound from before, we show that $g$ is continuous,
  $
    g(b)-g(a) & = integral_a^b g(x) dif x, \
  $
  Therefore,
  $
    abs(g(b)-g(a)) & <= integral_a^b abs(g(x)) dif x \
                   & <= C_([a,b]) (b-a).
  $
]

== The limit satisfies $L_1 g=g$

#slide(
  config: config-page(margin: (top: 2em, bottom: 2em, x: 1.6em)),
  setting: body => {
    set text(size: 26pt)
    set block(spacing: 0.7em)
    body
  },
)[
  Fix $b$. The integral identity becomes
  $
    g(x) = g(b) + integral_b^x g(t) dif t.
  $
  Since $g$ is continuous, the Fundamental Theorem of Calculus yields
  $
    g'(x)=g(x).
  $

  Thus $L_1 g=g$, so $g$ is smooth. Solving the ODE gives
  $
    g(x)=C e^x
  $
  for some $C in RR$.
]

= Extensions

== $L_2 f:=a f'$

#new-section-slide(level: 2)[]

=== The result

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
    g(x):=lim_(n->oo) L_2^n f(x)
  $
  exists for every $x in RR$.

  We will show that
  $
    L_2 g=g.
  $
]

=== Straighten the operator

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
    Phi(x):=integral_0^x 1/(a(t)) dif t.
  $
  Since $a$ is nowhere zero, $Phi$ is a diffeomorphism from $RR$ onto an open interval
  $I:=Phi(RR)$. Set
  $
    F:=f compose Phi^(-1):I->RR.
  $
  The chain rule gives
  $
    F'=(L_2 f) compose Phi^(-1),
  $
  and therefore, for every $n>=0$,
  $
    F^((n))=(L_2^n f) compose Phi^(-1).
  $
]

=== Pull back the ordinary result

#slide(
  config: config-page(margin: (top: 2em, bottom: 2em, x: 1.6em)),
  setting: body => {
    set text(size: 22pt)
    set block(spacing: 0.5em)
    body
  },
)[
  Note that
  $
    lim_(n->oo) F^((n))(y) & = lim_(n->oo) (L_2^n f)(Phi^(-1)(y)) \
                           & = g(Phi^(-1)(y))
  $
  exists. So, we can define $ G(y):=lim_(n->oo) F^((n))(y). $
  The ordinary derivative result on the interval $I$ gives
  $
    G'=G.
  $
  Since $G= g compose Phi^(-1)$, then $g=G compose Phi$. Since $Phi'=1/a$ (by FTC), then
  $
    g'
    =(G' compose Phi) Phi'
    =(G compose Phi) 1/a
    =g/a.
  $
  Hence
  $
    L_2 g=g.
  $
]

== $L_3 f:=a f'+f$

#new-section-slide(level: 2)[]

=== The result

// Record the stronger conclusion for this special case.

== $L_4 f:=a f'+b f$

#new-section-slide(level: 2)[]

=== The result

// State the general nondegenerate first-order result.

== $L_5 f:=x f'$

#new-section-slide(level: 2)[]

=== A simple zero

// State the affine rigidity result.

== $L_6 f:=x^2 f'$

#new-section-slide(level: 2)[]

=== A double zero

// State the one-sided flat limit.


= Future directions

== Structure and open problems

// Present the transient, input, and fixed-point spaces.
=== The spaces $A$, $B$, and $C$

=== Open Problems

===
// Add the future directions for the project.

#focus-slide[
  Questions?
]
