#let stroke-color = luma(200)
#let fill-color = luma(250)

#let set_layout(alternate_margins: false, body) = {
  set text(
    font: "Noto Serif",
    size: 12pt,
    lang: "en",
    region: "ua"
  )

  set page(
    paper: "a4",
    margin: if alternate_margins {
      (
        top: 1.5cm,
        bottom: 2cm,
        inside: 2cm,
        outside: 1cm,
      )
    } else {
      (
        top: 1.5cm,
        bottom: 2cm,
        left: 2cm,
        right: 2cm,
      )
    },
    numbering: "1/1"
  )

  set heading(numbering: none)

  show heading: set block(above: 1.5em, below: 1em)

  set par(leading: 1em, justify: true)

  show table: set table(inset: (7pt, 10pt), stroke: (0.5pt + stroke-color))
  show link: underline
  show link: set text(fill: rgb("e32400"))
  show raw: set text(font: "Fira Mono")
  
  body
}