%-------------------------- identification ---------------------
% iheiddiss v0.1.1
% By James Hollway <james.hollway@graduateinstitute.ch>
% Original v0.0.1 based on ociamthesis v2.2 by Keith A. Gillow <gillow@maths.ox.ac.uk>
%
% Note that this template attempts to model the official PhD Dissertation template, available at:
% https://graduateinstitute.ch/sites/default/files/2019-07/PhD_Specimen_6_first_pages.docx

\LoadClass[12pt,a4paper,twoside]{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iheid}[2020/05/06 Graduate Institute Geneva Dissertation Class]

% Setup document % % %
\RequirePackage{geometry}
\geometry{dvips,a4paper,margin=0.75in,includeheadfoot,headheight=15pt}
\linespread{1.5} % adjust line spacing
\RequirePackage{ragged2e} % this offers options for centering, justification, etc.

% Setup fonts % % %
\RequirePackage[T1]{fontenc} % requires XeLatex or LuaTex (remove to use pdfLaTex)
%\RequirePackage[utf8]{inputenc} % ignored when using XeLaTex or LuaTex (uncomment when using pdfLaTex)
\RequirePackage{microtype} % this makes fonts almost imperceptibly smoother
\RequirePackage{fontspec} % requires XeLatex or LuaTex (remove to use pdfLaTex)
% For the headings we will use Helvetica
\RequirePackage{helvet}
\RequirePackage{sectsty}
\allsectionsfont{\sffamily}
% For the main text and equations we will use Baskerville and Palatino
\RequirePackage{mathpazo}
\RequirePackage{baskervald}
% For formatting code or package names, we will use Lucida Console
\RequirePackage{zi4}

% Setup figures % % %
\RequirePackage[]{graphicx}
% The following is where you put all graphics you include, using the '\includegraphics' command
% Note that this directory must have a copy of the IHEID logo, as referenced with the '\mylogo' command above
\graphicspath{{./graphics/}} % here we point to the directory named 'Graphics' inside the directory of this file

% Setup header and footer
\RequirePackage{fancyhdr} % package to customize page headers
\pagestyle{fancy}
\fancyhead[HLO]{\mytitle} % set header: H = header, L = left side, O = odd page number
\fancyhead[HRE]{\myauthor} % set header: H = header, R = right side, E = even page number
\fancyhead[HRO,HLE]{\thepage} % set header: page number on left/right side
\cfoot{} % set footer: leave empty
\renewcommand{\headrulewidth}{0.01pt} % header line width
\renewcommand{\footrulewidth}{0pt} % footer line width (set to 0 to remove)

% Optional packages
\usepackage{float} % allow forced placement of figures/tables
\usepackage{makecell} % fixed-width cells in tables
\usepackage{multirow} % rowspan in tables
\usepackage{booktabs} % nicer lines for tables
\usepackage{titlesec} % customize sections
\usepackage[hypcap]{caption} % customize captions
\usepackage[capitalise]{cleveref} % automatic detection of link types

% Optional adjustments to style of sections and paragraphs
\newcommand{\sectionbreak}{\clearpage} % start sections on new page
\titleformat{\section}{\normalfont\LARGE\bfseries}{\thesection.}{1em}{} % section title style
\titlespacing*{\section}{0pt}{\parskip}{-\parskip} % spacing between section title and paragraph
\titleformat{\subsection}{\normalfont\large\bfseries}{\thesubsection.}{1em}{} % subsection title style
\titlespacing*{\subsection}{0pt}{\parskip}{-\parskip} % spacing between subsection title and paragraph
\titleformat{\subsubsection}{\normalfont\normalsize\itshape}{\thesubsubsection.}{1em}{} % subsubsection title style
\titlespacing*{\subsubsection}{0pt}{\parskip}{-\parskip} % spacing between subsubsection title and paragraph
\setlength{\parskip}{1em} % paragraph spacing
\setlength{\parindent}{0em} % paragraph indentation
\captionsetup[figure]{font={it},labelformat={default},labelsep=period,textfont={normal},justification=justified,name={Figure}} % figure caption style
\captionsetup[table]{font={it},labelformat={default},labelsep=period,textfont={normal},justification=justified,name={Table}} % table caption style



