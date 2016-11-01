% This document class provides a simple memo for LaTeX users.
% It is based on article.cls and inherits most of the functionality
% that class.
% 
% Author: Rob Oakes, Copyright 2010.  Released under the LGPL, version 3.
% A copy of the LGPL can be found at http://www.gnu.org/licenses/lgpl.html

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{texMemo}[2010/07/31 - Simple Memo Class, Including Logo]
\RequirePackage{palatino}

% Load the Base Class
\LoadClassWithOptions{article}

% Begin Requirements
\RequirePackage{ifthen}

% Specialized memo Commands (To, From, Subject, Logo, Letterhead Address)

\def\@memoto{\relax}
\newcommand{\memoto}[1]{\gdef\@memoto{#1}}

\def\@memofrom{\relax}
\newcommand{\memofrom}[1]{\gdef\@memofrom{#1}}

\def\@memosubject{\relax}
\newcommand{\memosubject}[1]{\gdef\@memosubject{#1}}

\def\@memoregarding{\relax}
\newcommand{\memoregarding}[1]{\gdef\@memoregarding{#1}}

\def\@memodate{\relax}
\newcommand{\memodate}[1]{\gdef\@memodate{#1}}

\def\@memoauthor{\relax}
\newcommand{\memoauthor}[1]{\gdef\@memoauthor{#1}}

\def\@memoauthortitle{\relax}
\newcommand{\memoauthortitle}[1]{\gdef\@memoauthortitle{#1}}

\def\@memoauthordept{\relax}
\newcommand{\memoauthordept}[1]{\gdef\@memoauthordept{#1}}

\def\@memoauthoruniv{\relax}
\newcommand{\memoauthoruniv}[1]{\gdef\@memoauthoruniv{#1}}

\def\@memologo{\relax}
\newcommand{\logo}[1]{\gdef\@memologo{\protect #1}}

\def\@letterheadaddress{\relax}
\newcommand{\lhaddress}[1]{\gdef\@letterheadaddress{#1}}

% Custom Document Formatting
\newcommand\decorativeline[1][1pt]{
	\par\noindent%
	\rule[0.5ex]{\linewidth}{#1}\par
}

% Set the Paper Size and margins
\RequirePackage{geometry}
\geometry{margin=1.0in}

% Create the Letterhead and To/From Block

\renewcommand{\maketitle}{\makememotitle}
\newcommand\makememotitle{
	\ifthenelse{\equal{\@memologo}{\relax}}{}
	{ % Create With Logo
	\begin{minipage}[t]{1\columnwidth}%
		\begin{flushright}
			\vspace{-0.6in}
			\@memologo
		\par\end{flushright}%
	\end{minipage}
	}
	
	% To, From, Subject Block
% 	\begin{description}
		\ifthenelse{\equal{\@memoto}{\relax}}{}{[{To:}] \@memoto}
		\ifthenelse{\equal{\@memofrom}{\relax}}{}{[{From:}] \@memofrom}
		\ifthenelse{\equal{\@memosubject}{\relax}}{}{[{Subject:}] \@memosubject \\}
        \ifthenelse{\equal{\@memoauthor}{\relax}}{}{\noindent \@memoauthor \\ }
        \ifthenelse{\equal{\@memoauthortitle}{\relax}}{}{\noindent \@memoauthortitle \\}
		\ifthenelse{\equal{\@memoauthordept}{\relax}}{}{\noindent \@memoauthordept \\}
		\ifthenelse{\equal{\@memoauthoruniv}{\relax}}{}{\noindent \@memoauthoruniv \\\\}
		\ifthenelse{\equal{\@memoregarding}{\relax}}{}{\textbf{Re:} \@memoregarding \\}
        \ifthenelse{\equal{\@memodate}{\relax}}{}{\textbf{Date:} \@memodate \\}
% 	\end{description}
	\decorativeline\bigskip{}
}