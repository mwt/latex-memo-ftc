\ProvidesClass{bememo}[2023/12/07 v1.0 Federal Trade Commission BE Memo Class]

% Load the Base Class
\LoadClassWithOptions{article}

% Load Packages
\usepackage[UKenglish]{isodate}
\usepackage{graphicx}
\usepackage{tabularx}
\usepackage[margin=1.0in]{geometry}
\usepackage{setspace}

% Control link colors
\usepackage{hyperref}
\hypersetup{
    colorlinks=true,            % false: boxed links; true: colored links
    linkcolor=black,            % color of internal links
    citecolor=black,            % color of links of bibliography
    urlcolor=cyan,              % color of external links
    pdfpagelayout=OneColumn}

% Use iso date format
\cleanlookdateon

% Set spacing
\doublespacing

% Define new commands
\DeclareRobustCommand*{\recommendation}[1]{\gdef\@recommendation{#1}}

% Renew section commands
\renewcommand{\sectionautorefname}{Section}
%%%% Roman numerals for section numbering (Follows BE style guide)
\renewcommand{\thesection}{\Roman{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}

% Renew the maketitle command when there is no titlepage
\renewcommand{\@maketitle}{
    \begin{singlespace}
        \noindent\hspace{-0.325in}% Move the FTC seal to the left of the margin
        \begin{minipage}{1.5in}
            \centering
            \includegraphics[width=0.85in]{seal.pdf} \\
            \vspace{0.2em}
            \footnotesize Bureau of Economics
        \end{minipage}%
        \hspace{-1.175in}% Should be minipage width (1.5in) - seal margin (0.325in)
        \begin{minipage}{\linewidth}
            \centering
            \scriptsize UNITED STATES OF AMERICA \\
            \normalsize FEDERAL TRADE COMMISSION \\
            \scriptsize WASHINGTON, D.C. 20580
        \end{minipage}
        \vspace{0.3in}
        \begin{center} \bf{ MEMORANDUM } \end{center}
        \vspace{0.5in}
        \begin{tabularx}{\textwidth}{llX}
            To:             &  & Commission       \\[1em]
            From:           &  & \@author         \\[1em]
            Re:             &  & \@title          \\[1em]
            Date:           &  & \@date
            % Add recommendation if it exists
            \ifx\@recommendation\undefined        \\
            \else                                 \\[1em]
            Recommendation: &  & \@recommendation \\
            \fi
        \end{tabularx}
        \vspace{0.3in}
        %%%% The following lines add the table of contents. Comment out to remove it.
        \tableofcontents
    \end{singlespace}
}

% Redefine the \and command to spefify multiple authors
\renewcommand{\and}{\\&&}
