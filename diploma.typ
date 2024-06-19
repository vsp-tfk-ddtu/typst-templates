#import "@preview/indenta:0.0.3": fix-indent
#import "common.typ": unindented, institution
#import "diploma_template.typ": *

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

// Variables
#let student_name = "ІВАНЧЕНКО Петро"
#let student_name_genitive = "Іванченко Петру Миколайовичу"
#let group = "ІПЗ-21-9-д"
#let course_num = "IV"
#let city = "Кам’янське"

#let department_name = "технолого-економічне"
#let commission_name = "Програмного забезпечення та прикладної математики"
#let commission_name_short = "ПЗ та ПМ"
#let knowledge_branch = "12 Інформаційні технології"
#let specialty = "121 “Інженерія програмного забезпечення”"

#let supervisor_name = "ЧИЧИКОВ Павло"
#let reviewer_name = "МАНИЛОВ Микола"
#let commission_head_name = "СОБАКЕВИЧ Михайло"
#let economy_supervisor_name = "КОРОБОЧКА Анастасія"
#let work_health_supervisor_name = "ПЛЮШКІН Григорій"
#let performance_supervisor_name = "СОБАКЕВИЧ Михайло"

#let title = "Проектування та розробка найкращого проекту у світі, першої сторінки інтернету"
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

#lorem(55)

#lorem(50)

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
