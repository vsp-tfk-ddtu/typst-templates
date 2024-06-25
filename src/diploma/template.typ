#import "diploma.typ": *

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