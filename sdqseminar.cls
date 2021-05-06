%% LaTeX2e class for seminar theses
%% sdqseminar.cls
%%
%% Karlsruhe Institute of Technology
%% Institute for Program Structures and Data Organization
%% Chair for Software Design and Quality (SDQ)
%%
%% Dr.-Ing. Erik Burger
%% burger@kit.edu
%%
%% Version 1.0.3, 2020-06-26

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sdqseminar}[2020/06/26 v1.0.3 Seminar thesis class]
% Language options. German is also needed in English thesis for the abstract
\DeclareOption{ngerman}{\PassOptionsToPackage{\CurrentOption}{babel}}
\DeclareOption{english}{\PassOptionsToPackage{main=\CurrentOption,ngerman}{babel}}
% Optionen an scrartcl durchreichen
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax
% Used to detect language families
\RequirePackage{translations}

%% ---------------------------------------------------------------
%% | Based on KOMAscript by Markus Kohm http://www.komascript.de |
%% ---------------------------------------------------------------
\LoadClass{scrartcl}

%% --------------
%% | Typography |
%% --------------

% T1 font encoding
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

% serif type: Linux Libertine
\RequirePackage{libertine}
% Linux Libertine in math mode
\RequirePackage[libertine]{newtxmath}

% grotesque type: Adobe Source Sans Pro
\RequirePackage[scaled=.92]{sourcesanspro}

% monospace type: Bera Mono
\RequirePackage[scaled=.78]{beramono}

% semi-bold type (for subsections and paragraphs)
\newcommand*{\sbdefault}{sb}
\DeclareRobustCommand{\sbseries}{%
  \not@math@alphabet\sbseries\relax
  \fontseries\sbdefault\selectfont}

\DeclareTextFontCommand{\textsb}{\sbseries}

\addtokomafont{subsection}{\sbseries}
\addtokomafont{subsubsection}{\sbseries}
\addtokomafont{paragraph}{\sbseries}

% microtype for nicer typography
\RequirePackage[protrusion=true,expansion=true]{microtype}

% commands for code and model keywords in text
\newcommand{\code}[1]{\texttt{\hyphenchar\font45\relax #1}}
\newcommand{\model}[1]{\textsf{#1}}

% nicer spacing for enumerations
\RequirePackage{enumitem}

%% ---------------
%% | Page Layout |
%% ---------------
\KOMAoptions{
   fontsize=12pt,
   paper=a4,
   titlepage=false,
   headinclude=true,
   footinclude=false,
}

% Margins
\if@twoside%
  \typearea[20mm]{15} % twoside
\else% 
  \typearea[10mm]{15} % oneside
\fi%

\RequirePackage[automark,headsepline,draft=false]{scrlayer-scrpage}
\pagestyle{scrheadings}

\clubpenalty=10000 %prevent orphans
\widowpenalty=10000 %prevent widows

%% --------------
%% | Title page |
%% --------------

%% variables for title page
\newcommand{\theinstitute}{\ifcurrentbaselanguage{English}
    {Institute for Program Structures and Data Organization (IPD)}
    {Institut für Programmstrukturen und Datenorganisation (IPD)}}
\newcommand{\thethesistype}{}
\newcommand{\theadvisor}{}

%% formatting commands for titlepage
\newcommand{\thesistype}[1]{\subtitle{\vskip2em #1 \ifcurrentbaselanguage{English}{of}{von}}%
\renewcommand{\thethesistype}{#1}}
\newcommand{\myinstitute}[1]{\renewcommand{\theinstitute}{#1}}
\newcommand{\advisor}[1]{\renewcommand{\theadvisor}{#1}}

\newcommand{\settitle}{%
\publishers{%
\normalsize
\theinstitute\\
\ifcurrentbaselanguage{English}{Advisor}{Betreuender Mitarbeiter}: \theadvisor
}
}

%% do not show the date
\date{}

%% ------------
%% | Packages |
%% ------------

% draft mode
\RequirePackage{ifdraft}
\RequirePackage{ifthen}

% enumerate subsubsections
\setcounter{secnumdepth}{3}

% wallpaper for title page (KIT-Frame)
\RequirePackage{wallpaper}

% subimport of files
\RequirePackage{import}

% languages
\RequirePackage{babel,csquotes}

% hyphenation for compound words
\RequirePackage[shortcuts]{extdash}

% nice tables
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{array}

% show graphics in draft mode
\RequirePackage{graphicx}
\setkeys{Gin}{draft=false}

% PDF specific packages
\RequirePackage[hyphens]{url}
\RequirePackage[breaklinks,colorlinks=false]{hyperref}
\newcommand\setpdf{\hypersetup{%
    pdftitle={\thethesistype},%
    pdfsubject={\@title},%
    pdfauthor={\@author},%
    pdfborder={0 0 0},%
    }%
    \let\theauthor\@author
}
