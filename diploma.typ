#import "src/layout/standard.typ": setup_layout
#import "src/diploma/template.typ": project

#show: setup_layout
#show: project.with(
  student_name: "ІВАНЧЕНКО Петро",
  student_name_genitive: "Іванченко Петру Миколайовичу",
  group: "ІПЗ-21-9-д",
  course_num: "IV",
  city: "Кам’янське",

  department_name: "технолого-економічне",
  commission_name: "Програмного забезпечення та прикладної математики",
  commission_name_short: "ПЗ та ПМ",
  knowledge_branch: "12 Інформаційні технології",
  specialty: "121 “Інженерія програмного забезпечення”",

  supervisor_name: "ЧИЧИКОВ Павло",
  reviewer_name: "МАНИЛОВ Микола",
  commission_head_name: "СОБАКЕВИЧ Михайло",
  economy_supervisor_name: "КОРОБОЧКА Анастасія",
  work_health_supervisor_name: "ПЛЮШКІН Григорій",
  performance_supervisor_name: "СОБАКЕВИЧ Михайло",
  formatting_supervisor_name: "СОБАКЕВИЧ Михайло",

  title: "Проектування та розробка найкращого проекту у світі, першої сторінки інтернету",
  work_due_to: "24 червня 2024",
  supervisor_title: "Викладач",

  initial_data: [Розробити супер-класний проект по всім сучасним правилам і стандартам. Передбачити використання сервісу через клієнт за протоколами REST та gRPC. Використати реляційну СУБД як сховище даних.],

  work_content: [мета роботи, аналіз проблемної галузі та постановка задачі, перелік вимог до програмної системи, опис об’єктних моделей, використовувані методи та алгоритми, структура бази даних, опис розробленої програмної системи, аналіз дослідної експлуатації та можливих застосувать. Додатки: а) слайди презентації, б) код програм.],

  graphic_material: [Слайди презентації, титульний лист, мета роботи, постановка задачі, вибір середовища розробки, об’єктна модель проблемної галузі, інтерфейс програмної системи, економічна частина, охорона праці, висновки.],

  calendar_plan_data: (
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
)

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

Here is the reference #cite(<electronic>).

#lorem(400)

#pagebreak()

== Перелік вимог до програмної системи

#lorem(200)

#pagebreak()

= Аналіз дослідної експлуатації

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

#pagebreak()

#heading(numbering: none)[ВИСНОВОК]

#lorem(200)

#pagebreak()

// TODO: this is the bug that requires us to write the language to uk in bibliography.
#text(
  lang: "uk"
)[
  #bibliography(
    "bibl.yaml", 
    title: "ПЕРЕЛІК ПОСИЛАНЬ", 
    full: true,
    style: "ieee",
  )
]
