#import "@preview/indenta:0.0.3": fix-indent

#let set_layout(body) = {
  set text(
    font: "Noto Serif",
    size: 12pt,
    lang: "ua",
    region: "ua"
  )

  set page(
    paper: "a4",
    margin: (
      top: 2cm,
      right: 1cm,
      bottom: 2cm,
      left: 2.5cm
    ),
    numbering: (..numbers) => {
      if numbers.pos().at(0) == 1 {
        return;
      }
      return numbers.pos().at(0);
    },
    number-align: center + top
  )

  set heading(numbering: "1.")

  show heading: set block(above: 2em, below: 1em)

  set par(leading: 0.7em, justify: true)
  show par: set block(spacing: 1.35em)

  show heading.where(level: 1): it => {
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    counter(figure.where(kind: raw)).update(0)
    it
  }

  set figure(numbering: num =>
    numbering("1.1", counter(heading).get().first(), num)
  )

  show: fix-indent()

  body
}