% Environments % % %

% This macro defines an environment for front matter that is always 
% single column even in a double-column document.

\newenvironment{alwayssingle}{%
       \@restonecolfalse
       \if@twocolumn\@restonecoltrue\onecolumn
       \else\if@openright\cleardoublepage\else\clearpage\fi
       \fi}%
       {\if@restonecol\twocolumn
       \else\newpage\thispagestyle{empty}\fi}


% define title page layout

% TITLEPAGE 1
\renewcommand{\maketitle}{%
\begin{alwayssingle}\null
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
    
\begin{titlepage}
\hspace*{-1.25cm}
\includegraphics[width=0.4\linewidth]{\mylogo}

\maketitle

\vspace*{1cm}

\sffamily{Thesis No. \mythesisno}

\vspace*{1cm}
\sffamily\textbf{Geneva}\\
\sffamily\textbf{\the\year}

\thispagestyle{firstpages} % this line is needed to set a different header/footer than for the rest of the document
\end{titlepage}

% TITLEPAGE 2 (empty page)
\newpage\null\thispagestyle{empty}\newpage

% TITLEPAGE 3
\begin{titlepage}
\vspace*{5cm}

\centering\Large\sffamily\textbf{\mytitle}

\vspace*{10cm}

\large\raisebox{0.1em}{\textcopyright} \sffamily\textbf{\the\year} \hspace{1em} \sffamily\textbf{\MakeUppercase{\mylastname}}

\thispagestyle{firstpages}
\end{titlepage}

% TITLEPAGE 4
\begin{titlepage}
\centering\sffamily{
INSTITUT DE HAUTES ETUDES INTERNATIONALES ET DU DEVELOPPEMENT\\
GRADUATE INSTITUTE OF INTERNATIONAL AND DEVELOPMENT STUDIES
}

\maketitle

\vspace*{1cm}

\sffamily{Thesis No. \mythesisno}

\vspace*{1cm}
\sffamily\textbf{Geneva}\\
\sffamily\textbf{\the\year}

\thispagestyle{firstpages}
\end{titlepage}

% TITLEPAGE 5
\begin{titlepage}

\textcolor{red}{PLACEHOLDER: REPLACE PAGE WITH A DOCUMENT PROVIDED BY PHD SECRETARIAT}

\thispagestyle{firstpages}
\end{titlepage}

% TITLEPAGE 6
\begin{titlepage}
\centering\sffamily{
INSTITUT DE HAUTES ETUDES INTERNATIONALES ET DU DEVELOPPEMENT\\
GRADUATE INSTITUTE OF INTERNATIONAL AND DEVELOPMENT STUDIES
}

\vspace*{1cm}

\begin{center}
\sffamily\large\textbf{RESUME / ABSTRACT}

\sffamily\normalsize{
	\begin{abstract}
	$abstract$
\end{abstract}
\end{center}

\thispagestyle{firstpages}
\end{titlepage}
\restoregeometry % Reset page geometry
\setcounter{page}{1} % Reset page counter

% abstract
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\renewenvironment{abstract}%
{   \begin{alwayssingle}\chapter*{Abstract}
    \thispagestyle{empty}
    \pagestyle{empty}
   \setlength{\baselineskip}{\frontmatterbaselineskip}}
{\end{alwayssingle}}

% dedication
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{dedication}
{\begin{alwayssingle}
  \thispagestyle{empty}
  \vspace*{\fill} \begin{center}}
{\end{center}\vspace*{\fill}\vspace*{\fill} \end{alwayssingle}}


% acknowledgements
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acknowledgements}%
{   \begin{alwayssingle}\chapter*{Acknowledgements}
    \thispagestyle{empty}
	\pagestyle{empty}
	\setlength{\baselineskip}{\frontmatterbaselineskip}
}
{\end{alwayssingle}}


% Romanpages
\newenvironment{romanpages}
{\cleardoublepage\setlength{\baselineskip}{\frontmatterbaselineskip}\setcounter{page}{1}\renewcommand{\thepage}{\roman{page}}}
{\cleardoublepage\setcounter{page}{1}\renewcommand{\thepage}{\arabic{page}}}

% JEM: VERSE, QUOTATION, and QUOTE must be single-spaced.
% These rename the internal commands for the \begin{...} and
% \end{...} environment commands.
\let\@ldquote=\quote
\let\@ldendquote=\endquote
\renewenvironment{quote}
   {\@ldquote\setlength{\baselineskip}{\singlebaselineskip}}
   {\@ldendquote}

\let\@ldqttn=\quotation
\let\@ldendqttn=\endquotation
\renewenvironment{quotation}
   {\@ldqttn\setlength{\baselineskip}{\singlebaselineskip}}
   {\@ldendqttn}

\let\@ldverse=\verse
\let\@ldendverse=\endverse
\renewenvironment{verse}
   {\@ldverse\setlength{\baselineskip}{\singlebaselineskip}}
   {\@ldendverse}

% JEM: Stuff for List of Abbreviations (or Glossary or other list)
\usepackage{calc}
\newcommand{\t@cfill}{\cleaders\hbox{$\m@th \mkern\@dotsep mu . \mkern\@dotsep mu$}\hfill}
\newcommand{\abbrl@bel}[1]{\makebox[\labelwidth][l]{\textbf{#1}\ \t@cfill}}
\newenvironment{mclistof}[2]{%
   \chapter*{#1}%
   \addcontentsline{toc}{chapter}{#1}
   \begin{list}{}%
   {\renewcommand{\makelabel}{\abbrl@bel}%
    \setlength{\labelwidth}{#2}%
    \setlength{\leftmargin}{\labelwidth+\labelsep}%
    \setlength{\itemsep}{0pt}%
    \markboth{#1}{#1}%
   }}
   {\end{list}\mtcaddchapter}

\usepackage[nottoc]{tocbibind}
	% Used for inserting the Bibliography, List of Figures, indices, etc into the table of contents.

% JEM: Allow flexible spacing after figures, to reduce other stretching
\setlength{\textfloatsep}{20pt plus15pt minus4pt}

% JEM: All of this is so that headers in these sections aren't uppercase
\let\@ldtoc\tableofcontents
\renewcommand*\tableofcontents{{%
\renewcommand*\MakeUppercase[1]{##1}\@ldtoc}}
\let\@ldlof\listoffigures
\renewcommand*\listoffigures{{%
\renewcommand*\MakeUppercase[1]{##1}\@ldlof}}
\let\@ldlot\listoftables
\renewcommand*\listoftables{{%
\renewcommand*\MakeUppercase[1]{##1}\@ldlot}}
\let\@ldbib\bibliography
\renewcommand*\bibliography[1]{{%
\renewcommand*\MakeUppercase[1]{##1}\@ldbib{#1}}}

% JEM: for crazy multi character set quotes and Unicode and all
\usepackage{lmodern}
\usepackage[LGR,TS1,T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[greek,latin,english]{babel}
\usepackage{csquotes}
\hyphenpenalty=500
\def\longs{{\fontencoding{TS1}\selectfont s}}

% JEM: adjust start-of-chapter spacing
\renewcommand{\chapterheadstartvskip}{\vspace*{40pt}}
\renewcommand{\chapterheadendvskip}{\vspace{30pt}}


% JEM: combine all of the commands you run before appendices start
\newcommand{\startappendices}
  {\appendix\adjustmtc\noappendicestocpagenum\addappheadtotoc\appendixpage}


