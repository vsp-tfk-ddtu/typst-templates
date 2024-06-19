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

#let supervisor_name = "ЧИЧИКОВ Павло"
#let supervisor_title = "Викладач"

#let commission_members = (
  "Чичиков П. Н.",
  "Коробочка А. В."
)

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

= ВСТУП <start>