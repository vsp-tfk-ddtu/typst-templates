#import "template.typ": milestones, milestone

#show: milestones.with(
  student: "Jon Doe",
  subject: "Constructing Software",
  project_name: "Super Collider 3000",
)

#milestone("Week 1")[
  Setup the project locally. Create GitHub repository and bind it to the local
  repository. Setup FastAPI project and run dev server.
]

#milestone("Week 2-3")[
  Research JWT authentication. Implement authentication, authorization with FastAPI,
  PostgreSQL, and SQLAlchemy. Add `User` model and implement a minimal user management system.

  == Change Request 16.09.2026

  JWT appeared not so secure for the project need. I decided to switch to JWE.
  
  == Milestone Report

  JWE successfuly implemented. Authentication, authorization works well. Users can sign in
  to the application.
]