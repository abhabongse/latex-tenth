%% ten.cls
%% Author: Abhabongse Janthong
%
% This document class provides preloaded most common packages and most common
% configurations of the document according to my own taste.
%
% It is released under MIT License because the author thinks that the
% LaTeX Project Public License is annoying and life is complicated.
\NeedsTeXFormat{LaTeX2e}[2016/02/01]
\ProvidesClass{ten}[2017/08/26 v0.2 (Abhabongse Janthong)]

%%------------------------------------------------------------------
%%  Very important utility package
%%------------------------------------------------------------------
\RequirePackage{etoolbox}
\RequirePackage{xparse}

%%------------------------------------------------------------------
%%  Define and process variables and options for this document
%%  class. This has to be done before base class is loaded.
%%------------------------------------------------------------------

%%  Whether 'twoside' option is loaded (default: false)
\newbool{istwoside}
\DeclareOption{twoside}{%
    \booltrue{istwoside}%
    \PassOptionsToClass{twoside}{article}%
}
\newbool{issecnum}
\DeclareOption{secnum}{%
    \booltrue{istwoside}%
}

%%  Pass along all other options not captured above
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%%  Now load the base class
\LoadClass{article}

%%------------------------------------------------------------------
%%  Setup paper margin and marginnote command.
%%------------------------------------------------------------------
\RequirePackage[%
    top=1.25in,bottom=1.25in,outer=1.75in,inner=1in,heightrounded,%
    marginparwidth=1in,marginparsep=1.25pc,head=2pc,foot=3.5pc]{geometry}

