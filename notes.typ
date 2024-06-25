#import "src/layout/simple.typ": set_layout
#import "src/notes/template.typ": project

#show: set_layout
#show: project.with(
  subject: "Алгоритми та структури даних",
  author: "Кравець М. Ю.",
  revision_date: "1 вересня 2024",
  type: "Конспект лекцій"
)

= Масиви

Масив #footnote[англ. — array.] — структура даних, яка зберігає дані у пам'яті послідовно.
