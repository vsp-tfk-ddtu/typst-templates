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
create a new project in there.

Then upload the required templates from this repository into
Typst web project. For example, if you're writing a diploma,
then upload files from `src/diploma` to project file system.
I recommend to upload them into a folder called `template`.

Also, upload the desired layout into a `layout` folder.
If you're student, 90% chance that you need to upload `src/layout/standard.typ`.

After you uploaded the layout files, go to `main.typ` and
import your files

```typ
#import "layout/standard.typ": setup_layout
#import "template/template.typ": project
```

Then go to the desired example file contained in the
repository, i.e. `diploma.typ`, copy the layout / template usage,
fill the function arguments with the actual information,
and write your paper.

#### VS Code

Honestly, if you're using VS Code to write your paper, you're
smart enough to start writing the paper without a thorough
instruction ;)

However, let's make one. The biggest advantage of VS Code is
that you can use Version Control System during the work.

The manual is next

1. Create a new repository;
2. Install VS plugins Typst, Tinymist Typst, and Typst Math;
3. Copy the desired layout / template to the repository;
4. Create `main.typ` file, use layout and template function;
5. Write your paper.
