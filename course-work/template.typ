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
      м. #city
      
      #today.year()
    ]
  ]
}

#let cycle_commission(
  commission_name: none
) = {
  set par(leading: 0.5em, first-line-indent: 0em, justify: false)
  align(center)[
    #block(above: 2em)[
      #block(above: 0.5em)[
        Циклова комісія #lower[#commission_name]
      ]
    ]
  ]
}

#let work_title(
  title: none,
  discipline: none,
  course_num: "IV",
  group: none,
  knowledge_branch: none,
  specialty: none,
  student_name: none,
  supervisor_name: none,
  supervisor_title: none,
  commission_members: ()
) = {
  set par(justify: false)
  align(horizon)[
    #align(center)[
      #heading(outlined: false, numbering: none)[Курсова робота]
      З дисципліни «#discipline»
      #parbreak()
      на тему: «*#title*»
    ]
    
    #text(size: 12pt)[
      #block(above: 2em)[
        #grid(
          columns: (1fr, 1fr),
          none,
          align(left)[
            #set par(leading: 1em)
            Студента #underline[#course_num] курсу,
            #parbreak()
            групи #underline[#group]
            #parbreak()
            галузі знань #knowledge_branch
            #parbreak()
            спеціальності #specialty 
            #parbreak()
            #underline[#student_name]
            #parbreak()
            Керівник #underline[#supervisor_name, #supervisor_title]
            #parbreak()
            Національна шкала  `___________________`
            #parbreak()
            Кількість балів `_____` Оцінка ECTS `______`
            #block(above: 2em)[
              Члени комісії:
              #parbreak()
              #for m in commission_members {
                [`_____________` #m]
                parbreak()
              }
            ]
          ]
        )
      ]
    ]
  ]
}

#let task_table(
  department_name,
  commission_name,
  specialty,
) = {
  set par(leading: 0.5em, justify: false)
  text(size: 12pt)[
    #table(
      columns: (1fr, 1fr),
      stroke: none,
      [Відділення], [#department_name], 
      [Циклова комісія], [#commission_name], 
      [Спеціальність], [#specialty], 
    )
  ]
}

#let task_header(
  department_name: none,
  commission_name: none,
  commission_short: "ПЗ та ПМ",
  knowledge_branch: none,
  specialty: none,
  commission_head_name: "J. Jr. Doe",
) = {
  task_table(department_name, commission_name, specialty)

  grid(
    columns: (1fr, 1fr),
    none,
    align(left)[
      #set par(justify: false)
      #block(above: 0.5em)[Затверджую:]
      #parbreak()
      #block(above: 1em)[
        Гол. циклової комісії #commission_short
      ]
      #block(above: 1em)[
        `_________` #commission_head_name
      ]
       #block(above: 1em)[
        протокол № `___` від `_________`
      ]
    ]
  )

  align(center)[
    #v(4em, weak: true)
    #block(above: 2em)[
      #heading(level: 2, numbering: none, outlined: false)[ЗАВДАННЯ]
    ]

    #block(above: 1em, below: 0em)[
      #par(leading: 0.5em)[
        на курсову роботу
      ]
    ]
  ]
}

#let task_body(
  to_whom: none,
  group: none,
  work_name: none,
  work_due_to: none,
  supervisor_full: none,
  initial_data: "Initial data to the work is these.",
) = {
  block(above: 1em)[
    #set par(leading: 1em, first-line-indent: 0em)
    Здобувачу освіти #underline[#to_whom] групи #underline[#group].
    #parbreak()
    Тема курсової роботи: «*#work_name*»
    #parbreak()
    Строк подання здобувачем освіти роботи #work_due_to.
  ]

  align(center)[
    #v(2em, weak: true)
    #block(above: 2em)[
      #heading(outlined: false, numbering: none, level: 2)[Початкові дані]
    ]
  ]
  underline[#initial_data]
}

