#import "layout.typ": setup_layout

#let unindented(body) = {
  set par(first-line-indent: 0em)

  body
}

#let institution(internal: false) = {
  set par(leading: 0.5em, first-line-indent: 0em, justify: false)
    align(center)[
      #text(weight: "bold")[
        #if not internal [
          #block(above: 0.5em)[
            МІНІСТЕРСТВО ОСВІТИ І НАУКИ УКРАЇНИ
          ]
          #parbreak()
          #block(above: 0.5em)[
            Відокремлений структурний підрозділ
          ]
        ] else [
          #block(above: 0.5em)[
            ВІДОКРЕМЛЕНИЙ СТРУКТУРНИЙ ПІДРОЗДІЛ
          ]
        ]
        #parbreak()
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
      м. #city — #today.year()
    ]
  ]
}

#let work_title(
  title: none,
  discipline: none,
  specialty: none,
  base: none,
  lecturer: none,
  commission: none,
  commission_head: none,
  protocol_num: none,
  protocol_date: none,
) = {
  align(horizon)[
    #heading(outlined: false, numbering: none)[#title]

    з дисципліни: #discipline

    спеціальність: #specialty

    на базі: #base

    #grid(
      columns: (1fr, 1fr),
      none,
      align(left)[
        #set par(leading: 1em)
        Розробив викладач: #lecturer

        Розглянуто та затверджено на засіданні ЦК #commission

        Протокол №#protocol_num від #protocol_date

        Голова ЦК #commission_head
      ]
    )
  ]
}

#let project(
  city: "Кам’янське",
  title: none,
  group: none,
  specialty: none,
  discipline: none,
  base: "повної загальної середньої освіти",
  lecturer: none,
  commission: none,
  commission_head: none,
  protocol_num: none,
  protocol_date: none,
  body,
) = {
  show: setup_layout
    // Title Page
  page(numbering: none)[
    #unindented[
      #institution()
      #work_title(
        title: title,
        discipline: discipline,
        specialty: specialty,
        base: base,
        lecturer: lecturer,
        commission: commission,
        commission_head: commission_head,
        protocol_num: protocol_num,
        protocol_date: protocol_date,
      )
      #city_and_year(city: city)
    ]
  ]

  body
}