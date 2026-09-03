#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#import "layout.typ": set_layout, fill-color

#let fancy_table(fill: (x, y) => if x == 0 { fill-color }, ..args) = {
  show table.cell.where(x: 0): it => {
    set text(weight: "medium")
    
    it
  }
  set par(justify: false)

  table(
    columns: (1fr, 2fr),
    fill: fill,
    ..args
  )
}

#let evaluation_table(good, review) = {
  fancy_table(
    [What is considered 'Good'],[#good],
    [How it's reviewed],[#review],
    [*Grade*],[]
  )
}

#let signature_field(length: 95%, title: "(signature)") = {
  grid(
    columns: 1,
    row-gutter: 0.2em,
    [#block(height: 1em)[#align(bottom)[#line(length: length, stroke: 0.4pt)]]],
    [#align(center)[#text(size: 10pt)[#title]]]
  )
}

#let project_summary(
  project_name: none,
  github: none,
  main_language: none,
  auxiliary_languages: none,
  technologies: none,
  instructor: none,
  due_date: none
) = {
  show table.cell.where(x: 0): it => {
    set text(weight: "medium")
    
    it
  }
  
  fancy_table(
    fill: (x, y) => {
      if x == 0 {
        fill-color
      } else if y >= 5 {
        fill-color
      }
    },
    [Name],[#project_name],
    [GitHub],[#github],
    [Main Language],[#main_language],
    [Auxiliary Languages],[#auxiliary_languages],
    [Technologies],[#technologies],
    [Instructor],[#instructor],
    [Due Date],[#due_date],
  )
}

#let evaluation_criteria() = [
    == Code Quality

    #evaluation_table(
      [
        Code is readable, well-organized, follows styling rules for the used languages, follows SOLID, KISS, YAGNI principles.
      ],
      [GitHub repo + peer review]
    )

    == Functionality

    #evaluation_table(
      [
        Core features work as specified and handle various edge cases. Key algorithms operate 
        within theoretically justified time/space complexity; data structures are 
        chosen with purpose.
  
        If a suboptimal algorithm or structure is chosen, the student can answer the question
        'why'.
      ],
      [Live demo + GitHub repo + peer review + final project presentation]
    )

    == Testing

    #evaluation_table(
      [
        Code is covered with tests. Tests are well-rounded covering edge-cases.
        Mocks / stubs / patches are used for external dependencies.
      ],
      [Peer review + code coverage percentage]
    )

    == Learning Evidence

    #evaluation_table(
      [
        The student maps lecture topics and course concepts to concrete features in their own project.
        
        The student takes initiative to plan their learning path, identifying what they need 
        to know next, researching tutorials or documentation, and forming questions 
        for the instructor. The instructor is treated as a strategic advisor and 
        ultimate source of truth, not a replacement for self-study.

        *⚠️ The student is NOT allowed to use LLMs to generate code. All code must be written 
        by hand! ⚠️*

        The student is *allowed* to use LLMs as advanced search machines 
        for the purpose of research.
      ],
      [Walk-through in a regular check-in meeting + Git history + milestone checklist]
    )

    == Process

    #evaluation_table(
      [
        The student delivers incremental, visible progress on schedule. Major milestones are met (or proactively renegotiated before the deadline, not after). Work is distributed steadily rather than compressed into a final sprint.

        When blocked, the student escalates with context (error messages, attempted fixes, specific questions) rather than going silent.
      ],
      [Walk-through in a regular check-in meeting + Git history + milestone checklist]
    )

    == Reflection

    #evaluation_table(
      [
        The student can articulate which programming concepts, technologies, libraries, 
        and algorithms were used, why each was chosen over alternatives, and how they 
        connect to the project's goals.
      ],
      [Peer review + final project presentation]
    )
    
]


#let assignment(
  student: none,
  subject: none,
  project_name: none,
  project_description: none,
  github: none,
  main_language: none,
  auxiliary_languages: none,
  technologies: none,
  instructor: none,
  due_date: none,
  body
) = {
  show: set_layout.with(alternate_margins: true)

  align(left)[
    #show heading.where(level: 1): set align(left)
    #show heading: set block(above: 1em, below: 1em)
    #text(size: 14pt)[
      #heading(numbering: none, outlined: false, level: 1)[
        Individual Project Assignment
      ]
      #heading(numbering: none, outlined: false, level: 2)[
        #text(weight: 500)[#student]
      ]
    ]

    #subject
    #line(length: 100%, stroke: 0.2pt)
  ]

  [
    = Summary

    #project_summary(
      project_name: project_name,
      github: github,
      main_language: main_language,
      auxiliary_languages: auxiliary_languages,
      technologies: technologies,
      instructor: instructor,
      due_date: due_date
    )
  ]

  [
    = Project Description
    #project_description
  ]

  show: codly-init.with()
  codly(languages: codly-languages, zebra-fill: none)

  pagebreak()
  [
    = Evaluation Criteria

    #evaluation_criteria()
  ]

  pagebreak()
  [
    = Commitments & Signatures

    == Student

    + I agree to actively engage in the learning process and project development.
    + I agree to finish tasks in a timely manner. 
    + I'm encouraged to discuss milestones, tasks, problems, and any other topics arising
      during the work on the project with the instructor.
    + I agree to discuss changes in milestones and the planned tasks with the instructor before
      making any changes.
    + I will *not* use any LLMs to generate code.
    + I will use `git` as a VCS and keep a remote repository on GitHub platform.

    == Instructor

    + I agree to help the student work out project milestones and requirements, choose appropriate technologies.
    + I agree to review the student's work regularly, communicate clearly about problems or
      concerns, and provide timely guidance and feedback.
    + I agree to review the student's opened Pull Requests on GitHub.
    + I’ll stay active in our agreed chat channels and aim to reply within 24 hours on weekdays.
    + I will celebrate your achievements! 

    #block(above: 2em, below: 2em)
    
    #grid(
      columns: (2fr, 1fr),
      align: (left, right, right),
      column-gutter: 1em,
      [#student],
      [#signature_field(length: 100%)]
    )
    #grid(
      columns: (2fr, 1fr),
      align: (left, right, right),
      column-gutter: 1em,
      [#instructor],
      [#signature_field(length: 100%)]
    )
  ]
}

#let milestone(period, description) = [
  = Milestone

  #heading(level: 3)[#period]

  #description
]

#let milestones(
  student: none,
  subject: none,
  project_name: none,
  body,
) = {
  show: set_layout.with(alternate_margins: false)

  align(left)[
    #show heading.where(level: 1): set align(left)
    #show heading: set block(above: 1em, below: 1em)
    #text(size: 14pt)[
      #heading(numbering: none, outlined: false, level: 1)[
        Individual Project Milestones
      ]
      #heading(numbering: none, outlined: false, level: 2)[
        #text(weight: 500)[#project_name]
      ]
      #heading(numbering: none, outlined: false, level: 2)[
        #text(weight: 500)[#student]
      ]
    ]

    #subject
    #line(length: 100%, stroke: 0.2pt)
  ]

  show heading.where(level: 1): set heading(numbering: "1")

  show heading.where(level: 1): it => {
    context block(
      it.body + [ ] + counter(heading).display()
    )
  }

  body
}