\ProvidesClass{bememo}[2023/12/07 v1.0 Federal Trade Commission BE Memo Class]

% Load the Base Class
\LoadClassWithOptions{article}

% Load Packages
\usepackage{amsmath,amssymb,amstext,calc}
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

% Define new commands
\DeclareRobustCommand*{\recommendation}[1]{\gdef\@recommendation{#1}}

% Renew commands
\renewcommand{\sectionautorefname}{Section}
%%%% Roman numerals for section numbering (Follows BE style guide)
\renewcommand{\thesection}{\Roman{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}

% Renew the title
\renewcommand{\maketitle}{
    \begin{singlespace}
        \noindent\begin{minipage}{10em}
            \begin{center}
                \includegraphics[width=6em]{seal.pdf} \\
                \vspace{0.2em}
                \footnotesize Bureau of Economics
            \end{center}
        \end{minipage}
        \hspace{-10em}
        \hfill
        \begin{minipage}{\linewidth-0.5em}
            \begin{center}
                \scriptsize UNITED STATES OF AMERICA \\
                \normalsize FEDERAL TRADE COMMISSION \\
                \scriptsize WASHINGTON, D.C. 20580
            \end{center}
        \end{minipage}
        \vspace{0.3in}
        \begin{center} \bf{ MEMORANDUM } \end{center}
        \vspace{.5in}
        \begin{tabularx}{\textwidth}{lllX}
            To:             &  & Commission       \\
            \\
            From:           &  & \@author         \\
            \\
            Re:             &  & \@title          \\
            \\
            Date:           &  & \@date           \\
            % Add recommendation if it exists
            \ifx\@recommendation\undefined\else   \\
            Recommendation: &  & \@recommendation \\
            \fi
        \end{tabularx}
        \vspace{.3in}
        \medbreak
        %%%% The following lines add the table of contents. Comment out to remove it.
        \tableofcontents
    \end{singlespace}
}

% Redefine the \and command to spefify multiple authors
\renewcommand{\and}{\\&&}

% Set spacing
\doublespacing
