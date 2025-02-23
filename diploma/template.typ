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
  klnowledge_branch: none,
  specialty: none,
  student_name: none,
  supervisor_name: none,
  reviewer_name: none
) = {
  align(horizon)[
    #align(center)[
      #heading(outlined: false, numbering: none)[Пояснювальна записка]
      до кваліфікаційної роботи
      #parbreak()
      #text(size: 12pt)[
       Освітньо-кваліфікаційний рівень:
        #block(above: 0.5em)[
          молодший спеціаліст
        ]
        #block(above: 0.5em)[
          (фаховий молодший бакалавр)
        ]
      ]
      #block(above: 2em)[
        на тему: «*#title*»
      ]
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
            галузі знань #klnowledge_branch
            #parbreak()
            спеціальності #specialty 
            #parbreak()
            #underline[#student_name]
            #parbreak()
            Керівник #underline[#supervisor_name]
            #parbreak()
            Рецезент #underline[#reviewer_name]
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
      [Освітньо-кваліфікаційний рівень], [Молодший спеціаліст], 
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
        протокол № `___` від `_________`
      ]
    ]
  )
}

#let task_body(
  to_whom: "Іванченко Петру Миколайовичу",
  work_name: none,
  work_due_to: none,
  supervisor_full: none,
  initial_data: "Initial data to the work is these.",
  work_content: "A set of questions that has to be worked out.",
  graphic_material: "A graphic material with a set of necessary figures."
) = {
    align(center)[
      #block(above: 2em)[
        #heading(level: 2, numbering: none, outlined: false)[ЗАВДАННЯ]
      ]
      #block(above: 1em, below: 0em)[
          #heading(level: 2, numbering: none, outlined: false)[
            НА КВАЛІФІКАЦІЙНУ РОБОТУ ЗДОБУВАЧУ ОСВІТИ
          ]
      ]
    ]

    text(size: 12pt)[
      #{""}  // How to avoid this?
      #set par(leading: 1em, first-line-indent: 0em)
      #align(center)[#to_whom]
      #parbreak()
      Тема роботи: “#emph[#work_name]“
      #parbreak()
      керівник роботи: #supervisor_full
      #parbreak()
      затверджені наказом навчального  закладу від «`__`» `______` 20`__` року № `__`.
      #parbreak()
      Строк подання здобувачем освіти роботи #work_due_to.
      #parbreak()
      Вихідні дані до роботи: #emph[#underline[#initial_data]]
      #parbreak()
      Зміст розрахунково-пояснювальної записки (перелік питань, які потрібно розробити): #emph[#underline[#work_content]]
      #parbreak()
      Перелік графічного матеріалу (з точним зазначенням обов’язкових креслень): #emph[#underline[#graphic_material]]
  ]
}

