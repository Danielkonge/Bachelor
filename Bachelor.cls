\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{./Bachelor}[2017]

% \RequirePackage{ifthen}
% \RequirePackage{calc}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}} %Kalder ekstra ting, der gives som input, via memoir

\ProcessOptions\relax

\LoadClass[
	a4paper,	%papirstørrelse;
	twoside,        %til printing på en side af papiret - twoside til dobbeltsidet
        %onecolumn,
	%article, 	%god til afleveringer; kan fjernes i større ogpaver.
	%danish,english	%det sidst hentede sprog bliver hovedsproget i dokumentet,
	11pt, %skriftstørrelsen
	]{memoir}	%den absolut bedste dokumentklasse; bør altid anvendes.
				%Ændr det ikke uden en MEGET god grund.

% Opsætning af sprog, karakterkodning m.m.:

\usepackage[utf8]{inputenc} %så vi anvender Unicode
\usepackage[T1]{fontenc} %europæiske skrifttyper

\usepackage[autostyle,german=guillemets,english=british]{csquotes}
	%for konsistent brug af citater via kommandoen \enquote{...}
	%Vi definerer den sædvanlige citationsform:
\DeclareQuoteStyle[myquotesstyle]{danish}
{\textquotedblleft}{\textquotedblright} %primaere citater: “...”;
	%kan erstattes med {\guillemotright}{\guillemotleft}, hvis der
	%i stedet ønskes »...«
{\textquoteleft}{\textquoteright} %sekundære citater: ‘...’

\ExecuteQuoteOptions{danish=myquotesstyle}%vælger den netop
					  %definerede citatstil.

\usepackage[danish,english]{babel} 	%forskellige kommandoer og indstillinger,
					%som gør det nemmere at skrive LaTeX-
					%dokumenter på andre sprog end engelsk,
					%f.eks. dansk
                                        %Hvis man skriver primært på engelsk, så skal english stå sidst

%Pakker, der bør hentes:
\usepackage{%
	amsmath,amssymb,%til bedre håndtering af matematik
	graphicx,       %mulighed for importering af grafik
	mathtools, 	%en udvidelse af amsmath med smarte
				%kommandoer; anvendes til \abs, \norm,
				%\inner osv. herunder
	etoolbox,	%forskellige programmeringskommandoer,
				%som kan være nyttige; anvendes i vores
				%definition af \abs,\norm,\inner osv.
				%Den hentes faktisk også af csquotes.
	microtype, 	%små mikrotypografiske effekter
	bm,			%mulighed for at lave "kunstige" fede
				%versioner af matematiksymbler, som ikke
				%har fede versianter i den pågældende skrifttype
	%siunitx, 	%til formatering af enheder og tal
	todonotes, 	%giver kommandoen \todo{...}, hvor man kan skrive
				%noter til sig selv; kan evt. erstattes med fixme
	}
\usepackage[shortlabels]{enumitem}%til at styre formatet til lister


\preto\appendix{%
  \cleardoublepage
  \renewcommand{\thepage}{\thechapter.\arabic{page}}%
  \preto\chapter{\cleardoublepage\setcounter{page}{1}}%
}

%BibLaTeX, et smart og topmoderne referenceværktøj til LaTeX.
%Bemærk dog, at BibLaTeX bruger "Biber" som sorteringsværktøj,
%mens de fleste editorer som standard er sat op til at bruge
%det forældede BibTeX, som ikke understøtter Unicode og andet
%(bemærk, at det stadigvæk omtales i daleifs bog; dette vil
%blive ændret snarest). Det kan oftest lade sig gøre at ændre
%indstililngerne i editoren, så Biber bruges som standard.
\usepackage[citestyle=alphabetic,bibstyle=alphabetic,
uniquename=init,autolang=hyphen,backend=biber,sortcites,
sorting=ynt]{biblatex}
\addbibresource{ref.bib} %filen, hvor referencerne ligger

%En pakke til håndtering af sætningskonstruktioner:
\usepackage[thmmarks,amsmath]{ntheorem}

%En pakke til referencer; giver mulighed
%for at skrive "kapitel 5 på s. 32" via \vref-kommandoen.
\usepackage{varioref}

%En pakke til at indsætte links ved referencer:
\usepackage[hidelinks,pdfpagelabels]{hyperref}


