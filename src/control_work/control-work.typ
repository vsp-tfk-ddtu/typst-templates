
#let work_approval(vice_director, date) = {
  grid(
    columns: (1fr, 1fr),
    [], [
      #upper[*Затверджую:*]

      Заступник директора з навчально-методичної роботи

      #vice_director

      #date
    ]
  )
}

#let work_title(subject, group, profession) = {
  align(center)[
    *ДИРЕКТОРСЬКА КОНТРОЛЬНА РОБОТА*
  ]

  block[
    *з предмету* #subject

    *для здобувачів освіти групи* #group

    *професія* #profession
  ]
}

#let signature(cycle_commission, cycle_commision_head) = {
  grid(
    columns: (1fr, 1fr),
    [], [
      РОЗГЛЯНУТО І СХВАЛЕНО

      на засіданні циклової комісії

      #line(start: (0%, 1em), end: (100%, 1em))

      Протокол №`____` від `________` 202`__` р.

      #cycle_commision_head
    ]
  )
}