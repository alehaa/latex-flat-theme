# Flat LaTeX Theme

[![](https://img.shields.io/github/issues-raw/alehaa/latex-flat-theme.svg?style=flat-square)](https://github.com/alehaa/latex-flat-theme/issues)
[![](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](LICENSE)


## Usage

1. To use this LaTeX theme, simply add this repository as git submodule into
   your document's repository:

   ```
   mkdir externals
   git submodule add git://github.com/alehaa/latex-flat-theme.git externals/latex-flat-theme
   ```

   This folder needs to be listed in the `TEXINPUT` environment variable, so
   `pdflatex` is able to find the required classes. Therefore you need to alter
   this variable in your build environment (e.g. `Makefile`) or just export an
   environment variable before running `pdflatex`:

   ```
   export TEXINPUT="$PWD/externals/latex-flat-theme/src:$TEXINPUT"
   ```

   *If you don't use git or dislike submodules you can copy the
   [class files](src/) manually into your LaTeX document's folder instead.*

2. Use the `flatArticle` class in your LaTeX document:

   ```LaTeX
   \documentclass{flatArticle}
   ```


## Configuration

In addition to the regular `article` options, the `flatArticle` class provides
the following options for configuration:

* **primaryColor** and **secondaryColor**:

  These options define the color scheme of the document, used for colorized
  section titles, itemization and page numbers. You can access these colors
  inside the document by using the `primary` and `secondary` color names.

  *Default: `cyan` as primary and `magenta` as secondary color.*

In addition, the following lengths can be configured to tweak the document's
appearance:

* **flatPageNumWidth**:

  Width of the page number box. This length should fit at least the size of the
  maximum page number of the document, as it will not be enlarged to fit the
  text inside the box.

  *Default: 2em*

* **flatPageNumOuterMargin**:

  Margin between the outer page border and the page number box. It has the same
  color as the page number box to get a "borderless" design.

  *Default: 1em*


## License

This project is licensed under the [MIT License](LICENSE).

&copy; 2020-2021 Alexander Haase
