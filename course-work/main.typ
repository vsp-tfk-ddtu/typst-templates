#import "template.typ": project

#show: project.with(
  student_name: "ІВАНЧЕНКО Петро",
  student_name_genitive: "Іванченко Петру Миколайовичу",
  group: "ІПЗ-21-9-д",
  course_num: "IV",
  city: "Кам’янське",
  department_name: "технолого-економічне",
  commission_name: "Інформаційних технологій",
  commission_name_short: "ІТ",
  protocol_number: 2,
  protocol_date: "15.09.2025",
  knowledge_branch: "12 Інформаційні технології",
  specialty: "121 “Інженерія програмного забезпечення”",
  discipline: "Конструювання програмного забезпечення",
  title: "Практичне застосування патерну проектування Decorator у мові програмування Python",
  work_due_to: "24 червня 2024",
  task_received_at: "24.02.2024",
  supervisor_name: "ЧИЧИКОВ Павло",
  supervisor_title: "Викладач",
  commission_head_name: "СОБАКЕВИЧ Михайло",
  commission_members: (
    "Чичиков П. Н.",
    "Коробочка А. В."
  ),
  calendar_plan_data: (
    ("Аналіз проблемної галузі та постановка задачі", "02.02.2023 - 06.02.2023"),
    ("Опис прийнятих проектних рішень", "06.02.2023 - 09.02.2023"),
    ("Розробка програми", "09.02.2023 - 01.03.2023"),
    ("Опис розробленої програми", "01.03.2023 - 06.03.2023"),
    ("Графічна частина (презентація), вступ, висновки, перелік посилань, реферат", "06.03.2023 - 12.03.2023"),
    ("Нормоконтроль і перевірка на антиплагіат", "12.03.2023"),
    ("Попередній захист роботи", "13.03.2023"),
    ("Захист роботи", "14.03.2023"),
  ),
  initial_data: [
    Початкові дані, що ми маємо наразі і які необхідні для вирішення даної курсової роботи. Ще одне речення. І ще одне. 
    Дивіться приклад курсової роботи, щоб додати правильні початкові дані.
  ],
    abstract: [
    Пояснювальна записка до курсової роботи:
    
    Об'єкт розробки — патерн проектування .

    Мета розробки — дослідити доцільність використання патерну у
    програмах написаних на Python.

    Метод проектування —

    #align(bottom)[
      ПРОГРАМА, ПАТЕРНИ ПРОЕКТУВАННЯ, UML, ДІАГРАМА КЛАСІВ
    ]
  ]
)

#heading(numbering: none)[ВСТУП]

#lorem(150)

Let's use the first bibliography source as @art_of_computer_programming. Or if you want to add an additional
text use the following syntax @art_of_programming[p. 35].

#pagebreak()

#bibliography(
  "../bibl.yaml", 
  title: "ПЕРЕЛІК ПОСИЛАНЬ", 
)

// Note that only the USED sources are displayed by bibliography
// function. If you want to display all sources despite the fact
// that you're not mentioning them in the document, pass `full: true` argument to the function such as
// 
// #bibliography(
//   "../bibl.yaml", 
//   title: "ПЕРЕЛІК ПОСИЛАНЬ", 
//   full: true
// )