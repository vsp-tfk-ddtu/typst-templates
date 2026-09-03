#import "template.typ": assignment

#show: assignment.with(
  student: "Jon Doe",
  subject: "Constructing Software",
  project_name: "Super Collider 3000",
  github: link("https://github.com")[github:mynickname:project-repo],
  main_language: "Python",
  auxiliary_languages: [JavaScript, SQL],
  technologies: [PostgreSQL, Docker, Redis],
  instructor: "Jason Statham",
  due_date: "12 December 2026",
  project_description: [
    Super Collider 3000 is an educational programming project that simulates a particle collider.
    Users can create virtual particles, accelerate them, and observe what happens when they 
    collide. The project demonstrates concepts such as physics simulation, algorithms, data 
    visualization, and interactive software design. Its goal is to turn complex scientific ideas 
    into an engaging and understandable digital experience.
  ]
)
