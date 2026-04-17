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

#let department(
  department_name: none,
  commission_name: none
) = {
  set par(leading: 0.5em, first-line-indent: 0em, justify: false)
  align(center)[
    #block(above: 2em)[
      #block(above: 0.5em)[
        Відділення #department_name
      ]
      #parbreak()
      #block(above: 0.5em)[
        Циклова комісія #lower[#commission_name]
      ]
    ]
  ]
}

#let work_title(
  title: none,
  course_num: "IV",
  group: none,
  qualification_level: none,
  knowledge_branch: none,
  specialty: none,
  student_name: none,
  supervisor_name: none
) = {
  align(horizon)[
    #align(center)[
      #heading(outlined: false, numbering: none)[ЗВІТ]
      про проходження переддипломної практики
      #parbreak()
    ]
    
    #block(above: 2em)[
      #grid(
        columns: (1fr, 1fr),
        none,
        align(left)[
            #set par(justify: false, leading: 1em)
            Виконав: здобувач освіти #course_num курсу,
            #parbreak()
            групи #underline[#group]
            #parbreak()
            освітньо-кваліфікаційний рівень: #underline[#qualification_level]
            #parbreak()
            галузі знань #knowledge_branch
            #parbreak()
            спеціальності #specialty 
            #parbreak()
            #underline[#student_name]
            #parbreak()
            Керівник #underline[#supervisor_name]
        ]
      )
    ]
  ]
}

#let task_table(
  department_name,
  commission_name,
  klnowledge_branch,
  specialty,
) = {
  set par(leading: 0.5em, justify: false)
  text(size: 12pt)[
    #table(
      columns: (1fr, 1fr),
      stroke: none,
      [Відділення], [#department_name], 
      [Циклова комісія], [#commission_name], 
      [Освітньо-кваліфікаційний рівень], [Фаховий молодший бакалавр], 
      [Галузь знань], [#klnowledge_branch], 
      [Спеціальність], [#specialty], 
    )
  ]
}

#let task_header(
  department_name: none,
  commission_name: none,
  commission_short: "ПЗ та ПМ",
  klnowledge_branch: none,
  specialty: none,
  commission_head_name: "J. Jr. Doe",
  protocol_num: none,
  protocol_date: none,
) = {
  task_table(department_name, commission_name, klnowledge_branch, specialty)

  set par(justify: false)
  grid(
    columns: (1fr, 1fr),
    none,
    align(left)[
      #block(above: 0.5em)[Затверджую:]
      #parbreak()
      #block(above: 1em)[
        Гол. циклової комісії #commission_short
      ]
      #block(above: 1em)[
        `_________` #commission_head_name
      ]
        #block(above: 1em)[
        протокол № #underline[#protocol_num] від #underline[#protocol_date]
      ]
    ]
  )
}

#let task_body(
  to_whom: none,
  work_title: none,
  questions: ()
) = {
    align(center)[
      #block(above: 2em)[
        #heading(level: 2, numbering: none, outlined: false)[ІНДІВИДУАЛЬНЕ ЗАВДАННЯ]
      ]
      #block(above: 1em, below: 0em)[
          #par[
            #text(weight: "bold")[на виконання програми переддипломної практики]
          ]
          
      ]
    ]
    align(center)[
      #block(above: 1em, below: 1em)[
        #heading(level: 3, numbering: none, outlined: false)[#underline[#to_whom]]
      ]
    ]
    [Тема роботи: #work_title]
    align(center)[
      #block(above: 1em, below: 1em)[
        #heading(level: 3, numbering: none, outlined: false)[Перелік питань:]
      ]
    ]
    for (i, v) in questions.enumerate() [
      + #v
    ]
}

#let task_signature() = {
  let sign_field = align(center)[
    #text(size: 10pt)[(підпис, ім'я та прізвище)]
  ]
  align(bottom)[
    #grid(
        columns: (1fr, auto),
        inset: 0.3em,
        [Здобувач освіти:],[`_________________________`],
        [], [#sign_field],
        [Керівник роботи:],[`_________________________`],
        [], [#sign_field],
      )
  ]
}

#let project(
  student_name: none,
  student_name_genitive: none,
  group: none,
  course_num: none,
  city: none,
  department_name: none,
  commission_name: none,
  commission_name_short: none,
  qualification_level: none,
  knowledge_branch: none,
  specialty: none,
  supervisor_name: none,
  commission_head_name: none,
  title: none,
  protocol_num: none,
  protocol_date: none,
  
  questions: (),
  body
) = {
  show: setup_layout
  
  // Title Page
  page(numbering: none)[
    #unindented[
      #institution()
      #department(
        department_name: department_name, 
        commission_name: commission_name
      )
      #work_title(
        student_name: student_name,
        course_num: course_num,
        group: group,
        qualification_level: qualification_level,
        knowledge_branch: knowledge_branch,
        specialty: specialty,
        supervisor_name: supervisor_name
      )
      #city_and_year(city: city)
    ]
  ]

  // Task Page
  page(numbering: none)[
    #unindented[
      #institution()
      #task_header(
        department_name: department_name,
        commission_name: commission_name,
        commission_short: commission_name_short,
        klnowledge_branch: knowledge_branch,
        specialty: specialty,
        commission_head_name: commission_head_name,
        protocol_num: protocol_num,
        protocol_date: protocol_date
      )
      #task_body(
        to_whom: student_name_genitive,
        work_title: title,
        questions: questions
      )
      #task_signature()
    ]
  ]

  page(numbering: none)[
    #outline(indent: 1.25em)
  ]

  show table: set table(
    inset: 7pt, 
    stroke: (0.5pt + luma(200)), 
    align: center + horizon
  )

  body
}