%%
%% Customizações do abnTeX2 (http://abnTeX2.googlecode.com) para o Instituto de Informática da UFRGS
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%%
%% The Current Maintainer of this work is Rafael Lerm, rafael.lerm@inf.ufrgs.br
%%
%% Further information about abnTeX2 are available on http://abntex2.googlecode.com/
%%

%==============================================================================
% Identificação
%==============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{infufrgs}[2014/04/07 v1.0 Modelo do Instituto de Informática da UFRGS baseado em abnTeX2]

%==============================================================================
% Declaração de opções.
%==============================================================================
\newcommand{\iiu@novodoc}[1]{\DeclareOption{#1}{\AtEndOfClass{\input{#1.def}}}}
\newcommand{\iiu@aliasdoc}[2]{\DeclareOption{#1}{\AtEndOfClass{\input{#2.def}}}}

% Programas.
\iiu@novodoc{cic}
\iiu@novodoc{ecp}
\iiu@novodoc{pgmicro}
\iiu@novodoc{ppgc}

% Tipos de documento.
\iiu@novodoc{dipl}
\iiu@aliasdoc{tc}{dipl}
\iiu@novodoc{ti}
\iiu@novodoc{rp}
\iiu@novodoc{pep}
\iiu@novodoc{prop-tese}
\iiu@novodoc{plano-doutorado}

% Documentos de Doutorado e Mestrado.
\iiu@novodoc{diss}
\iiu@novodoc{tese}
\iiu@aliasdoc{mestrado}{diss}
\iiu@aliasdoc{doutorado}{tese}
\iiu@novodoc{espec}
\iiu@novodoc{formais}

%==============================================================================
% Herança da classe abntex2 e inclusão de pacotes e arquivos necessários.
%==============================================================================

\PassOptionsToClass{%
	12pt,
	openright,
	a4paper,
	chapter=TITLE}
	{abntex2}
% Repassa todos os parametros para a classe abntex2.
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{abntex2}%
}
\ProcessOptions\relax
\LoadClass{abntex2}

\RequirePackage{babel}
\input{brazilian.babel}
\input{english.babel}

% O Instituto especifica o uso de fonte Times para o corpo do texto.
\RequirePackage{mathptmx}
% Fonte Helvetica (quase Arial) para títulos.
\RequirePackage{helvet}
\RequirePackage{courier}

% Necessário para ficha catalografica.
\RequirePackage{lastpage}

% Indenta o primeiro parágrafo de cada seção.
\RequirePackage{indentfirst}

\RequirePackage{iidefs}
\RequirePackage{etoolbox}

% Formato do cabeçalho de páginas.
\aliaspagestyle{abntheadings}{simple}

% O estilo da UFRGS não está de acordo com a ABNT neste ponto.
\addto\captionsbrazil{
	\renewcommand{\listfigurename}{Lista de Figuras}
}

% \RequirePackage[
% 	alf,
% 	abnt-url-package=hyperref,
% 	% Usar negrito para os títulos das referências,
% 	% como está no modelo da UFRGS
% 	abnt-emphasize=bf
% ]{abntex2cite}

\counterwithin{figure}{chapter}
\counterwithin{table}{chapter}

%==============================================================================
% Fontes para os titulos
%==============================================================================
\renewcommand{\ABNTEXpartfont}{\sffamily\fontseries{b}\selectfont}
\renewcommand{\ABNTEXchapterfont}{\sffamily\fontseries{b}\selectfont}
\renewcommand{\ABNTEXsectionfont}{\sffamily\fontseries{b}\selectfont}
\renewcommand{\ABNTEXsubsectionfont}{\sffamily\fontseries{b}\selectfont}
\renewcommand{\ABNTEXsubsubsectionfont}{\sffamily\fontshape{it}\selectfont}
\renewcommand{\ABNTEXsubsubsubsectionfont}{\sffamily\selectfont}

\renewcommand{\ABNTEXchapterfontsize}{\normalsize}
\renewcommand{\ABNTEXpartfontsize}{\normalsize}
\renewcommand{\ABNTEXsectionfontsize}{\normalsize}
\renewcommand{\ABNTEXsubsectionfontsize}{\normalsize}
\renewcommand{\ABNTEXsubsubsectionfontsize}{\normalsize}
\renewcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize}

\setlength\afterchapskip{\baselineskip}

%==============================================================================
% Folha de rosto (o modelo da biblioteca não tem capa).
%==============================================================================
\newlength{\titlepagewinwidth}\setlength{\titlepagewinwidth}{95mm}
\newlength{\titlepagewinheight}\setlength{\titlepagewinheight}{62mm}
\newlength{\titlepagewinvoffset}\setlength{\titlepagewinvoffset}{112mm}
\renewcommand{\folhaderostocontent}{%
	\begin{SingleSpace}
	\begin{center}
		\thetitlepage
	\end{center}
	\end{SingleSpace}
}
\newcommand{\thetitlepage}{%
	\noindent\@topbox\\
	\vfill
	\hspace*{\fill}\makebox[.5\textwidth][l]{%
		\parbox[b]{8.5cm}{\titlepagespecificinfo}%
	}
	\vfill
	\hspace*{\fill}\parbox[b]{.5\textwidth}{%
		{\titlepageadvisorinfo}
	}
	\vspace{\stretch{4}}
	\vfill
	\centerline{\imprimirlocal}
	\centerline{\imprimirdata}
}
\def\@topbox{%
   \parbox[t]{\textwidth}{%
	   \centering%
	   \vbox to \titlepagewinvoffset{%
		   \titlepagetopinfo\vfill\@winbox
	   }
   }
}
\def\@winbox{%
   \parbox[b]{\titlepagewinwidth}{%
   \centering\vbox to \titlepagewinheight{%
	   \vspace*{\fill}
	   \MakeUppercase{\imprimirautor}\\
	   \vspace{\stretch{1}}
	   {\large\textbf{\imprimirtitulo}\par}
	   \vfill
   }}%
}
\newcommand{\course}[1]{\gdef\@course{#1}}
\course{\ppgc}
\newcommand{\titlepagetopinfo}{%
   \MakeUppercase{\ufrgs}\\
   \MakeUppercase{\ii}\\
   \MakeUppercase{\@course}\\
}
\newcommand{\titlepageadvisorinfo}{%
	{\vfill\imprimirorientadorRotulo\  \imprimirorientador}
	{\\ \imprimircoorientadorRotulo\  \imprimircoorientador}
}

%==============================================================================
% Redefinindo o tratamento dos nomes para separar nome e sobrenome.
%==============================================================================
\newcounter{ii@authorcount}
\let\ii@abntexautor\autor
\renewcommand{\autor}[2]{
	\newcommand{\ii@authorfirst}{#1}
	\newcommand{\ii@authorlast}{#2}
	\ii@abntexautor{#1 #2}
}
\let\ii@abntexorientador\orientador
\renewcommand{\orientador}[3]{
	\newcommand{\ii@orientadorfirst}{#2}
	\newcommand{\ii@orientadorlast}{#3}
	\ii@abntexorientador{#1 #2 #3}
}
\let\ii@abntexcoorientador\coorientador

\renewcommand{\coorientador}[3]{
    \newcommand{\ii@coorientadorfirst}{#2}
    \newcommand{\ii@coorientadorlast}{#3}
    \ii@abntexcoorientador{#1 #2 #3}
}
% Redefinindo o local
\let\ii@abntexlocal\local
\renewcommand{\local}[2]{
	\newcommand{\@city}{#1}
	\newcommand{\@state}{#2}
	\ii@abntexlocal{#1}
}
\local{Porto~Alegre}{RS}

%==============================================================================
% Definição das palavras-chave (máx. 10)
%==============================================================================
\newcounter{kwcounter}
\newcommand{\keyword}[1]{
        \addtocounter{kwcounter}{1}
        \expandafter\gdef\csname keyw\alph{kwcounter}\endcsname{#1}
}
\newcommand{\@cipkw}{%
        \@ifundefined{keywa}{}{1.~\expandafter\MakeUppercase\keywa\@. }%
        \@ifundefined{keywb}{}{2.~\expandafter\MakeUppercase\keywb\@. }%
        \@ifundefined{keywc}{}{3.~\expandafter\MakeUppercase\keywc\@. }%
        \@ifundefined{keywd}{}{4.~\expandafter\MakeUppercase\keywd\@. }%
        \@ifundefined{keywe}{}{5.~\expandafter\MakeUppercase\keywe\@. }%
        \@ifundefined{keywf}{}{6.~\expandafter\MakeUppercase\keywf\@. }%
        \@ifundefined{keywg}{}{7.~\expandafter\MakeUppercase\keywg\@. }%
        \@ifundefined{keywh}{}{8.~\expandafter\MakeUppercase\keywh\@. }%
        \@ifundefined{keywi}{}{9.~\expandafter\MakeUppercase\keywi\@. }%
        \@ifundefined{keywj}{}{10.~\expandafter\MakeUppercase\keywj\@. }%
}
\newcommand{\@abstractkw}{%
        \@ifundefined{keywa}{}{\expandafter\MakeUppercase\keywa.}%
        \@ifundefined{keywb}{}{ \keywb.}%
        \@ifundefined{keywc}{}{ \keywc.}%
        \@ifundefined{keywd}{}{ \keywd.}%
        \@ifundefined{keywe}{}{ \keywe.}%
        \@ifundefined{keywf}{}{ \keywf.}%
        \@ifundefined{keywg}{}{ \keywg.}%
        \@ifundefined{keywh}{}{ \keywh.}%
        \@ifundefined{keywi}{}{ \keywi.}%
        \@ifundefined{keywj}{}{ \keywj.}%
}

%==============================================================================
% Catalogação na fonte (CIP) e nominata
%==============================================================================
\newcommand{\imprimircip}{%
		% \clearpage%
	\begin{fichacatalografica}
		\begin{center}
				\textbf{\cipcaption}\\[2ex]
				\iiu@cipwindow
		\end{center}
		\vfill
		\nominata
	\end{fichacatalografica}
}
% definição do quadro
\def\iiu@cipwindow{%
		\framebox[120mm]{%
		\begin{minipage}{110mm}%
				\vspace*{0.2ex}
				\setlength{\parindent}{1.5em}%
				\setlength{\parskip}{1.3ex}%
				\noindent\ii@authorlast, \ii@authorfirst\newline\indent
				\imprimirtitulo\ / \imprimirautor.\ -- \imprimirdata.\newline\indent
				\pageref{LastPage}~f.\par

				\imprimirorientadorRotulo~\imprimirorientador\newline\indent
				\imprimircoorientadorRotulo~\imprimircoorientador \par
				\@cipspecificinfo\ -- \ufrgs, \ii, \@course, \@city, BR--\@state, \imprimirdata.\par

				\@cipkw
				I.~\ii@orientadorlast, \ii@orientadorfirst, orient.
				\ifdefempty{\imprimircoorientador}{
					II.~T\'{\i}tulo.
				}{
					II.~\ii@coorientadorlast, \ii@coorientadorfirst, coorient. III.~T\'{\i}tulo.
				}\\
				\vspace{0.2ex}
		\end{minipage}%
		}%
}

\AtEndOfClass{\input{nominata.def}}
\newcommand{\nominata}{
\normalsize
	\begin{SingleSpace}
		\MakeUppercase{\ufrgs}\\
		\nominataReitname: \nominataReit\\
		\nominataPRCAname: \nominataPRCA\\
		% \nominataViceReitname: \nominataViceReit\\
		\nominataPRAPGname: \nominataPRAPG\\
		\nominataDirname: \nominataDir\\
		\nominataCoordname: \nominataCoord\\
		\nominataBibchefename: \nominataBibchefe
	\end{SingleSpace}
}

%==============================================================================
% Resumos
%==============================================================================

\let\ii@oldendresumo\endresumo
\renewcommand{\endresumo}{
	\setlength{\parskip}{3ex}
	\par\noindent\textbf{\keywordsname:} \@abstractkw
	\ii@oldendresumo
}

\newenvironment{resumoestrangeiro}[3] {
	\begin{otherlanguage}{#1}
	\centering\textbf{#2}
	\gdef\@foreignkeywords{#3}%
    \par

	\PRIVATEbookmarkthis{\abstractname}
	\renewcommand{\abstractnamefont}{\chaptitlefont}
	\let\nome\abstractname
	\renewcommand{\abstractname}{\ABNTEXchapterupperifneeded{\nome}}
	\begin{abstract}
}{
	\vspace{3ex}
	\par\noindent\textbf{\keywordsname:} \@foreignkeywords
	\end{abstract}
	\end{otherlanguage}
	\cleardoublepage
}
