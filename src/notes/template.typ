
#let project(
  subject: none,
  author: none,
  revision_date: none,
  type: none,
  body
) = {
  align(center)[
    #show heading.where(level: 1): set align(center)
    #show heading: set block(above: 1em, below: 1em)
    #par(first-line-indent: 0em)[
      #text(size: 12pt)[
        #heading(numbering: none)[#subject]
        #author

        #revision_date

        #heading(numbering: none, level: 2)[#type]
      ]
    ]
    #line(length: 100%)
  ]

  body
}