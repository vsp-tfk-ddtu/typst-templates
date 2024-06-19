#import "@preview/indenta:0.0.3": fix-indent
#import "common.typ": unindented, institution, city_and_year
#import "course_work_template.typ": *

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

// =====================================

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

#let discipline = "Конструювання програмного забезпечення"
#let title = "Практичне застосування патерну проектування Decorator у мові програмування Python"

#let work_due_to = "24 червня 2024"
#let task_received_at = "24.02.2024"

#let supervisor_name = "ЧИЧИКОВ Павло"
#let supervisor_title = "Викладач"
#let commission_head_name = "СОБАКЕВИЧ Михайло"

#let commission_members = (
  "Чичиков П. Н.",
  "Коробочка А. В."
)

#let calendar_plan_data = (
  ("Аналіз проблемної галузі та постановка задачі", "02.02.2023 - 06.02.2023"),
  ("Опис прийнятих проектних рішень", "06.02.2023 - 09.02.2023"),
  ("Розробка програми", "09.02.2023 - 01.03.2023"),
  ("Опис розробленої програми", "01.03.2023 - 06.03.2023"),
  ("Графічна частина (презентація), вступ, висновки, перелік посилань, реферат", "06.03.2023 - 12.03.2023"),
  ("Попередній захист роботи", "13.03.2023"),
  ("Захист роботи", "14.03.2023"),
)

#let initial_data = [
  Початкові дані, що ми маємо наразі і які необхідні для вирішення даної курсової роботи. Ще одне речення. І ще одне. Дивіться приклад курсової роботи, щоб додати правильні початкові дані.
]

// Title Page
#unindented[
  #institution()
    #cycle_commission(commission_name: commission_name)
    #work_title(
      discipline: discipline,
      title: title,
      course_num: course_num,
      group: group,
      klnowledge_branch: knowledge_branch,
      specialty: specialty,
      student_name: student_name,
      supervisor_name: supervisor_name,
      supervisor_title: supervisor_title,
      commission_members: commission_members
    )
    #city_and_year(city: city)
]

#pagebreak()


// Task Page
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
    group: group,
    work_name: title,
    work_due_to: work_due_to,
    initial_data: initial_data
  )

  #pagebreak()

  #task_calendar_plan(plan: calendar_plan_data)
  #task_signature(task_received_at: task_received_at)
]

#pagebreak()

// Grade Page
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

#pagebreak()

#outline(indent: 1.25em)

#pagebreak()

#heading(numbering: none)[ВСТУП] <start>

#lorem(150)