#let task_consultants(
  issue_date: "24 червня 2024",
  main_part: none,
  economy_part: none,
  work_health: none,
  formatting: none
) = {
  set par(justify: false, leading: 0.5em)
  [
    Консультанти розділів роботи:

    #text(size: 12pt)[
      #table(
        columns: (1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        table.header(
          table.cell(rowspan: 2)[Розділ],
          table.cell(rowspan: 2)[Прізвище, ініціали та посада консультанта],
          table.cell(colspan: 2)[Підпис, дата],
          [Завдання видав],
          [Завдання прийняв]
        ),
        [Основна частина],[#main_part],[],[],
        [Економічна частина],[#economy_part],[],[],
        [Охорона праці],[#work_health],[],[],
        [Нормоконтроль],[#formatting],[],[],
      )
    ]
    #align(right)[
      Дата видачі завдання: #underline[#issue_date].
    ]
  ]
}

#let task_calendar_plan(
  plan: ()
) = {
  align(center)[
    #heading(outlined: false, numbering: none)[КАЛЕНДАРНИЙ ПЛАН]
  ]
  
  set par(justify: false, leading: 0.5em)
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

#let task_signature() = {
  let sign_field = align(center)[
    #par(justify: false, leading: 0.5em)[
      #text(size: 10pt)[(підпис, прізвище та ініціали)]
    ]
  ]
  align(right)[
    #grid(
      columns: (1fr, 1.5fr),
      none,
      grid(
        columns: (1fr, 1.5fr),
        inset: 0.3em,
        [Здобувач освіти:],
        [`_________________________`],
        [], [#sign_field],
        [Керівник роботи:],
        [`_________________________`],
        [], [#sign_field],
      )
    )
  ]
}

#let grade_header(
  department_name: none,
  commission_short: none,
  specialty: none,
  student_name: none,
  group: none,
  title: none
) = {
  set par(justify: false)
  block(above: 2em)[
    #text(size: 12pt)[
      #grid(
        columns: (auto, 1fr),
        align: (left, right),
        [Відділення #department_name], [Циклова комісія #commission_short]
      )
      #parbreak()
      #grid(
        columns: (auto, 1fr),
        align: (left, right),
        [Спеціальність], [#specialty]
      )
      #parbreak()
      #block(above: 2em)[
        Здобувач освіти #underline[#student_name] групи #underline[#group].
      ]
    ]
  ]
}

#let grade_title(title: none) = {
  set par(justify: false, leading: 0.5em)
  text(size: 12pt)[
    #align(horizon)[
      #grid(
        columns: (auto, 1fr),
        align: top,
        [Тема кваліфікаційної роботи:], [#underline[«#title»]]
      )
    ]
  ]
}

#let grades(
  supervisor_name: none,
  economy_supervisor_name: none,
  work_health_supervisor_name: none,
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
      [Рівень підготовки дипломної роботи],[#supervisor_name],[],[],
      [Економічна частина],[#economy_supervisor_name],[],[],
      [Розділ з охорони праці],[#work_health_supervisor_name],[],[],
      [Виступ здобувача освіти],[#performance_supervisor_name],[],[],
      [*Загальна оцінка*],[],[],[],
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
  knowledge_branch: none,
  specialty: none,
  supervisor_name: none,
  reviewer_name: none,
  commission_head_name: none,
  economy_supervisor_name: none,
  work_health_supervisor_name: none,
  performance_supervisor_name: none,
  formatting_supervisor_name: none,
  title: none,
  work_due_to: none,
  supervisor_title: none,
  initial_data: none,
  work_content: none,
  graphic_material: none,
  calendar_plan_data: (),
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
        title: title,
        course_num: course_num,
        group: group,
        klnowledge_branch: knowledge_branch,
        specialty: specialty,
        student_name: student_name,
        supervisor_name: supervisor_name,
        reviewer_name: reviewer_name
      )
      #city_and_year(city: city)
    ]
  ]

  // Task Page (actually, two pages)
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
      )
      #task_body(
        to_whom: student_name_genitive,
        work_name: title,
        work_due_to: work_due_to,
        supervisor_full: supervisor_name + ", " + supervisor_title,
        initial_data: initial_data,
        work_content: work_content,
        graphic_material: graphic_material
      )
    ]
  ]

  page(numbering: none)[
    #unindented[
      #task_consultants(
        main_part: supervisor_name,
        economy_part: economy_supervisor_name,
        work_health: work_health_supervisor_name,
        formatting: formatting_supervisor_name
      )
      #task_calendar_plan(plan: calendar_plan_data)
      #task_signature()
    ]
  ]

  // Grade Page
  page(numbering: none)[
    #unindented[
      #institution()
      #grade_header(
        department_name: department_name,
        commission_short: commission_name_short,
        specialty: specialty,
        student_name: student_name,
        group: group,
        title: title
      )
      #grade_title(title: title)
      #grades(
        supervisor_name: supervisor_name,
        economy_supervisor_name: economy_supervisor_name,
        work_health_supervisor_name: work_health_supervisor_name,
        performance_supervisor_name: performance_supervisor_name
      )
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