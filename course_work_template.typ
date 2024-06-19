
#let cycle_commission(
  commission_name: none
) = {
  align(center)[
    #block(above: 2em)[
      #par(leading: 0.5em, first-line-indent: 0em, justify: false)[
        #block(above: 0.5em)[
          Циклова комісія #lower[#commission_name]
        ]
      ]
    ]
  ]
}

#let work_title(
  title: none,
  discipline: none,
  course_num: "IV",
  group: none,
  klnowledge_branch: none,
  specialty: none,
  student_name: none,
  supervisor_name: none,
  supervisor_title: none,
  commission_members: ()
) = {
  align(horizon)[
    #align(center)[
      #heading(outlined: false, numbering: none)[Курсова робота]
      #block(above: 2em)[
        З дисципліни «#discipline»
        #parbreak()
        #par(leading: 0.5em)[
          на тему: «*#title*»
        ]
      ]
    ]
    
    #text(size: 12pt)[
      #block(above: 2em)[
        #grid(
          columns: (1fr, 1fr),
          none,
          align(left)[
            #par(justify: false, leading: 1em)[
              Студента #underline[#course_num] курсу,
              #parbreak()
              групи #underline[#group]
              #parbreak()
              галузі знань #klnowledge_branch
              #parbreak()
              спеціальності #specialty 
              #parbreak()
              #underline[#student_name]
              #parbreak()
              Керівник #underline[#supervisor_name, #supervisor_title]
              #parbreak()
              Національна шкала  `___________________`
              #parbreak()
              Кількість балів `_____` Оцінка ECTS `______`
              #block(above: 2em)[
                Члени комісії:
                #parbreak()
                #for m in commission_members {
                  [`_____________` #m]
                  parbreak()
                }
              ]
            ]
          ]
        )
      ]
    ]
  ]
}