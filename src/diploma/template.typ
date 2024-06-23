#import "diploma.typ": *

// #let student_name = "ІВАНЧЕНКО Петро"
// #let student_name_genitive = "Іванченко Петру Миколайовичу"
// #let group = "ІПЗ-21-9-д"
// #let course_num = "IV"
// #let city = "Кам’янське"

// #let department_name = "технолого-економічне"
// #let commission_name = "Програмного забезпечення та прикладної математики"
// #let commission_name_short = "ПЗ та ПМ"
// #let knowledge_branch = "12 Інформаційні технології"
// #let specialty = "121 “Інженерія програмного забезпечення”"

// #let supervisor_name = "ЧИЧИКОВ Павло"
// #let reviewer_name = "МАНИЛОВ Микола"
// #let commission_head_name = "СОБАКЕВИЧ Михайло"
// #let economy_supervisor_name = "КОРОБОЧКА Анастасія"
// #let work_health_supervisor_name = "ПЛЮШКІН Григорій"
// #let performance_supervisor_name = "СОБАКЕВИЧ Михайло"
// #let formatting_supervisor_name = "СОБАКЕВИЧ Михайло"

// #let title = "Проектування та розробка найкращого проекту у світі, першої сторінки інтернету"
// #let work_due_to = "24 червня 2024"
// #let supervisor_title = "Викладач"

// #let initial_data = "Розробити супер-класний проект по всім сучасним правилам і стандартам. Передбачити використання сервісу через клієнт за протоколами REST та gRPC. Використати реляційну СУБД як сховище даних."
// #let work_content = "мета роботи, аналіз проблемної галузі та постановка задачі, перелік вимог до програмної системи, опис об’єктних моделей, використовувані методи та алгоритми, структура бази даних, опис розробленої програмної системи, аналіз дослідної експлуатації та можливих застосувать. Додатки: а) слайди презентації, б) код програм."
// #let graphic_material = "Слайди презентації, титульний лист, мета роботи, постановка задачі, вибір середовища розробки, об’єктна модель проблемної галузі, інтерфейс програмної системи, економічна частина, охорона праці, висновки."

// #let calendar_plan_data = (
//   ("Аналіз проблемної галузі та постановка задачі", "17.05.24 — 20.05.24"),
//   ("Перелік вимог до програмної системи", "20.05.24 — 24.05.24"),
//   ("Опис прийнятих проектних рішень", "24.05.24 — 29.05.24"),
//   ("Розробка програмного додатку", "29.05.24 — 07.06.24"),
//   ("Опис розробленої програмної системи", "07.06.24 — 10.06.24"),
//   ("Аналіз дослідної експлуатації і можливих застосувань", "10.06.24 — 13.06.24"),
//   ("Економічна частина", "10.6.24 — 13.06.24"),
//   ("Охорона праці", "13.06.24 — 14.06.24"),
//   ("Графічна частина (презентація), вступ, висновки, реферат, перелік посилань, реферат", "12.06.24 — 17.06.24"),
//   ("Нормоконтроль", "17.06.24"),
//   ("Підпис голови ЦК", "17.06.24 — 18.06.24"),
//   ("Рецензування", "17.06.24 — 18.06.24"),
//   ("Захист ДР", "24.06.24"),
// )

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
  // Title Page
  unindented[
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

  pagebreak()

  // Task Page (actually, two pages)
  unindented[
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

    #task_consultants(
      main_part: supervisor_name,
      economy_part: economy_supervisor_name,
      work_health: work_health_supervisor_name,
      formatting: formatting_supervisor_name
    )
    #task_calendar_plan(plan: calendar_plan_data)
    #task_signature()
  ]

  pagebreak()

  // Grade Page
  unindented[
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

  pagebreak()

  outline(indent: 1.25em)

  pagebreak()

  body
}