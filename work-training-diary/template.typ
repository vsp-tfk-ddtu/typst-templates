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

#let signature_field(length: 95%, title: "(прізвище та ініціали)") = {
  grid(
    columns: 1,
    row-gutter: 0.2em,
    [#block(height: 1em)[#align(bottom)[#line(length: length, stroke: 0.4pt)]]],
    [#align(center)[#text(size: 10pt)[#title]]]
  )
}

#let practice_header(
  department_name: none,
  commission_name: none,
  knowledge_branch: none,
  specialty: none,
  course_num: none,
  group: none,
  college_supervisor: none
) = {
    align(horizon)[
      #align(center)[
        #heading(outlined: false, numbering: none)[ЩОДЕННИК ПРАКТИКИ]
        #heading(outlined: false, numbering: none)[#underline[ВИРОБНИЧА]]
      ]
    ]

    align(bottom)[
      #grid(
        columns: (1fr, 1fr),
        align: top,
        row-gutter: 1em,
        column-gutter: 1em,
        [Здобувач освіти:],[#signature_field(title: "(ім'я та прізвище)")],
        [Відділення:],[*#department_name*],
        [Циклова комісія:],[*#commission_name*],
        [Освітньо-кваліфікаційний рівень:],[*фаховий молодший бакалавр*],
        [Галузь знань:],[*#knowledge_branch*],
        [За спеціальністю:],[*#specialty*],
        [Курс:],[*#course_num*],
        [Група:],[*#group*],
        [Керівник практики від коледжу:],[#college_supervisor],
        [Керівник практики від підприємства:],[#signature_field(title: "(ім'я та прізвище)")],
      )
    ]
}

#let practice_appendix(
  city: none,
  due_from: none,
  due_to: none,
  college_supervisor: none,
  college_head: none,
  enterprise_supervisor: none,
) = {
    heading(outlined: false, numbering: none)[#text(weight: "regular")[ПРИПИС ДО ПРАКТИКИ]]

    grid(
      columns: 2,
      align: left,
      column-gutter: 1em,
      [Здобувач освіти],[#signature_field(length: 100%)] 
    )

    [Направляється на виробничу практику до міста #underline[#city]]

    grid(
      columns: 2,
      align: left,
      column-gutter: 1em,
      [на],[#signature_field(length: 100%, title: "(найменування підприємства)")] 
    )

    [Строк практики з #due_from до #due_to.]

    grid(
      columns: (1fr, 0.7fr, auto),
      align: (left, right, right),
      column-gutter: 1em,
      [Керівник практики від коледжу],[#signature_field(length: 100%, title: "(підпис)")],[#college_supervisor]
    )

    grid(
      columns: (1fr, 0.7fr, auto),
      align: (left, right, right),
      column-gutter: 1em,
      [Завідувач навчально-виробничої практики],[#signature_field(length: 100%, title: "(підпис)")],[#college_head]
    )

    block(height: 3em)[
      #align(horizon)[#text(size: 0.7em, fill: gray)[Печатка]]
    ]

    align(bottom)[
      #line(length: 100%)
      #align(top)[
        #grid(
          columns: (1fr, 2fr),
          align: (left, right, right),
          column-gutter: 1em,
          [Керівник практики від підприємства],
          [#signature_field(length: 100%, title: "(підпис, прізвище, ім'я, по-батькові)")]
        )
      ]

      #line(length: 100%)
      #align(top)[
        #grid(
          columns: (1fr, 1fr),
          align: (left, right),
          column-gutter: 1em,
          [Прибув на підприємство],[#due_from],
          [
             #block(height: 3em)[
              #align(horizon)[#text(size: 0.7em, fill: gray)[Печатка підприємства]]
            ]
          ],[]
        )
        #signature_field(length: 100%, title: "(підпис, прізвище, ім'я, по-батькові відповідальної особи)")
      ]

      #align(top)[
        #grid(
          columns: (1fr, 1fr),
          align: (left, right),
          column-gutter: 1em,
          [Відбув з підприємства],[#due_to],
          [
             #block(height: 3em)[
              #align(horizon)[#text(size: 0.7em, fill: gray)[Печатка підприємства]]
            ]
          ],[]
        )
        #signature_field(length: 100%, title: "(підпис, прізвище, ім'я, по-батькові відповідальної особи)")
      ]
    ]
}

#let signatures() = {
  [Підпис керівника практики:]
  align(top)[
    #grid(
      columns: (1fr, 2fr),
      align: (left, right, right),
      column-gutter: 1em,
      [Від підприємства],
      [#signature_field(length: 100%, title: "(підпис)")]
    )
    #grid(
      columns: (1fr, 2fr),
      align: (left, right, right),
      column-gutter: 1em,
      [Від коледжу],
      [#signature_field(length: 100%, title: "(підпис)")]
    )
  ]
}

#let calendar_plan_a(
  plan: ()
) = {
  set par(justify: false, leading: 1em)
  table(
    columns: (1fr, 8fr, 1fr, 1fr, 1fr, 1fr, 1fr, 5fr),
    align: center + horizon,
    table.header(
      table.cell(rowspan: 2)[№],
      table.cell(rowspan: 2)[Найменування робіт],
      table.cell(colspan: 5)[Тижні проходження практики],
      table.cell(rowspan: 2)[Відмітки про виконання],
      [1],[2],[3],[4],[5]
    ),

    // ..for (i, v) in plan.enumerate() {
    //   ([#(i + 1)], [#v], none, none, none, none, none, none,)
    // }
    ..for _ in range(20) {
      range(8).map(_ => box(height: 1em))
    }
  )

  align(bottom)[
    #signatures()
  ]
}

#let calendar_plan_b(offset: 0, plan: ()) = {
  set par(justify: false, leading: 1em)
  table(
    columns: (1fr, 8fr, 1fr, 1fr, 1fr, 1fr, 1fr, 5fr),
    align: center + horizon,
    table.header(
      table.cell(rowspan: 2)[№],
      table.cell(rowspan: 2)[Найменування робіт],
      table.cell(colspan: 5)[Тижні проходження практики],
      table.cell(rowspan: 2)[Відмітки про виконання],
      [1],[2],[3],[4],[5]
    ),

    // ..for (i, v) in plan.enumerate() {
    //   ([#(i + offset + 1)], [#v], none, none, none, none, none, none,)
    // }
    ..for _ in range(20) {
      range(8).map(_ => box(height: 1em))
    }
  )

  align(bottom)[
    #signatures()
  ]
}

#let lines(amount: 1, height: 0.2em)  = {
  let i = 0
  while i < amount {
    block(height: 0.2em)[#align(bottom)[#line(length: 100%, stroke: 0.4pt)]]
    i += 1
  }
}

#let reviews(
  college_supervisor: none,
  cycle_commision_head: none,
) = {
  signature_field(length: 100%, title: "(підприємство, установа)")

  lines(amount: 7)

  grid(
    columns: (2fr, 1fr),
    align: (left, right),
    column-gutter: 1em,
    [Підпис керівника практики від підприємства],
    [#signature_field(length: 100%, title: "(підпис)")]
  )

  grid(
    columns: (1fr, 1fr),
    align: (left + horizon, right + horizon),
    column-gutter: 1em,
    [#box(height: 3em)[#text(size: 0.7em, fill: gray)[Печатка]]],
    [#box(height: 3em)[#align(horizon)["`__`" `_______` 20 `__`р.]]]
  )

  [= Висновки керівника про роботу здобувача освіти]
  
  lines(amount: 6)

  align(bottom)[
    Оцінка:
    #align(top)[
      #grid(
        columns: (1fr, 2fr),
        align: (left, right, right),
        column-gutter: 1em,
        [за національною шкалою],
        [#signature_field(length: 100%, title: "(словами)")]
      )
      #grid(
        columns: (1fr, 2fr),
        align: (left, right, right),
        column-gutter: 1em,
        [кількість балів],
        [#signature_field(length: 100%, title: "(цифрами і словами)")]
      )
      #grid(
        columns: (1fr, 2fr),
        align: (left, right, right),
        column-gutter: 1em,
        [за шкалою ECTS],
        [#signature_field(length: 100%, title: "")]
      )
      #grid(
        columns: (1fr, 0.7fr, auto),
        align: (left, right, right),
        column-gutter: 1em,
        [Керівник практики],[#signature_field(length: 100%, title: "(підпис)")],[#college_supervisor]
      )
      #grid(
        columns: (1fr, 0.7fr, auto),
        align: (left, right, right),
        column-gutter: 1em,
        [Голова циклової комісії],[#signature_field(length: 100%, title: "(підпис)")],[#cycle_commision_head]
      )
    ]
  ]
}

#let project(
  department_name: none,
  commission_name: none,
  course_num: none,
  group: none,
  knowledge_branch: none,
  specialty: none,
  student_name: none,
  city: "Кам’янське",
  college_supervisor: none,
  college_head: none,
  cycle_commision_head: none,
  due_from: none,
  due_to: none,
  plan_a: (),
  plan_b: (),
  body
) = {
  show: setup_layout

    // Title Page
  page(numbering: none)[
    #unindented[
      #institution()

      #practice_header(
        department_name: department_name,
        commission_name: commission_name,
        knowledge_branch: knowledge_branch,
        specialty: specialty,
        course_num: course_num,
        group: group,
        college_supervisor: college_supervisor,
      )
    ]
  ]

  page(numbering: none)[
    #unindented[
      #practice_appendix(
        city: city,
        due_from: due_from,
        due_to: due_to,
        college_head: college_head,
        college_supervisor: college_supervisor,
      ) 
    ]
  ]

  page(numbering: none)[
    = Основні положення практики

    + Здобувач освіти до початку практики повинен пройти інструктаж у
      керівника та отримати: 
      - щоденник практики;
      - індивідуальне завдання на виробничу;
      - направлення на практику.

    + Здобувач освіти після прибуття на підприємство повинен подати
      керівнику від підприємства щоденник, пройти інструктаж з
      охорони праці, ознайомитись з робочим місцем, правилами
      експлуатації обладнання та уточнити план проходження практики.
    + Протягом практики здобувач освіти зобов'язаний суворо
      дотримуватись правил внутрішнього розпорядку. Про всі випадки
      відсутності на робочому місці практикант повинен повідомити
      керівникові практики від підприємства та коледжу.
    + Звіт про практику складається здобувач освітиом у відповідності з
      календарним графіком проходження практики та додатковими
      вказівками керівників практики від коледжу та підприємства.
    + За результатами практики виставляється диференційована оцінка,
      що вноситься в екзаменаційну відомість і проставляється в залікову
      книжку.
    + Здобувач освіти, який не виконував вимог практики, або отримав
      незадовільний відгук про роботу чи негативну оцінку при захисті
      звіту, проходить практику повторно.
  ]

  page(numbering: none)[
    = Календарний план проходження практики

    #unindented[
      #calendar_plan_a(plan: plan_a)
    ]
  ]
  page(numbering: none)[
     #unindented[
       #calendar_plan_b(offset: plan_a.len(), plan: plan_b)
     ]
  ]

  page(numbering: none)[
    = Відгуки про роботу здобувача освіти на практиці

    #unindented[
      #reviews(
        college_supervisor: college_supervisor,
        cycle_commision_head: cycle_commision_head
      )
    ]
  ]

  page(numbering: none)[
    = Робочі записи в період практики

    #unindented[
      #table(
        columns: 1fr,
        ..for _ in range(28) {
          (box(height: 1em),)
        }
      )
    ]
  ]

  page(numbering: none)[
    = Правила оформлення щоденника

    + Щоденник є одним з основних документів здобувача освіти в
      період проходження практики.
    + Для здобувача освіти, який проходить практику за межами міста,
      в котрому знаходиться коледж, щоденник є також посвідченням про
      відрядження, яким підтверджується термін перебування здобувача
      освіти на практиці.
    + В період практики здобувач освіти повинен фіксувати в
      щоденнику виконання проектної роботи проходження практики.
    + Після закінчення практики щоденник разом зі звітом
      переглядається керівниками практики, які складають відгуки про
      роботу здобувача освіти і підписують щоденник.
    + Оформлений щоденник разом зі звітом здобувач освіти повинен
      подати керівнику практики від коледжу.

    #text(weight: "bold")[Без заповненого щоденника практика не зараховується.]
  ]
  
  show table: set table(
    inset: 7pt, 
    stroke: (0.5pt + luma(200)), 
    align: center + horizon
  )

  body
}