%%------------------------------------------------------------------
%%  Setup marginnote command.
%%------------------------------------------------------------------
\RequirePackage[heightadjust]{marginnote}
\renewrobustcmd*\marginnotevadjust{4.33pt}
\renewrobustcmd*\marginfont{\color{OrangeRed4}\footnotesize\setstretch{1}}
\newrobustcmd{\marginhead}[1]{\marginnote{\color{black}\itshape{}#1}}

\RequirePackage[hang,flushmargin]{footmisc}
\setlength{\footnotemargin}{0.5pc}

%%------------------------------------------------------------------
%%  Setup constant lengths for parts of document.
%%------------------------------------------------------------------
\RequirePackage{setspace}
\setstretch{1.33}
\setlength{\parskip}{0pc}
\setlength{\parindent}{2pc}
\setlength{\abovedisplayskip}{0.75pc plus 0.25pc minus 0.25pc}
\setlength{\belowdisplayskip}{0.75pc plus 0.25pc minus 0.25pc}
\setlength{\abovedisplayshortskip}{0.75pc plus 0.25pc minus 0.25pc}
\setlength{\belowdisplayshortskip}{0.75pc plus 0.25pc minus 0.25pc}

%%------------------------------------------------------------------
%%  Setup font families (including for math)
%%------------------------------------------------------------------
\RequirePackage[T1]{fontenc}
\RequirePackage{libertine}
\RequirePackage[varqu,varl]{inconsolata}
%% Include math fonts.
\RequirePackage{amsthm}
\RequirePackage[libertine]{newtxmath}

%% Setup font names
\newrobustcmd\linuxlibertine{LinuxLibertineT-TLF}
\newrobustcmd\linuxbiolinum{LinuxBiolinumT-TLF}
\newrobustcmd\inconsolata{zi4}

%%------------------------------------------------------------------
%%  Load 'microtype' which is the best package ever
%%------------------------------------------------------------------
\RequirePackage[%
    activate={true,nocompatibility},final,tracking=true,letterspace=60,%
    kerning=true,spacing=true,factor=1150,stretch=15,shrink=15]{microtype}
\microtypecontext{spacing=nonfrench}
\SetExtraKerning[unit=space]%
    {encoding={*},family={\linuxlib},series={*},%
        size={footnotesize,small,normalsize}}%
    {\textendash={250,250},      % en-dash, add more space around it
     \textemdash={300,300},      % em-dash, add more space around it
     "28={,150},                 % left bracket, add space from right
     "29={150,},                 % right bracket, add space from left
     \textquotedblleft={,150},   % left quotation mark, space from right
     \textquotedblright={150,}}  % right quotation mark, space from left

%%------------------------------------------------------------------
%%  Setup color choices
%%------------------------------------------------------------------
\RequirePackage[dvipsnames,svgnames,x11names,table,fixpdftex,hyperref]{xcolor}

% Color settings for mdframed
\definecolor{DefaultShade}{gray}{0.975}
\definecolor{DefaultBorder}{gray}{0.75}
\colorlet{YellowShade}{LightYellow1!50}
\colorlet{YellowBorder}{LightYellow4!40}
\colorlet{GreenShade}{DarkSeaGreen1!50}
\colorlet{GreenBorder}{DarkSeaGreen4!40}

% Color settings for listings
\colorlet{PrimaryKeyword}{RoyalBlue3}
\colorlet{SecondaryKeyword}{Red3}
\colorlet{TertiaryKeyword}{TealBlue}
\colorlet{Identifier}{black}
\colorlet{String}{Red3}
\colorlet{Symbol}{Ivory4!60!Gold4}
\colorlet{Comment}{Green4}

% Commands for colored squares
\newrobustcmd{\redsq}{{\textcolor{red}{$\blacksquare$}}}
\newrobustcmd{\greensq}{{\textcolor{green}{$\blacksquare$}}}
\newrobustcmd{\bluesq}{{\textcolor{blue}{$\blacksquare$}}}
\newrobustcmd{\yellowsq}{{\textcolor{yellow}{$\blacksquare$}}}

%%------------------------------------------------------------------
%%  Setup math equations and symbols
%%------------------------------------------------------------------
\RequirePackage{amsmath}
\RequirePackage{IEEEtrantools}
\RequirePackage{mathtools}
\RequirePackage{chemarrow}
\RequirePackage{fdsymbol}  % Nicer looking standard symbols
\RequirePackage{fontawesome}  % FontAwesome symbols package
\RequirePackage{adforn}  % Ornaments package
\RequirePackage{textcomp}
\RequirePackage{aliascnt}

% Customization of math environment
\renewrobustcmd{\qedsymbol}{$\blacksquare$}
\newrobustcmd{\pencileq}[1]{{\footnotesize\faPencil}\,\textbf{#1}}
\def\tagform@#1{\maketag@@@{(\ignorespaces\pencileq{#1}\unskip\@@italiccorr)}}
\renewrobustcmd{\eqref}[1]{\textup{\maketag@@@{(\hyperref[#1]{\ignorespaces\pencileq{\ref*{#1}}\unskip\@@italiccorr})}}}

%%------------------------------------------------------------------
%%  Setup mdframed environment
%%------------------------------------------------------------------
\RequirePackage[xcolor]{mdframed}

\mdfdefinestyle{standard}{%
    backgroundcolor=DefaultShade,linecolor=DefaultBorder,%
    skipabove=0.5pc,skipbelow=0.25pc%
}
\mdfdefinestyle{mathbox}{%
    backgroundcolor=DefaultShade,linecolor=DefaultBorder,%
    skipabove=0.75pc,skipbelow=0.25pc,%
    splitbottomskip=0.75pc,splittopskip=1.25pc,%
    innertopmargin=0pc,footnoteinside=true,%
    nobreak=false%
}
\mdfdefinestyle{blankbox}{%
    linecolor=DefaultBorder,linewidth=0.25pc%
    innerleftmargin=0.25pc,%
    skipabove=1.0pc,skipbelow=0.5pc,%
    splitbottomskip=0.75pc,splittopskip=1.25pc,%
    innertopmargin=0.25pc,footnoteinside=true,%
    nobreak=false,topline=false,bottomline=false,rightline=false%
}

%%------------------------------------------------------------------
%%  Setup math theorem environments
%%------------------------------------------------------------------
%% Set the shortcut to create new alias and define new theorem environment

\DeclareDocumentCommand\newmdftheorem{O{} m o m o}{%
    % Numbered theorem
    \IfValueTF{#3}{%
        \IfValueTF{#5}{\newtheorem{#2}[#3]{#4}[#5]}%
                      {\newtheorem{#2}[#3]{#4}}%
    }{ % else
        \IfValueTF{#5}{\newtheorem{#2}{#4}[#5]}%
                      {\newtheorem{#2}{#4}}%
    }%
    \BeforeBeginEnvironment{#2}{\begin{mdframed}[style=mathbox,#1]}%
    \AfterEndEnvironment{#2}{\end{mdframed}}%
    % Provide autorefname
    \expandafter\providerobustcmd\csname#2autorefname\endcsname{#3}
    % Unnumbered Theorem
    \newtheorem*{#2*}{#4}%
    \BeforeBeginEnvironment{#2*}{\begin{mdframed}[style=mathbox,#1]}%
    \AfterEndEnvironment{#2*}{\end{mdframed}}%
}

\newrobustcmd*\newmdfxtheorem[2]{%
    \newtheorem*{#1}{#2}%
    % \expandafter\renewrobustcmd\csname end#1\endcsname%
    %     {\hfill$\Diamond$\endtrivlist}%
    \BeforeBeginEnvironment{#1}{\begin{mdframed}[style=blankbox]}%
    \AfterEndEnvironment{#1}{\end{mdframed}}%
}

% \theoremstyle{plain}
\theoremstyle{definition}
\newmdftheorem{theorem}{Theorem}
\newmdftheorem{lemma}{Lemma}
\newmdftheorem{corollary}{Corollary}
\newmdftheorem{proposition}{Proposition}
\newmdftheorem{conjecture}{Conjecture}
\newmdftheorem{criterion}{Criterion}
\newmdftheorem{assertion}{Assertion}

\newmdftheorem{definition}{Definition}
\newmdftheorem{condition}{Condition}
\newmdftheorem{problem}{Problem}
\newmdftheorem[backgroundcolor=GreenShade]{example}{Example}
\newmdftheorem{exercise}{Exercise}
\newmdftheorem{algorithm}{Algorithm}
\newmdftheorem{question}{Question}
\newmdftheorem{axiom}{Axiom}
\newmdftheorem{property}{Property}
\newmdftheorem{assumption}{Assumption}
\newmdftheorem{hypothesis}{Hypothesis}
\newmdftheorem{fact}{Fact}

\theoremstyle{remark}
\newmdfxtheorem{remark}{Remark}
\newmdfxtheorem{note}{Note}
\newmdfxtheorem{notation}{Notation}
\newmdfxtheorem{claim}{Claim}
\newmdfxtheorem{summary}{Summary}
\newmdfxtheorem{acknowledgement}{Acknowledgement}
\newmdfxtheorem{case}{Case}
\newmdfxtheorem{conclusion}{Conclusion}
\newmdfxtheorem{hint}{Hint}


%%------------------------------------------------------------------
%%  Enumeration package
%%------------------------------------------------------------------
\RequirePackage{enumitem}
\RequirePackage{alphalph}
\setlist{%
    topsep=0.25pc,itemsep=0.25pc,partopsep=0pc,parsep=0pc,listparindent=2pc,%
    itemindent=0pc}
\setlist[description]{itemindent=-2pc}
\setlist[2]{topsep=0.5pc,itemsep=0.5pc}
\setlist[1]{topsep=1pc,itemsep=1pc}
% FontAwesome replacement for bullet points
\setlist[itemize,1]{label={\small\faChevronCircleRight}}

%%------------------------------------------------------------------
%%  Set numbering of pages and enumerations
%%------------------------------------------------------------------
\newrobustcmd{\footerpage}{\arabic{page}}

%%------------------------------------------------------------------
%%  Professional looking tabular styles
%%------------------------------------------------------------------
\RequirePackage{array, booktabs}

%%------------------------------------------------------------------
%%  Graphics and figures packages
%%------------------------------------------------------------------
\RequirePackage[pdftex]{graphicx}
\RequirePackage[%
    margin=1pc,font={footnotesize},labelfont={bf},labelsep=period,%
    format=plain,indention=1pc,justification=justified]{caption}
\RequirePackage{subcaption}
% \DeclareCaptionFormat{llap}{\llap{#1#2}#3\par}
% \captionsetup{format=llap,labelsep=quad,singlelinecheck=no}

%%------------------------------------------------------------------
%%  Code listings package and settings
%%------------------------------------------------------------------
\RequirePackage{listings}
\lstset{%
    % Basic Settings
    basicstyle={\small\ttfamily},%
    captionpos=b,%
    % Margins and Background
    xleftmargin=2.5pc,%
    xrightmargin=1.5pc,%
    frame=none,%
    framesep=0.5pc,%
    framextopmargin=0pc,%
    framexbottommargin=0pc,%
    framexleftmargin=0pc,%
    framexrightmargin=0pc,%
    % Spacing and Horizontal Flow
    showspaces=false,%
    showstringspaces=false,%
    showtabs=false,%
    tabsize=2,%
    breaklines=true,%
    columns=fullflexible,%
    keepspaces=true,%
    % Vertical Flow
    aboveskip=\bigskipamount,%
    belowskip=\medskipamount,%
    abovecaptionskip=\medskipamount,%
    belowcaptionskip=\smallskipamount,%
    lineskip=0.0001pt,
    % Line Numbers
    stepnumber=1,%
    numbers=left,%
    numbersep=1pc,%
    numberstyle=\ttfamily\color{DarkGray},%
    % Special Keyword Format
    stringstyle=\color{String},%
    commentstyle=\color{Comment},%
    identifierstyle=\color{Identifier},%
    keywordstyle=[1]{\bfseries\color{PrimaryKeyword}},%
    keywordstyle=[2]{\bfseries\color{SecondaryKeyword}},%
    keywordstyle=[3]{\bfseries\color{TertiaryKeyword}},%
    extendedchars=true}
\captionsetup[lstlisting]{margin={2pc,-3.00001pc},oneside}
\renewrobustcmd\lstlistingname{Source Code}
\newrobustcmd{\lstnumberautorefname}{Line}

\let\origthelstnumber\thelstnumber
\newrobustcmd*\SuppressNumber{%
    \lst@AddToHook{OnNewLine}{%
        \let\thelstnumber\relax%
        \advance\c@lstnumber-\@ne\relax}}
\newrobustcmd*\ReactivateNumber{%
    \lst@AddToHook{OnNewLine}{%
        \let\thelstnumber\origthelstnumber%
        \advance\c@lstnumber\@ne\relax}}
\newrobustcmd*\ActivateNumber[1]{%
    \setcounter{lstnumber}{\numexpr#1-1\relax}
    \lst@AddToHook{OnNewLine}{%
        \let\thelstnumber\origthelstnumber%
        \refstepcounter{lstnumber}}}

\lstdefinelanguage{pseudocode}{%
    keywordstyle=[1]{\bfseries\color{PrimaryKeyword}},%
    keywordstyle=[2]{\bfseries\color{SecondaryKeyword}},%
    keywordstyle=[3]{\color{TertiaryKeyword}},%
    morekeywords={[1],if,then,else,while,do,end,loop,until,for,to,downto,%
        return,print,def},%
    morekeywords={[2],true,false,null,nil},%
    sensitive=false,%
    morestring=[b]",%
    morestring=[b]',%
    morecomment=[l]{//},%
    literate=*%
        %% Single character
        {:}{{{\bfseries\color{Symbol}{:}}}}1
        ,
    mathescape=true}

%%------------------------------------------------------------------
%%  Page header package and settings
%%------------------------------------------------------------------
\RequirePackage{fancyhdr}
\newrobustcmd{\leftheader}{}  % renew to set inner header
\newrobustcmd{\rightheader}{}  % renew to set outer header

% Set up page header and footer for first page
\fancypagestyle{plain}{%
    \fancyhf{}  % clear all header and footer fields
    \fancyfoot[R]{\color{DarkGray}\small \footerpage}}

% Set up page header and footer for all other pages
\fancyhf{}  % clear all header and footer fields
\ifbool{istwoside}{%
    \fancyhead[LE]{\color{Gray}\scshape\textls[120]{\leftheader}}
    \fancyhead[RO]{\color{Gray}\scshape\textls[120]{\rightheader}}
    \fancyfoot[LE,RO]{\color{Gray}\small \footerpage}}%
{%else
    \fancyhead[L]{\color{Gray}\scshape\textls[120]{\leftheader}}
    \fancyhead[R]{\color{Gray}\scshape\textls[120]{\rightheader}}
    \fancyfoot[R]{\color{Gray}\small \footerpage}}

\pagestyle{fancy}

% Remove lines
\renewrobustcmd{\headrulewidth}{0pt}
\renewrobustcmd{\footrulewidth}{0pt}

%%------------------------------------------------------------------
%%  Special underline package
%%------------------------------------------------------------------
\RequirePackage{ulem}
\normalem

%%------------------------------------------------------------------
%%  Additional definitions
%%------------------------------------------------------------------
% Define hair space
\newrobustcmd{\hrsp}{\ifmmode\mskip1mu\else\kern0.0625em\fi}

% Define shorthands for mathematical sets
\newrobustcmd{\Algebraic}{\mathbb{A}}
\newrobustcmd{\Complex}{\mathbb{C}}
\newrobustcmd{\Field}{\mathbb{F}}
\newrobustcmd{\Natural}{\mathbb{N}}
\newrobustcmd{\Quotient}{\mathbb{Q}}
\newrobustcmd{\Real}{\mathbb{R}}
\newrobustcmd{\Zahlen}{\mathbb{Z}}

% Define shorthand for overline
\newrobustcmd{\ol}{\overline}

% Define shorthand for blocks
\newrobustcmd{\hl}[2][LightGray!20]{%
    \ifmmode{\mathchoice%
        {\colorbox{#1}{$\displaystyle #2$}}%
        {\colorbox{#1}{$\textstyle #2$}}%
        {\colorbox{#1}{$\scriptstyle #2$}}%
        {\colorbox{#1}{$\scriptscriptstyle #2$}}}%
    \else%
        {\colorbox{#1}{#2}}%
    \fi}
\newrobustcmd{\rhl}[1]{\hl[Red1!25]{#1}}
\newrobustcmd{\ghl}[1]{\hl[Chartreuse3!25]{#1}}
\newrobustcmd{\bhl}[1]{\hl[Blue1!10]{#1}}
\newrobustcmd{\yhl}[1]{\hl[Yellow2!30]{#1}}

% Define some more math operators
\DeclareMathOperator{\sgn}{sgn}
\DeclareMathOperator*{\argmax}{arg{\hrsp}max}
\DeclareMathOperator*{\argmin}{arg{\hrsp}min}

%%------------------------------------------------------------------
%%  Tikz package for drawing
%%------------------------------------------------------------------
% These are no longer included since it returns lots of errors/warnings
% \RequirePackage{tikz}
% \RequirePackage{pstricks}
% \RequirePackage{epsfig,pst-node}
% \RequirePackage{pst-grad,pst-plot}
% \usetikzlibrary{positioning}

%%------------------------------------------------------------------
%%  Final hyperref package
%%------------------------------------------------------------------
% Include this package to allow cross-reference hyperlink
% PEOPLE SAY THIS SHOULD BE ADDED LAST
\RequirePackage[pdftex,unicode]{hyperref}
\newrobustcmd\sectionref[1]{\hyperref[#1]{\S\ref*{#1}}}