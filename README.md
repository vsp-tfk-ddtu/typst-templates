# Typst Templates

This repository contains `Typst` templates for the documents
required by students of our College Community.

## How to Use

In order to use templates for your desired document you
should follow the following steps:

### Download the Repository

Download the repository either using GitHub or with `git clone`
command.

### Create a Project

You may write a paper either using [Typst.app](https://typst.app)
or Visual Studio Code.

#### Typst.app

If you decided to use Typst web application, you should
create a new project in the web-application.

Then create `src/` directory in the app file system and
copy the desired files from `src/` directory of this
repository to `src/` of Typst app.

For diploma, you should the following files to get the
following file structure:

```
src/
    diploma/
        diploma.typ
        template.typ
    layout/
        standard.typ
    utils.typ
main.typ  // copy diploma.typ content here
```

For course work, it should be

```
src/
    course_work/
        course-work.typ
        template.typ
    layout/
        standard.typ
    utils.typ
main.typ  // copy course-work.typ content here
```

Then go back to the root of the repository and copy
the content of either `course-work.typ` or `diploma.typ`
to the `main.typ` file.

#### VS Code

Honestly, if you're using VS Code to write your paper, you're
smart enough to start writing the paper without a thorough
instruction ;)

However, let's make one. The biggest advantage of VS Code is
that you can use Version Control System during the work.

The manual is next

1. Create a new repository;
2. Install VS plugins Typst, Tinymist Typst, and Typst Math;
3. Copy the desired files to `src/` of your project;
4. Create `main.typ` file and copy the content of
    either `course-work.typ` or `diploma.typ`
    to the `main.typ` file;
5. Write your paper.

## Times New Roman

Times New Roman font requires licensing which [Typst.app](https://typst.app)
doesn't have. So, if you wish to use Times New Roman font,
you should download it from internet and upload it to the
Typest.app project's file system root.