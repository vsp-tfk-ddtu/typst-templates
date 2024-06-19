#import "@preview/indenta:0.0.3": fix-indent

#set text(
  font: "Times New Roman",
  size: 14pt,
  lang: "ua",
  region: "ua"
)

#set page(
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

#set heading(numbering: "1.")

#show heading: it => [
  #block(above: 1em, below: 1em)[#it]
]

#show heading.where(level: 1): set align(center)

#set par(first-line-indent: 1.25cm, justify: true, leading: 1.5em)

#show: fix-indent()

// ==========================================

#let unindented(body) = {
  set par(first-line-indent: 0em)

  body
}

#let institution() = {
  par(leading: 0.5em, first-line-indent: 0em, justify: false)[
    #align(center)[
          #text(weight: "bold")[
            #block(above: 0.5em)[
              МІНІСТЕРСТВО ОСВІТИ І НАУКИ УКРАЇНИ
            ]
            #parbreak()
            #block(above: 0.5em)[
              Відокремлений структурний підрозділ
            ]
            #parbreak()
            #block(above: 0.5em)[
              «ТЕХНОЛОГІЧНИЙ ФАХОВИЙ КОЛЕДЖ ДНІПРОВСЬКОГО ДЕРЖАВНОГО ТЕХНІЧНОГО УНІВЕРСИТЕТУ»
            ]
          ]
    ]
  ]
}

#let department(
  name: none,
  commission: none
) = {
  align(center)[
    #block(above: 2em)[
      #par(leading: 0.5em, first-line-indent: 0em, justify: false)[
        #block(above: 0.5em)[
          Відділення #name
        ]
        #parbreak()
        #block(above: 0.5em)[
          Циклова комісія #lower[#commission]
        ]
      ]
    ]
  ]
}

#let work_title(
  name: none,
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
        #par(leading: 0.5em)[
          на тему: «*#name*»
        ]
      ]
    ]
    
    #block(above: 2em)[
      #grid(
        columns: (1fr, 1fr),
        none,
        align(left)[
          #par(justify: false)[
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
        ]
      )
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

#let task_table(
  department_name,
  commission_name,
  klnowledge_branch,
  specialty,
) = {
  par(leading: 0.5em, justify: false)[
    #text(size: 12pt)[
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

  grid(
    columns: (1fr, 1fr),
    none,
    align(left)[
      #par(justify: false)[
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
    ]
  )

  align(center)[
    #block(above: 2em)[
      #heading(level: 2, numbering: none, outlined: false)[ЗАВДАННЯ]
    ]
    #block(above: 1em, below: 0em)[
      #par(leading: 0.5em)[
        #heading(level: 2, numbering: none, outlined: false)[
          НА КВАЛІФІКАЦІЙНУ РОБОТУ ЗДОБУВАЧУ ОСВІТИ
        ]
      ]
    ]
  ]
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
    text(size: 12pt)[
      #{""}
      #par(leading: 1em, first-line-indent: 0em)[
        #align(center)[#to_whom]
        #parbreak()
        Тема роботи: “#emph[#work_name]“
        #parbreak()
        керівник роботи: #supervisor_full
        #parbreak()
        затверджені наказом навчального  закладу від «`__`» `______` 20`__` року № `__`
        Строк подання здобувачем освіти роботи #work_due_to
        #parbreak()
        Вихідні дані до роботи: #emph[#underline[#initial_data]]
        #parbreak()
        Зміст розрахунково-пояснювальної записки (перелік питань, які потрібно розробити): #emph[#underline[#work_content]]
        #parbreak()
        Перелік графічного матеріалу (з точним зазначенням обов’язкових креслень): #emph[#underline[#graphic_material]]
      ]
  ]
}

#let task_consultants(
  issue_date: "24 червня 2024"
) = {
  par(justify: false, leading: 0.5em)[
    Консультанти розділів роботи:

    #text(size: 12pt)[
      #table(
        columns: (1fr, 1fr, 1fr, 1fr),
        rows: 2em,
        align: center + horizon,
        table.header(
          table.cell(rowspan: 2)[Розділ],
          table.cell(rowspan: 2)[Прізвище, ініціали та посада консультанта],
          table.cell(colspan: 2)[Підпис, дата],
          [Завдання видав],
          [Завдання прийняв]
        ),
        [Основна частина],[],[],[],
        [Економічна частина],[],[],[],
        [Охорона праці],[],[],[],
        [Нормоконтроль],[],[],[],
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
  
  par(justify: false, leading: 0.5em)[
    #text(size: 12pt)[
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
  ""
  par(justify: false)[
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
        Здобувач освіти #underline[#student_name] групи #underline[#group]
      ]
    ]
  ]
}

#let grade_title(title: none) = {
  par(justify: false, leading: 0.5em)[
    #text(size: 12pt)[
      #align(horizon)[
        #grid(
          columns: (auto, 1fr),
          align: top,
          [Тема кваліфікаційної роботи:], [#underline[«#title»]]
        )
      ]
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

