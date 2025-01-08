#import "src/layout/standard.typ": setup_layout
#import "src/control_work/template.typ": project

#show: setup_layout

#show: project.with(
  vice_director: "ФАМИЛИЯ Имя",
  date: "25 жовтня 2024 року",
  subject: "Subject Title",
  group: "ИПЗ-21-9д",
  profession: "McDonalds Manager",
  cycle_commission: "ПЗ та ПМ",
  cycle_commission_supervisor: "ФАМИЛИЯ Имя"
)

#set heading(numbering: none)