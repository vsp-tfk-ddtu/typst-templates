#import "../utils.typ": unindented, institution, city_and_year
#import "control-work.typ": *

#let project(
  vice_director: none,
  date: none,
  subject: none,
  group: none,
  profession: none,
  cycle_commission: none,
  cycle_commission_supervisor: none,
  city: "Кам’янське",
  body
) = {
  let today = datetime.today()

  page(numbering: none)[
    #set par(justify: false)

    #unindented[
      #institution(internal: true)

      #align(horizon)[
        #work_approval(vice_director, date)
      ]

      #align(horizon)[
        #block(breakable: false, height: 50%)[
            #work_title(subject, group, profession)
            #signature(cycle_commission, cycle_commission_supervisor)
        ]
      ]

      #city_and_year(city: city)
    ]
  ]

  body
}