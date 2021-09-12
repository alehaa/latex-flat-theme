% This file is part of latex-flat-theme.
%
% Copyright (c)
%   2020-2021 Alexander Haase <ahaase@alexhaase.de>
%
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{flatArticle}[2021/09/12 a flat and modern article class]


% ===============
% Process options
% ===============
%
% NOTE: The options need to be processed BEFORE loading the base class, as some
%       of them might not be evaluated otherwise.

\RequirePackage{kvoptions}

% Color palette options.
%
% For the basic elements of this theme, two colors are used: a primary and
% secondary one. These can be configured as options for this theme class, so the
% user can select a different color scheme.
\DeclareStringOption[cyan]{primaryColor}
\DeclareStringOption[magenta]{secondaryColor}

% Process all defined options. Options not defined by this class will be passed
% through to its parent class automatically, so options available by the default
% article class (e.g. 'twoside' and 'twocolumn') may be used in this theme.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\ProcessKeyvalOptions*


% ===============
% Load base class
% ===============

\LoadClass{article}


% ======================
% Load required packages
% ======================

\RequirePackage{amssymb}
\RequirePackage{calc}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{geometry}
\RequirePackage{hyperref}
\RequirePackage{sectsty}
\RequirePackage{xcolor}

% The default font for this theme is Roboto, a modern sans-serif font designed
% by Christian Robertson for Google and licensed under the Apache license, which
% makes it free to use for any kind of document.
\RequirePackage[sfdefault,light]{roboto}


% =============
% Color palette
% =============

% Define two color aliases for the primary and secondary colors, which can be
% configured by options of this theme class.
%
% NOTE: These aliases need to be assigned at the begin of the document block, as
%       they might use colors defined in the preamble of the LaTeX file using
%       this theme class.
\AtBeginDocument{
    \colorlet{primary}{\flatArticle@primaryColor}
    \colorlet{secondary}{\flatArticle@secondaryColor}
}


% =================
% Document settings
% =================

% The default document margins should fit the needs for onesided and twosided
% documents, both able to be either bound after professional printing or punched
% for archiving in folders.
\geometry{a4paper, margin=15mm, lmargin=20mm}

% Override the default paragraph settings. The first line of a new paragraph
% should never be indented but a vertical space is used to separate the
% individual paragraphs.
\setlength{\parindent}{0pt}
\setlength{\parskip}{2ex plus1ex minus0.5ex}


% Use colorized section headings with a font larger than the usual article
% headings have and just a usual font weight instead of a bold one.
      \sectionfont{\normalfont\LARGE\color{primary}}
   \subsectionfont{\normalfont\large\color{secondary}}
\subsubsectionfont{\normalfont\normalsize\color{primary}}

% Align elements of 'enumerate' and 'itemize' environments with the surrounding
% text left-bound. The default label item will be replaced by a little squared
% box with the secondary color applied.
\setenumerate{itemsep=0pt, topsep=0pt, leftmargin=1.3em}
\setitemize{  itemsep=0pt, topsep=0pt, leftmargin=1.3em}
\renewcommand{\labelitemi}{\color{secondary}$\blacksquare$}


% Increase the horizontal space between two text columns for better readability
% on pages with small font size and high text density.
%
% NOTE: This setting will affect documents with the 'twocolumn' option enabled
%       only, or if the 'multicol' package is used.
\setlength{\columnsep}{1.5em}


% ========
% hyperref
% ========

% Instead of using hyperref's colored borders for links, the link text itself
% will be colorized in the colors of this theme. LaTeX files using this template
% may override these settings to customize the appearance even further.
\hypersetup{
  colorlinks = true,
  allcolors  = black,
  urlcolor   = secondary,
}


% ============
% Page numbers
% ============

% Width of the page number box.
%
% NOTE: The `\flatPageNumWidth` will NOT be enlarged to fit in the actual page
%       number. Additional text may be truncated, if the length doesn't provide
%       enough space for the maximum page number.
\newlength{\flatPageNumWidth}
\setlength{\flatPageNumWidth}{2em}

% Margin between page border and the page number box, used by the 'flat' page
% style for borderless printing.
\newlength{\flatPageNumOuterMargin}
\setlength{\flatPageNumOuterMargin}{1em}

% Define the default page style to be used by the document.
%
% NOTE: The page style needs to be set inside the document section, so geometry
%       changes can be used by the fancyhdr package. Otherwise the default
%       geometry of this class will be used instead of the custom defined one of
%       the LaTeX document using this class.
%
% NOTE: As the page style is defined at the beginning of the document section, a
%       custom page style needs to be defined AFTER this one is loaded, i.e. in
%       the document section instead of the preamble.
\AtBeginDocument{
    \pagestyle{flat}
}

% Create the page number box.
%
% This command creates a little box with a fixed width including the page number
% of the current page. The width of the box can be defined by setting the
% `\flatPageNumWidth` length and will be consistent for all pages.
%
%
% @param #1 text orientation (`l` or `r`)
%
\newcommand{\flatPageNum}[1]{%
    \makebox[\flatPageNumWidth][#1]{%
        \bfseries%
        \color{white}%
        \thepage%
    }%
}

% Define the default 'flat' page style to print the page number in a little box
% in the bottom corner of the page in a borderless design. This page style does
% NOT include any kind of page header.
\fancypagestyle{flat}{
    \fancyhf{}

    % Disable the head rule for this page style, which is not disabled by the
    % `\fancyhf` command. As there is no specific disable command, its height
    % simply gets reduced to zero, which makes it invisible.
    \renewcommand{\headrulewidth}{0pt}

    % Calculate the width between the page number box and the text, so it can be
    % used as negative margin for positioning.
    %
    % NOTE: Instead of using a LaTeX length variable, a command will be defined,
    %       so using it in '\makebox' dynamically calculates the margin for the
    %       current page. This is necessary to allow dynamic altering the page
    %       geometry.
    \newcommand{\flatPageNumMargin}{1in + \evensidemargin
                                    - \flatPageNumWidth
                                    - \flatPageNumOuterMargin
                                    - 2\fboxsep}

    % Finally, define the footer to include the page numbers. For a borderless
    % design, an additional margin between the page border and the page number
    % box will be filled in the same color as the page number box.

    \fancyfoot[LE]{%
        \makebox[0pt][r]{%
            \colorbox{primary}{%
                \makebox[1em]{}%
                \flatPageNum{l}%
            }%
            \makebox[\flatPageNumMargin]{}%
        }%
    }

    \fancyfoot[RO]{%
        \makebox[0pt][l]{%
            \makebox[\flatPageNumMargin]{}%
            \colorbox{primary}{%
                \flatPageNum{r}%
                \makebox[1em]{}%
            }%
        }%
    }
}