%====================================================================
%|		CLEVEREF - dynamiske krydsreferencer	            |
%====================================================================
% I det følgende hentes pakken cleveref, som er et dynamisk værktøj
% til krydsreferencer i dokumenter. Hvis man skriver "\cref{label}",
% skriver cleveref ikke alene nummeret på det pågældende label, men
% også hvilken type label det er. Hvis det er en sætning, skriver
% den f.eks. "Sætning <nummer>", hvis det er en figur, skriver den
% "figur <nummer>" osv. Bemærk dog, at man skal passe en smule på med
% cleveref, da pakken ændrer i nogle helt grundlæggende opsætninger
% i LaTeX via nogle ikke altid helt pæne "hacks"; disse "hacks" kan
% til tider give problemer i forhold til visse andre pakker. De
% pakker, der anvendes i denne preamble, kører generelt fint med
% cleveref, men hvis du begynder at ændre i noget, kan der opstå
% problemer. I så fald anbefaler jeg, at man fjerner cleveref
% fra sin preamble. Jeg bruger selv cleveref meget, mens daleif
% eksempelvis ikke kan lide den.

\usepackage[nameinlink]{cleveref}
%laver kommandoen \cref, som selv skriver "figur", "sætning"
%osv. foran en reference.

\crefalias{theorembreak}{theorem}
\crefalias{definitionbreak}{definition}
\crefalias{examplebreak}{example}
\crefalias{corollarybreak}{corollary}
\crefalias{propositionbreak}{proposition}
\crefalias{lemmabreak}{lemma}
\crefalias{remarkbreak}{remark}

%Og her slutter så hentningen og opsætningen af cleveref
%====================================================================
%|		Her slutter hentningen og opsætningen af CLEVEREF   |
%====================================================================


%Nu definerer vi en række miljøer, som kan anvendes til at skrive
%sætninger, korollarer, eksempler osv. på samme måde, som det er
%kendt fra lærebøgerne. F.eks. kan man skrive
%\begin{theorem}...\end{theorem} for at skrive en sætning. Dette
%vil blive anvendeligt til bachelorprojekt og speciale.
%Vi anvender pakken ntheorem, som vi
%hentede tidligere i preamblen.

\theoremseparator{.}

\theoremstyle{plain}
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{definition}[theorem]{Definition}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{lemma}[theorem]{Lemma}

\theorembodyfont{\normalfont}
\theoremsymbol{\ensuremath{\triangle}}
\newtheorem{remark}[theorem]{Remark}

\theoremsymbol{\ensuremath{\scriptstyle\bigcirc}}
\newtheorem{example}[theorem]{Example}


\theoremstyle{nonumberplain}
\theoremsymbol{\ensuremath{\square}}
\theoremheaderfont{\itshape}
\newtheorem{proof}{Proof}

\theoremstyle{empty}
\newtheorem{proofof}{Proof}

% Vi definerer også "break"-versioner af alle miljøerne, som indsætter
% et linjeskift mellem overskrifterne og indholdet i miljøet.
% Dette kan en gang imellem være nyttigt.

\theoremsymbol{}
\theoremheaderfont{\normalfont\bfseries}
\theorembodyfont{\itshape}
\theoremstyle{break}
\newtheorem{theorembreak}[theorem]{Theorem}
\newtheorem{definitionbreak}[theorem]{Definition}
\newtheorem{corollarybreak}[theorem]{Corollary}
\newtheorem{propositionbreak}[theorem]{Proposition}
\newtheorem{lemmabreak}[theorem]{Lemma}

\theorembodyfont{\normalfont}
\theoremsymbol{\ensuremath{\triangle}}
\newtheorem{remarkbreak}[theorem]{Remark}

\theoremsymbol{\ensuremath{\scriptstyle\bigcirc}}
\newtheorem{examplebreak}[theorem]{Example}

\theoremstyle{nonumberbreak}
\theoremsymbol{\ensuremath{\square}}
\theoremheaderfont{\itshape}
\newtheorem{proofbreak}{Proof}

\theoremstyle{emptybreak}
\newtheorem{proofofbreak}{Proof}      


% TIKZ
\usepackage{tikz}
\usetikzlibrary{calc,shapes.geometric,decorations.markings,decorations.pathmorphing,arrows,cd,quotes,babel}

    
%Kommandoer, der skriver de grundlæggende talmængder:

\newcommand\N{\mathbf{N}}
\newcommand\Z{\mathbf{Z}}
\newcommand\Q{\mathbf{Q}}
\newcommand\R{\mathbf{R}}
\newcommand\C{\mathbf{C}}
\newcommand\F{\mathbf{F}}



%\usepackage[mathscr]{euscript} %special characters, f.eks. til standardmatrixrepresentationen
%\usepackage{mathrsfs}
\usepackage[scr=boondoxo]{mathalfa}


%Definition af nogle standardkommandoer.