#let task_calendar_plan(
  plan: ()
) = {
  align(center)[
    #heading(outlined: false, numbering: none)[КАЛЕНДАРНИЙ ПЛАН]
  ]
  
  set par(justify: false, leading: 1em)
  
  text(size: 12pt)[
    #table(
      columns: (auto, 1fr, 30%),
      align: center + horizon,
      table.header(
        [№ з/п],
        [Назва етапів дипломної роботи],
        [Строк виконання етапів роботи]
      ),
      ..for (i, v) in plan.enumerate(start: 1) {
        (str(i), v.at(0), v.at(1))
      }
    )
  ]
}

#let task_signature(task_received_at: none) = {
  let sign_field = align(center)[
    #par(justify: false, leading: 0.5em)[
      #text(size: 10pt)[(підпис, прізвище та ініціали)]
    ]
  ]
  align(left + bottom)[
    #grid(
      columns: (3fr, 1fr),
      grid(
        columns: (1fr, 1fr),
        inset: 0.3em,
        [Дата видачі завдання:], [#underline[#task_received_at]],
        [], [],
        [Здобувач освіти:],
        [`_________________________`],
        [], [#sign_field],
        [Керівник роботи:],
        [`_________________________`],
        [], [#sign_field],
      ),
      none
    )
  ]
}

#let grade_header(
  student_name: none,
  group: none,
) = {
  block(above: 2em)[
    #unindented[
      #block(above: 2em)[
        Здобувач освіти #underline[#student_name] групи #underline[#group].
      ]
    ]
  ]
}

#let grade_title(title: none) = {
  align(horizon)[
    Тема курсової роботи: «*#title*»
  ]
}

#let grades(
  supervisor_name: none,
  performance_supervisor_name: none
) = {
  align(bottom)[
    #heading(outlined: false, numbering: none)[Оцінки по роботі]

    #table(
      columns: (1.5fr, 1fr, auto, auto),
      rows: 2em,
      align: center + horizon,
      table.header(
        [Найменування роботи],
        [Керівник],
        [Оцінка],
        [Підпис]
      ),
      [Зміст пояснювальної записки],[#supervisor_name],[],[],
      [Якість програмного додатку],[#supervisor_name],[],[],
      [Захист роботи],[#supervisor_name],[],[],
      [Нормоконтроль],[#performance_supervisor_name],[],[],
      [*Загальна оцінка*],[],[],[],
    )
  ]
}

#let project(
  student_name: none,
  student_name_genitive: none,
  group: none,
  course_num: none,
  city: "Кам’янське",
  department_name: "технолого-економічне",
  commission_name: "Програмного забезпечення та прикладної математики",
  commission_name_short: "ПЗ та ПМ",
  knowledge_branch: "12 Інформаційні технології",
  specialty: "121 “Інженерія програмного забезпечення”",
  discipline: none,
  title: none,
  work_due_to: none,
  task_received_at: none,
  supervisor_name: none,
  supervisor_title: none,
  commission_head_name: none,
  commission_members: none,
  calendar_plan_data: (),
  initial_data: (),
  abstract: none,
  body
) = {
  show: setup_layout

  // Title Page
  page(numbering: none)[
    #unindented[
      #institution()
        #cycle_commission(commission_name: commission_name)
        #work_title(
          discipline: discipline,
          title: title,
          course_num: course_num,
          group: group,
          knowledge_branch: knowledge_branch,
          specialty: specialty,
          student_name: student_name,
          supervisor_name: supervisor_name,
          supervisor_title: supervisor_title,
          commission_members: commission_members
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
        knowledge_branch: knowledge_branch,
        specialty: specialty,
        commission_head_name: commission_head_name,
      )
      #task_body(
        to_whom: student_name_genitive,
        group: group,
        work_name: title,
        work_due_to: work_due_to,
        initial_data: initial_data
      )
    ]
  ]

  page(numbering: none)[
    #unindented[
      #task_calendar_plan(plan: calendar_plan_data)
      #task_signature(task_received_at: task_received_at)
    ]
  ]

  // Grade Page
  page(numbering: none)[
    #unindented[
      #institution()
      #grade_header(
        student_name: student_name,
        group: group,
      )
      #grade_title(title: title)
      #grades(
        supervisor_name: supervisor_name,
        performance_supervisor_name: commission_head_name
      )
    ]
  ]

  // Abstract
  page(numbering: none)[
    #heading(outlined: false, numbering: none)[РЕФЕРАТ]
    #abstract
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