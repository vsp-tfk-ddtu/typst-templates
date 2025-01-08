#import "layout.typ": setup_layout

#let unindented(body) = {
  set par(first-line-indent: 0em)

  body
}

#let institution(internal: false) = {
  par(leading: 0.5em, first-line-indent: 0em, justify: false)[
    #align(center)[
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

#let cycle_commission(
  commission_name: none
) = {
  align(center)[
    #block(above: 2em)[
      #par(leading: 0.5em, first-line-indent: 0em, justify: false)[
        #block(above: 0.5em)[
          Циклова комісія #lower[#commission_name]
        ]
      ]
    ]
  ]
}

#let work_title(
  title: none, 
  course_num: none, 
  group: none,
  knowledge_branch: none,
  specialty: none,
  student_name: none,
  supervisor_name: none,
) = {
  align(horizon)[
    #align(center)[
      #heading(outlined: false, numbering: none)[Звіт]
      #block(above: 2em)[
        З навчальної практики з #title
      ]
    ]

    #block(above: 2em)[
      #grid(
        columns: (1fr, 1fr),
        none,
        align(left)[
          #par(justify: false, leading: 1em)[
            Виконав: здобувач освіти #underline[#course_num] курсу
            #parbreak()
            Групи #underline[#group]
            #parbreak()
            Галузі знань #underline[#knowledge_branch]
            #parbreak()
            Спеціальності #underline[#specialty] 
            #parbreak()
            #underline[#student_name]
            #parbreak()
            Керівник #underline[#supervisor_name ]
            #parbreak()
            Оцінка:
            #parbreak()
            #grid(
              columns: (1fr, 1fr),
              align: left,
              row-gutter: 1.5em,
              [Національна шкала], [`_______________`],
              [Кількість балів], [`_______________`],
              [Оцінка ECTS], [`_______________`],
            )
          ]
        ]
      )
    ]
  ]
}

#let project(
  department_name: none,
  commission_name: none,
  course_num: none,
  group: none,
  knowledge_branch: none,
  specialty: none,
  student_name: none,
  city: "Кам’янське",
  title: none,
  supervisor_name: none,
  body
) = {
  show: setup_layout

    // Title Page
  page(numbering: none)[
    #unindented[
      #institution()
      #cycle_commission(commission_name: commission_name)
      #work_title(  title: title, 
  course_num: course_num, 
  group: group,
  knowledge_branch: knowledge_branch,
  specialty: specialty,
  student_name: student_name,
  supervisor_name: supervisor_name)
      #city_and_year(city: city)
    ]
  ]

  page(numbering: none)[
    #outline(indent: 1.25em)
  ]

  body
}