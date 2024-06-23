#import "@preview/indenta:0.0.3": fix-indent

#let setup_document(body) = {
  set text(
    font: "Times New Roman",
    size: 14pt,
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
      let start_pagination = counter(page).at(<start>).at(0);
      if numbers.pos().at(0) < start_pagination {
        return;
      }
      return numbers.pos().at(0);
    },
    number-align: center + top
  )

  set heading(numbering: "1.")

  show heading: it => [
    #block(above: 1em, below: 1em)[#it]
  ]

  show heading.where(level: 1): set align(center)

  set par(first-line-indent: 1.25cm, justify: true, leading: 1.5em)

  show: fix-indent()

  body
}