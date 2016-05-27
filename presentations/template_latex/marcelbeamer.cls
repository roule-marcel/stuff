%% 
%% This is file `etisbeamer.cls' v2.0
%%
%% A comfortable beamer class to produce presentations for ETIS users
%% and compatible with each kind of compilation
%% 
%% Copyright (C) May 2011 Gael Rigaud
%% 
%% Attention !!
%% package "pict2e" is necessary to avoid warnings
%% directory "Logos/" has to be in the project directory to display %% logos

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{etisbeamer}[12/06/2011, v2.0]

\LoadClassWithOptions{beamer}


%% Packages
\RequirePackage{geometry} 
\RequirePackage{graphicx}
\RequirePackage{pict2e}
\usepackage{multirow}
\usepackage{tikz}

%% Themes de departs
\useinnertheme[shadow=true]{rounded}
\useoutertheme{shadow}
\usecolortheme{orchid}
\usecolortheme{whale}
    
%% Couleurs du theme
\definecolor{orange1}{RGB}{173,92,133} %% TODO Not orange anymore!
\definecolor{orange2}{RGB}{153,51,102} %% TODO Not orange anymore!
%\definecolor{orange1}{RGB}{242,164,77}
%\definecolor{orange2}{RGB}{238,113,55}
\definecolor{blue1}{RGB}{18,67,180}
\colorlet{blue2}{blue1!60!black}
\definecolor{green1}{rgb}{0,0.5,0}

\mode<presentation>

%% Gestion des dimensions du header
\newlength{\logowidth}
\setlength{\logowidth}{\paperwidth}
\newlength{\headerwidth}
\setlength{\headerwidth}{0.85\paperwidth}

\newsavebox{\myLogo}
\newcommand{\logoheader}[2]{
\sbox{\myLogo}{\includegraphics[width=#1]{#2}}
\addtolength{\logowidth}{-#1}
}


\mode<all>

%% Ligne verticale
\def\HRule#1#2#3{\centering\color{#1}\rule{#2}{#3}}     

%% Items des sections/sousssections  dans la toc  
\setbeamertemplate{sections/subsections in toc}[circle]

%% Definition des couleurs des differents elements
\setbeamercolor{normal text}{fg=black, bg=white} % couleur du texte
\setbeamercolor{structure}{fg=orange2}%blue1!60!black} % puces et titre des blocks normaux
\setbeamercolor{palette primary}{use={structure,normal text},fg=blue1} %theme
\setbeamercolor{palette secondary}{use={structure,normal text},fg=blue1}%theme
\setbeamercolor{palette tertiary}{use={structure,normal text},bg=black,fg=blue2} %theme
\setbeamercolor{palette quaternary}{use={structure,normal text},fg=structure.fg,bg=blue1} % theme   
\setbeamercolor{block title}{fg=white,bg=blue1}
\setbeamercolor{block body}{fg=black,bg=blue1!10}
\setbeamercolor*{block title example}{fg=white,bg=green1}
\setbeamercolor*{block body example}{fg=normal text.fg,bg=green1!10} 
\setbeamercolor*{block title alerted}{fg = white,bg = red}
\setbeamercolor*{block body alerted}{bg = red!10}
\setbeamercolor{titlelike}{fg=white}%orange1}
\setbeamercolor{subtitle}{fg=blue1}
\setbeamercolor{section in toc}{fg=blue1}
\setbeamercolor{subsection in toc}{fg=blue2}
\setbeamercolor{title}{bg=blue2,fg=white}
\setbeamercolor{author}{fg=blue1}
\setbeamercolor{institute}{fg=blue1}
\setbeamercolor{date}{fg=blue1}
\setbeamercolor{author in head/foot}{fg=blue1}
\setbeamercolor{title in head/foot}{fg=blue1}
\setbeamercolor{date in head/foot}{fg=blue1}                
\setbeamercolor*{author in head/foot}{parent=palette tertiary}
\setbeamercolor*{title in head/foot}{parent=palette secondary}
\setbeamercolor*{date in head/foot}{parent=palette primary}
\setbeamercolor*{section in head/foot}{bg=white,fg=blue1}
\setbeamercolor*{subsection in head/foot}{fg=blue2,bg=white}

%% Test sur le type de Header
\newif\ifbooltree
\booltreefalse
\newif\ifbooldefault
\booldefaulttrue
\newif\ifboolsplit
\boolsplitfalse
\newif\ifboolminiframe
\boolminiframefalse

%% Options de la classe
\DeclareOption{tree}{\booltreetrue\booldefaultfalse}
\DeclareOption{split}{\boolsplittrue\booldefaultfalse}
\DeclareOption{default}{\booldefaulttrue}
\DeclareOption{miniframe}{\boolminiframetrue\booldefaultfalse}

\ProcessOptions

\newif\ifbeamer@theme@subsection

\DeclareOptionBeamer{subsection}[true]{\csname beamer@sb@subsection#1\endcsname}
\ExecuteOptionsBeamer{subsection=true}
\ProcessOptionsBeamer

\beamer@compresstrue

%% creation d un deuxieme block de base

\newenvironment{block2}[1]
{
\setbeamercolor{block title}{fg=white,bg=orange1}
\setbeamercolor{block body}{fg=black,bg=orange1!10}
\begin{block}{#1}
}
{
\end{block}
\setbeamercolor{block title}{fg=white,bg=blue1}
\setbeamercolor{block body}{fg=black,bg=blue1!1}
}


%%%%%%%%%%%%%%%%%%%% title page
  
\setbeamertemplate{title page}
{
\thispagestyle{empty}
\vbox{}

\ifbooltree\vspace{-3em}\fi
\ifbooldefault\vspace{-2em}\fi
\ifboolsplit\vspace{-5em}\fi
\ifboolminiframe\vspace{-3em}\fi

\vfill 
\begin{centering}
	\begin{beamercolorbox}[sep=8pt,center,rounded=true,shadow=true]{title}
		\usebeamerfont{title}\inserttitle\par%
		\ifx\insertsubtitle\@empty%
		\else%
        \vskip0.25em%
        {\usebeamerfont{subtitle} {\color{white}\textit{\insertsubtitle}}\par}%
      	\fi%     
    \end{beamercolorbox}%
    
    \begin{minipage}{0.05\linewidth}
	    $$\color{orange1}\left(
	    \begin{array}{c}
	    \vspace{0.5\paperheight}
	    \end{array}
	    \right.$$
    \end{minipage}\hfill
    \begin{minipage}{0.9\linewidth}
		\ifx\insertauthor\@empty\
		\else    	
    	\begin{beamercolorbox}[sep=8pt,center,rounded=true,shadow=true]{author}
      		\usebeamerfont{author}\insertauthor
   		\end{beamercolorbox}
   		\fi
   		\ifx\insertinstitute\@empty\
		\else   
   		\begin{beamercolorbox}[sep=8pt,center,rounded=true,shadow=true]{institute}
      		\usebeamerfont{institute}\insertinstitute
    	\end{beamercolorbox}
    	\fi
    	\ifx\insertdate\@empty\
    	\else
    	\begin{beamercolorbox}[sep=8pt,center,rounded=true,shadow=true]{date}
      		\usebeamerfont{date}\insertdate
    	\end{beamercolorbox}
    	\fi
    	\vskip0.5em
    	{\usebeamercolor[fg]{titlegraphic}\inserttitlegraphic\par}
		\vspace{-10mm}
%  		\begin{figure}
%  			\includegraphics[height = 0.1\textheight]{./logos/logo_ETIS}\hspace{1em} 
%  			\includegraphics[height = 0.1\textheight]{./logos/logo_ENSEA}\hspace{1em}
%  			\includegraphics[height = 0.1\textheight]{./logos/logo_UCP}\hspace{1em}
%  			\includegraphics[height = 0.1\textheight]{./logos/logo_CNRS}\hspace{1em}
%  			\insertlogo
%  		\end{figure} 
  	\end{minipage}\hfill 
  	\begin{minipage}{0.05\linewidth}
	    $$\color{orange1}\left.
	    \begin{array}{c}
	    \vspace{0.5\paperheight}
	    \end{array}
	    \right)$$
    \end{minipage}  
\end{centering}
\vfill
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%% frametitle

\setbeamertemplate{frametitle}{
	\vspace{-0.6em}
	\begin{minipage}{0.1\paperwidth}\end{minipage}\hfill        
    \begin{minipage}{0.8\paperwidth}
        \begin{beamercolorbox}[wd=\linewidth,center]{}%
        	\color{blue1}\textbf{\insertframetitle}
        \end{beamercolorbox}
    \end{minipage}\hfill
    \begin{minipage}{0.1\paperwidth}\end{minipage}
}
                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%% footline                
\defbeamertemplate*{footline}{mytheme theme}{
    \leavevmode%
	\begin{picture}(0,0)
	\put(0,-6){\fcolorbox{white}{white}{\phantom{\hspace{\paperwidth}}}}
	\put(0,-12){\fcolorbox{white}{white}{\phantom{\hspace{\paperwidth}}}}
	\put(0,0){\fcolorbox{white}{white}{\phantom{\hspace{\paperwidth}}}}
	\textcolor{orange1}{\put(0,1){\line(1, 0){400}}}
	\textcolor{white}{\put(348,-7){\circle*{38}}}
	\textcolor{orange1}{\put(346,-7){\circle{38}}}
	\end{picture}
	                
	\hbox{
	\begin{beamercolorbox}[wd = 0.36\paperwidth,ht=2.25ex,dp=1ex,center]{}%
		\textbf{\centering\textcolor{blue1}{\insertshorttitle}}
	\end{beamercolorbox}\textcolor{orange1}{|}
	\begin{beamercolorbox}[wd = 0.36\paperwidth,ht=2.25ex,dp=1ex,center]{}%
	    \textbf{\centering\textcolor{blue1}{\insertshortauthor}}
	\end{beamercolorbox}\textcolor{orange1}{|}
	\begin{beamercolorbox}[wd=0.12\paperwidth,ht=2.25ex,dp=1ex,right]{}%
	    \textbf{\centering\color{blue1}\insertshortdate}
	\end{beamercolorbox}%
	\begin{beamercolorbox}[wd=0.12\paperwidth,ht=2.25ex,dp=1ex,right]{}%
	    \textbf{\color{blue1}\insertframenumber\ / \inserttotalframenumber} \hspace{-1mm}
	\end{beamercolorbox}
	\hfill
	}  
} 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%% headline

\defbeamertemplate*{headline}{mytheme theme}{        

	%%%%% default
	
	\ifbooldefault         
	\vspace{-1em}
	\ifx\insertsection\@empty\
	\begin{table}% 
		\color{orange1}   
		\begin{tabular}{p{0.4\linewidth}p{0.4\linewidth}}
			\hfill\textcolor{blue1}{\insertsectionhead}&\textcolor{blue2}{\insertsubsectionhead}
		\end{tabular}
	\end{table}
	\else   
	\begin{table}% 
		\color{orange1}   
		\begin{tabular}{p{0.4\linewidth}|p{0.4\linewidth}}
			\hfill\textcolor{blue1}{\insertsectionhead}&\textcolor{blue2}{\insertsubsectionhead}
		\end{tabular}
	\end{table}
	\fi
	\fi
	
	%%%%% miniframe
	
	\ifboolminiframe
	\vspace{-1.9em}
	\begin{center}
		\textbf{ \insertnavigation{\headerwidth}}
	\end{center}
	\vspace{-0.5em}
	\fi
	
	%%%%% tree
	
	\ifbooltree 
	\begin{minipage}{0.1\linewidth}
	\end{minipage}\hfill
	\begin{minipage}{0.9\linewidth}
		\begin{beamercolorbox}[wd=\paperwidth,ht=2.5ex,dp=1.125ex,%
	    leftskip=.3cm,rightskip=.3cm plus1fil]{section in head/foot}
	    	\usebeamerfont{section in head/foot}%
	        \insertsectionnavigationhorizontal{\paperwidth}{}{}
	    \end{beamercolorbox}
	    \begin{beamercolorbox}[wd=\paperwidth,ht=2.5ex,dp=1.125ex,%
	      leftskip=.3cm,rightskip=.3cm plus1fil]{subsection in head/foot}
	    	\usebeamerfont{subsection in head/foot}%
	        \ifx\insertsection\@empty\
	        \insertsubsectionhead
	        \else
	        \ifx\insertsubsection\@empty\
	        \insertsubsectionhead
	        \else
	        {\color{orange1}$\vartriangleright\ $}\insertsubsectionhead
	        \fi
	        \fi
	    \end{beamercolorbox}              
	\end{minipage}
	\fi
	
	%%%%% split
	
	\ifboolsplit        
	  \leavevmode%
	  \@tempdimb=2.4375ex%
	  \ifnum\beamer@subsectionmax<\beamer@sectionmax%
	    \multiply\@tempdimb by\beamer@sectionmax%
	  \else%
	    \multiply\@tempdimb by\beamer@subsectionmax%
	  \fi%
	  \ifdim\@tempdimb>0pt%
	    \advance\@tempdimb by 1.125ex%
	    \begin{beamercolorbox}[wd=.5\paperwidth,ht=\@tempdimb]{section in head/foot}%
	      \vbox to\@tempdimb{\vfil\insertsectionnavigation{.5\paperwidth}\vfil}%
	    \end{beamercolorbox}%
	    \begin{beamercolorbox}[wd=.5\paperwidth,ht=\@tempdimb]{subsection in head/foot}%
	      \vbox to\@tempdimb{\vfil\insertsubsectionnavigation{.5\paperwidth}\vfil}%
	    \end{beamercolorbox}%
	  \fi%
	\fi
	
	%%%%% Logo + Filet
	
	\ifbooltree\vskip-2.5em\fi
	\ifboolsplit\vskip-2em\fi
	\ifbooldefault\vskip-4em\fi 
	\ifboolminiframe\vskip-3.5em\fi
	
	
%	{\setlength{\tabcolsep}{0pt}
%	\begin{tabular*}{\paperwidth}{cc}
%		\includegraphics[width=5mm]{./logos/logo_marcel}&    
%		{
%		\begin{minipage}{\columnwidth}
%			\hspace{-1em}
%			\HRule{orange1}{\columnwidth}{0.2mm}\vspace{2.1em} 						
%		\end{minipage}
%		}
%	\end{tabular*}
%	\begin{minipage}{\paperwidth}
%		\vspace{-1cm}\hspace{\logowidth}\usebox{\myLogo}
%	\end{minipage}
	\vspace{0.2mm}
	\hspace{0.5mm}\includegraphics[width=5mm]{./logos/logo_marcel}

%	\begin{tikzpicture}
%	\shade[left color=orange1!50,right color=black] (0.4,-0.14) rectangle +(10.6,0.01);
%	\node at (0,0) {\includegraphics[width=0.1\linewidth]{../../logos/logo_ETIS}};
%	\node at (11,0) {\usebox{\myLogo}};
%	\end{tikzpicture}
	\vspace{0.5mm}
	
	\HRule{orange1}{\textwidth}{0.2mm}\vspace{2.1em} 						
%	}
}
                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setbeamersize{text margin left=1em,text margin right=1em}    
\setbeamertemplate{enumerate item}[circle]

% Set the colors for bib entries
\setbeamertemplate{bibliography item}[book]
\setbeamercolor{bibliography entry author}{fg = blue1!50!black}
\setbeamercolor{bibliography entry title}{fg = blue1!50!black}
\setbeamercolor{bibliography entry journal}{fg = blue1!50!black}
\setbeamercolor{bibliography entry note}{fg = blue1!50!black}
\setbeamercolor{bibliography entry}{fg = blue1!50!black}
\setbeamercolor{bibliography entry article}{fg = blue1!50!black}
\setbeamercolor{bibliography entry book}{fg = blue1!50!black}
\setbeamercolor{bibliography entry location}{fg = blue1!50!black}


%
% Table of contents
%


\defbeamertemplate*{subsection in toc}{theme}
{{\color{orange1}$\vartriangleright\ $}\inserttocsubsection\par}

\mode<all>
