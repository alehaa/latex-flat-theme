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

% Process all defined options. Options not defined by this class will be passed
% through to its parent class automatically, so options available by the default
% article class (e.g. 'twoside' and 'twocolumn') may be used in this theme.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax


% ===============
% Load base class
% ===============

\LoadClass{article}


% ======================
% Load required packages
% ======================

\RequirePackage{geometry}

% The default font for this theme is Roboto, a modern sans-serif font designed
% by Christian Robertson for Google and licensed under the Apache license, which
% makes it free to use for any kind of document.
\RequirePackage[sfdefault,light]{roboto}


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
