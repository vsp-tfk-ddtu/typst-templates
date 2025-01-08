
#let project(
  subject: none,
  author: none,
  revision_date: none,
  type: none,
  hero_image: none,
  body
) = {
  align(center)[
    #show heading.where(level: 1): set align(center)
    #show heading: set block(above: 1em, below: 1em)
    #par(first-line-indent: 0em)[
      #text(size: 12pt)[
        #heading(numbering: none, outlined: false)[#subject]
        #author

        #revision_date

        #heading(numbering: none, outlined: false, level: 2)[#type]
      ]
    ]
    #if hero_image != none {
      hero_image
    } else {
      line(length: 100%)
    }
  ]

  body
}