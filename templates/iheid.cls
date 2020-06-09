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
\graphicspath{{./Graphics/}} % here we point to the directory named 'Graphics' inside the directory of this file

% Setup bibliography % % %
\RequirePackage[backend=biber, % if this doesn't work for you, use bibtex8 as a backend
%style=verbose, % use this if you are in the law department
style=authoryear, % use this if you are in any other department
maxcitenames=3, % how many authors to cite before resorting to ``et al''
maxbibnames=99, % in the bibliography we want them all though
sortcites=true, % this re-sorts citations alphabetically when you cite several at once
hyperref=true, % this adds a link to a citations date that points to the reference
%backref=true, % references state on which page they are cited
abbreviate=true,
url=false, % don't add (lengthy) URL information
doi=false, % don't add (lengthy) DOI information
autolang=hyphen]{biblatex}
% The following is where you put the path to your bibliography:
\addbibresource{mybib.bib}

% Setup meta-data of your project
\input{projectinfo.cls} % modify your title, name etc. in this file
\title{\mytitle}
\newcommand{\myauthor}{\myfirstname {} \mylastname}
\author{\myauthor}
\newcommand{\mylogo}{Logo_CMYK_Hi.eps} % name of the IHEID logo file

% Setup links and PDF metadata
\usepackage{varioref} % automated decoration of references with words about position
\RequirePackage[colorlinks=true,linkcolor=black,citecolor=red,filecolor=red,urlcolor=red, bookmarks]{hyperref} % uses IHEID red for external links
\hypersetup{
pdftitle = {\mytitle},
pdfsubject = {\mysubject},
pdfauthor = {\myauthor},
pdfkeywords = {\mykeywords},
draft = false, % activates package
}
\RequirePackage{hypcap} % fix for more precise in-document links

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