// Variables
#let student_name = "ДОЕ Джон"
#let student_name_genitive = "Іванченко Петру Миколайовичу"
#let group = "ІПЗ-21-9-д"
#let course_num = "IV"
#let city = "Кам’янське"

#let department_name = "технолого-економічне"
#let commission_name = "Програмного забезпечення та прикладної математики"
#let commission_name_short = "ПЗ та ПМ"
#let knowledge_branch = "12 Інформаційні технології"
#let specialty = "121 “Інженерія програмного забезпечення”"

#let supervisor_name = "ЕЙНШТЕЙН Альберт"
#let reviewer_name = "КЮРІ Марія"
#let commission_head_name = "Schwarzeneger Arnold"
#let economy_supervisor_name = "Jackson Andy"
#let work_health_supervisor_name = "Hoffa Jimmy"
#let performance_supervisor_name = "CURIE Marie"

#let title = "Проектування та розробка найкращого проекту, першої сторінки інтернету"
#let work_due_to = "24 червня 2024"
#let supervisor_title = "Викладач"

#let initial_data = "Розробити супер-класний проект по всім сучасним правилам і стандартам. Передбачити використання сервісу через клієнт за протоколами REST та gRPC. Використати реляційну СУБД як сховище даних."
#let work_content = "мета роботи, аналіз проблемної галузі та постановка задачі, перелік вимог до програмної системи, опис об’єктних моделей, використовувані методи та алгоритми, структура бази даних, опис розробленої програмної системи, аналіз дослідної експлуатації та можливих застосувать. Додатки: а) слайди презентації, б) код програм."
#let graphic_material = "Слайди презентації, титульний лист, мета роботи, постановка задачі, вибір середовища розробки, об’єктна модель проблемної галузі, інтерфейс програмної системи, економічна частина, охорона праці, висновки."

#let calendar_plan_data = (
  ("Аналіз проблемної галузі та постановка задачі", "17.05.24 — 20.05.24"),
  ("Перелік вимог до програмної системи", "20.05.24 — 24.05.24"),
  ("Опис прийнятих проектних рішень", "24.05.24 — 29.05.24"),
  ("Розробка програмного додатку", "29.05.24 — 07.06.24"),
  ("Опис розробленої програмної системи", "07.06.24 — 10.06.24"),
  ("Аналіз дослідної експлуатації і можливих застосувань", "10.06.24 — 13.06.24"),
  ("Економічна частина", "10.6.24 — 13.06.24"),
  ("Охорона праці", "13.06.24 — 14.06.24"),
  ("Графічна частина (презентація), вступ, висновки, реферат, перелік посилань, реферат", "12.06.24 — 17.06.24"),
  ("Нормоконтроль", "17.06.24"),
  ("Підпис голови ЦК", "17.06.24 — 18.06.24"),
  ("Рецензування", "17.06.24 — 18.06.24"),
  ("Захист ДР", "24.06.24"),
)

// Title Page
#unindented[
  #institution()
  #department(
    name: department_name, 
    commission: commission_name
  )
  #work_title(
    name: title,
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

#pagebreak()

// Task Page (actually, two pages)
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

  #pagebreak()

  #task_consultants()
  #task_calendar_plan(plan: calendar_plan_data)
  #task_signature()
]

#pagebreak()

// Grade Page
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

#pagebreak()

#outline(indent: 1.25em)

#pagebreak()

// Diploma starts here :tada:

#heading(numbering: none)[ВСТУП] <start>

#lorem(200)

#pagebreak()

= Основна частина

== Before header

#lorem(50)

=== Small Header one

text

=== Small Header two

text

Now, let's display an image:

#figure(
  caption: "Ян Вермеер — Die Malkunst 1",
)[
  #image(
    "images/jan_vermeer.png",
  )
]

Now, let's display a second image:

#figure(
  caption: "Ян Вермеер — Die Malkunst 2",
)[
  #image(
    "images/jan_vermeer.png",
  )
]

#pagebreak()

== Аналіз проблемної галузі

For the first example, let's display some code:

#figure(
  caption: "Rust code example",
)[
  ```rust
fn add(a: i32, b: i32) -> i32 {
    a + b
}
```
]

Another one.

#figure(
  caption: "Ян Вермеер — Die Malkunst 3",
)[
  #image(
    "images/jan_vermeer.png",
  )
]

#lorem(200)

=== Постановка задачі

#lorem(400)

#pagebreak()

== Перелік вимог до програмної системи

#lorem(200)

#pagebreak()

== Аналіз дослідної експлуатації

Now, let's display an image:

#figure(
  caption: "Ян Вермеер — Die Malkunst",
)[
  #image(
    "images/jan_vermeer.png",
  )
]

#figure(
  caption: "Table",
)[
  #table(
    columns: (1fr, 1fr),
    [one],[two],
    [three],[four]
  )
]

#heading(numbering: none)[ВИСНОВОК]

#lorem(200)

#pagebreak()

#heading(numbering: none)[ПЕРЕЛІК ПОСИЛАНЬ]
