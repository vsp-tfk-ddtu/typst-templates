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
  subject: none,
  title: none,
  group: none,
  lecturer: none,
) = {
  align(horizon)[
    #heading(outlined: false, numbering: none)[Методична розробка]

    Відкритого заняття з дисципліни "#subject".
    
    На тему: "#title".
    
    Група: #group

    Викладач: #lecturer 
  ]
}

#let topic_block(
  topic: none,
  goal: none,
  basic-terminology: none,
  lesson-type: none,
  lesson-description: none,
) = [
  *Тема заняття*: #topic

  *Мета*: #goal

  *Основні терміни*: #basic-terminology

  *Вид заняття — #lesson-type*: #lesson-description
]

#let lesson_structure(structure: none) = {
  heading(numbering: none)[Структура заняття]
  
  set heading(numbering: "I.")
  show heading: set align(left)
  show heading: set text(size: 0.85em)
    show heading: it => [
    #block(above: 1em, below: 1em)[#it]
  ]

  structure
}

#let project(
  city: "Кам’янське",
  subject: none,
  title: none,
  group: none,
  lecturer: none,
  topic: none,
  goal: none,
  basic-terminology: none,
  lesson-type: none,
  lesson-description: none,
  structure: none,
  plan: none,
  body,
) = {
  show: setup_layout
    // Title Page
  page(numbering: none)[
    #unindented[
      #institution()
      #work_title(subject: subject, title: title, group: group, lecturer: lecturer)
      #city_and_year(city: city)
    ]
  ]

  page(numbering: none)[
    #unindented[
      #topic_block(
        topic: topic, 
        goal: goal, 
        basic-terminology: basic-terminology, 
        lesson-type: lesson-type, 
        lesson-description: lesson-description
      )
    ]
    #lesson_structure(structure: structure)

    #unindented[
      #heading(numbering: none)[План заняття]
      #plan
    ]
  ]

  body
}