#import "layout.typ": setup_layout

#let unindented(body) = {
  set par(first-line-indent: 0em)

  body
}

#let institution(internal: false) = {
  set par(leading: 0.5em, first-line-indent: 0em, justify: false)

  align(center)[
      #text(weight: "bold")[
        #block(above: 0em)[
          МІНІСТЕРСТВО ОСВІТИ І НАУКИ УКРАЇНИ
        ]
        #block(above: 0.5em)[
          Відокремлений структурний підрозділ
        ]
        #block(above: 0.5em)[
          «ТЕХНОЛОГІЧНИЙ ФАХОВИЙ КОЛЕДЖ ДНІПРОВСЬКОГО ДЕРЖАВНОГО ТЕХНІЧНОГО УНІВЕРСИТЕТУ»
        ]
      ]
  ]
}

#let city_and_year(city: none) = {
  let today = datetime.today()
  
  align(bottom)[
    #align(center)[
      м. #city
      
      #today.year()
    ]
  ]
}

#let work_title(
  title: none,
  disciplines: (),
) = {
  align(horizon + center)[
    Методичні рекомендації до виконання курсової роботи
    з дисциплін 
    #text(weight: "bold")[
      #disciplines.map(v => [«#v»]).join(", ", last: " та ")
    ]
    на тему: #text(weight: "bold")[#title]
  ]
}

#let redacting(
  redactors: (),
  reviewer: none,
  commission_name: none,
  commission_head: none,
  meeting_at: none,
  meeting_protocol: none,
  accepted_at: none,
  accepted_protocol: none,
) = {
  par[
    *Укладачі:* #redactors.map(((name, title)) => [#text(weight: "bold")[#name] #title]).join(", "). // that last dot belongs to the printed text
  ]
  
  par[
    Погоджено на засіданні циклової комісії «#commission_name» ВСП ТФК ДДТУ #meeting_at протокол № #meeting_protocol.
  ]

  par[
    Голова ЦК `_________` #commission_head.
  ]

  par[
      Ухвалено на засіданні науково-методичної ради коледжу #accepted_at
      протокол № #accepted_protocol.
  ]

  par[
    *Рецезент:* #reviewer.
  ]
}

#let project(
  title: none,
  disciplines: (),
  redactors: (),
  reviewer: none,
  commission_name: none,
  commission_head: none,
  meeting_at: none,
  meeting_protocol: none,
  accepted_at: none,
  accepted_protocol: none,
  city: "Кам’янське",
  body
) = {
  show: setup_layout

  // Title page
  page(numbering: none)[
    #unindented[
      #institution()
      #work_title(
        title: title,
        disciplines: disciplines
      )
      #city_and_year(city: city)
    ]
  ]

  // Authors page
  page(numbering: none)[
    #redacting(
      redactors: redactors,
      reviewer: reviewer,
      commission_name: commission_name,
      commission_head: commission_head,
      meeting_at: meeting_at,
      meeting_protocol: meeting_protocol,
      accepted_at: accepted_at,
      accepted_protocol: accepted_protocol
    )
  ]

  page(numbering: none)[
    #outline(indent: 1.25em, depth: 2, target: heading.where().before(<end_main>))
  ]

  show table: set table(
    inset: 7pt, 
    stroke: (0.5pt + luma(200)), 
    align: center + horizon
  )

  pagebreak()
  body
}