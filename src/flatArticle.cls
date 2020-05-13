% This file is part of latex-flat-theme.
%
% Copyright (c)
%   2020 Alexander Haase <ahaase@alexhaase.de>
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
\ProvidesClass{flatArticle}[2020/03/31 a flat and modern article class]


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
\RequirePackage{enumitem}
\RequirePackage{geometry}
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