%Først definerer vi \abs{x}, \norm{x} og \inner{u}{v},
%som styrer absolutværdier, normer og indre produkter.
%De understøtter også skalering via \abs[\big]{x},
%\abs[\Big]{x}, \abs[\bigg]{x}, \abs{\Bigg]{x} osv.
%Man kan også skrive \abs*{x}, som svarer til
%\left...\right; men man bør generelt
%undgå \left...\right.
%\abs{x} til absolutværdier:
\DeclarePairedDelimiterX\abs[1]\lvert\rvert{
	\ifblank{#1}{\:\cdot\:}{#1}
}
%\norm{x} til normer:
\DeclarePairedDelimiterX\norm[1]\lVert\rVert{ %normer
	\ifblank{#1}{\:\cdot\:}{#1}
}
%\inner{u}{v} til indre produkter:
\DeclarePairedDelimiterX{\inner}[2]{\langle}{\rangle}{ %indre produkter
	\ifblank{#1}{\:\cdot\:}{#1},\ifblank{#2}{\:\cdot\:}{#2}
}


%Nu definerer vi \Set, som kan give konsistent notation af mængder via
%syntaksen \Set{x\in X \given x > 0}. Igen kan man skalere ved at skrive
%\Set[\big], \Set[\Big], \Set* osv. Den lodrette streg vil automatisk
%blive skaleret sammen med resten. Man behøver dog ikke have den lodrette
%streg med i \Set, så man kan også skrive f.eks.
%$\N = \Set{0,1,2,3,\ldots}$.
\newcommand\SetSymbol[1][]{
	\nonscript\:
	#1\vert
	\allowbreak
	\nonscript\:
	\mathopen{}
}
\providecommand\given{}
\DeclarePairedDelimiterX\Set[1]{\lbrace}{\rbrace}{
	\renewcommand\given{\SetSymbol[\delimsize]}
	#1
}

% Nu kommandoer til intervaller:
% \open{a}{b} til åbne intervaller (a,b),
% \closed{a}{b} til lukkede intervaller, [a,b],
% \lopen{a}{b} og \ropen{a}{b} til halvåbne, (a,b] hhv. [a,b)

\DeclarePairedDelimiterX\open[2]
	() %kan ændres til ][, hvis man foretrækker notationen ]a,b[
	{#1,#2}
\DeclarePairedDelimiterX\lopen[2]
	(] %kan ændres til ]], hvis man foretrækker notationen ]a,b]
	{#1,#2}
\DeclarePairedDelimiterX\ropen[2]
	[) %kan ændres til [[, hvis man foretrækker notationen [a,b[
	{#1,#2}
\DeclarePairedDelimiterX\closed[2]
	[] %denne notation er universel standard.
	{#1,#2}

%Vi definerer kommandoen \Span, som skriver span
\DeclareMathOperator\Span{span}

%Vi definerer kommandoen \Mat, som skriver Mat
%Til brug for f.eks. matricer, \Mat_{m,n}(\F)
\newcommand\Mat{\textup{Mat}}


%Notation til < ting > med langle og rangle
\DeclarePairedDelimiterX\lrangle[1]\langle\rangle{
	\ifblank{#1}{\:\cdot\:}{#1}
}

\DeclareMathOperator{\Ker}{Ker} %kernen
\DeclareMathOperator*{\supp}{supp} %supporten
\DeclareMathOperator{\id}{id} %identitetsafbilding
\DeclareMathOperator{\ord}{ord} %ordenen af en gruppe
\DeclareMathOperator{\GL}{GL}
\DeclareMathOperator{\SL}{SL}
\DeclareMathOperator{\ad}{ad} %adjoint representation
\DeclareMathOperator{\Char}{char}
\DeclareMathOperator{\diag}{diag}
\DeclareMathOperator{\tr}{tr}
\DeclareMathOperator{\ch}{ch}

\newcommand\dd[2]{d_{#1}^{\,#2}}

\newcommand\M{\mathscr{M}} %Standardmatrixrepresentation

\newcommand{\Lie}[1]{\mathfrak{#1}}

\DeclareMathOperator{\End}{End}
\DeclareMathOperator{\Der}{Der}

\renewcommand\Re{\operatorname{Re}} %Reel del af komplekst tal
\renewcommand\Im{\operatorname{Im}} %Imaginær del af komplekst tal}

\newcommand\slpr{\Lie{sl}(2,\C)\times \Lie{sl}(2,\C)}
\newcommand\slc{\Lie{sl}(2,\C)}

%Vi har følgende særlige kommandoer:
%\Span, \Mat, \open, \lopen, \ropen, \closed, \Set (\given i \Set), \abs, \norm, \inner, \lrangle, \Lie, 

%Hvis man kan, så kan det være en god idé, at tilføje \enquote som en kommando i ens editor
%I emacs tilføj følgende til .emacs filen:
% ;; " expands into csquotes macros (for this to work babel must be loaded after csquotes).
% (setq LaTeX-csquotes-close-quote "}"
%       LaTeX-csquotes-open-quote "\\enquote{")


\endinput