---
title: "Lyx Commands"
output: 
  html_document: 
    toc: yes
---


The Lyx "What You See is What You Mean" editor is available at Lyx and from your package manager.
Citations

Lyx nicely integrates with a bibtex bibliography. You can create a shortcut such as CTRL+SHIFT+C to insert a reference. A small menu will pop-up to choose from the references.


Unfortunately  "BibTeX does not support files encoded in UTF-8". To get characters such as "é" encoded correctly latin1 has to be used.This can be set as the database property in Jabref.
Shortcuts

Under Tools / preferences / Editing / Shortcuts /  Stackoverflow question on how to find the command name for a shortcut. I mapped:

    citation-insert to Ctrl+Alt+C 
    href-insert to Ctrl+K
    label-insert to Ctrl+Alt+L
    statistics to Ctrl+Alt+T

See also the Lyx wiki page on shortcuts.
Merge and filter bibliographies 

Answers to a question on merging 2 bibtex file recommend using Jabref file / import into current database.


Create a shorter bibliography with only cited documents from another bibliography Extracting only the BibTex records relevant to the paper. Answers recommend using bibtool or bibexport.


I have written an article in Lyx which cites 2 bibliographies and a colleague asked to have a .tex version of this article. Here is my recipe:

    Use Jabref to merge two bibliographies. 
    Export Lyx file to LaTeX (PDFLaTeX).
    Edit the .tex file to insert a link to the merged bibliographies. 
        \phantomsection\addcontentsline{toc}{section}{\refname}\bibliography{long.bib} 
    Compile the .tex with TeXstudio. 
    Used bibexport to extract a short bibliography corresponding only to the citations used in one article.

    bibexport -o short.bib article.aux 

    Replace long.bib by short.bib in the .tex file.

I have done it 3 times already. Could I create a script that does all this automatically?
Spell checker

A spell checker can be activated under Tools / preferences / language settings / spellchecker. On my system the only spell check engine available is Enchant, "a wrapper that provides automatic access to many spell checking libraries (ispell, aspell, hspell, hunspell, etc.)".


The button displaying a red-underlined A can be activated to spell check continuously.
Language of document

Under Document / Settings / Language, it's possible to change the document language, which will have an impact on the language used for spell checking. In my system compiling a document in French returned an error:

"Package babel Error: Unknown option `french'."

This stackexchange post suggest installing the texlive-lang-french Debian package. This fixed the error.
Math mode

Press CTRL+M at the cursor or on highlighted text to enter math mode. Latex syntax "\beta", "x_t" can be used to enter equations and is displayed directly as math symbols.
Change input encoding

This question on "how do I prevent  Lyx from loading inputenc?" explains where this part of the Latex preamble is defined.

In Document &gt; Settings..., under Language &gt; Encoding, choose "Other" and select "Language Default (no inputenc)".


Instead I replaced Latin1 by utf8 as input encoding. This works for the moment.
Encoding issues and Greek symbols used outside math mode

"Encoding file 'lgrenc.def' not found"  was fixed by installing the debian package texlive-lang-greek (as explained here on stackoverflow). Other errors appeared related to the use of beta signs outside math mode. As one user explained on stackoverflow, placing \beta signs in math mode usually fixes the issue.
Hyperlinks in PDF

How to change hyperlink colors in Lyx

    Document &gt; Settings &gt; PDF Properties under the Additional options field. For example, a custom set of instructions may be the following: linkcolor=black, urlcolor=blue, citecolor=green, pdfstartview={FitH}, hyperfootnotes=false, unicode=true  

I changed marineblue to blue, as my system complained that marineblue was not available.


The lyx function that creates hyperlinks is called href-insert. You can create a CTRL+K shortcut that inserts hyperlink under Tools / preferences / Editing / Shortcuts / "Cursor, Mouse and Editing functions" by inserting the function name: href-insert.
Presentation template, called beamer

The beamer theme and color theme can be changed by inserting this in Document / Seetings / Latex preamble:

    \usetheme{Boadilla}

    \usecolortheme{orchid}

An overview of themes is available in the beamer theme matrix.

Here is an explanation on how to change to any other RGB colour. Beware the definition of RGB colours are unusual in Latex, divide values by 255.

    \definecolor{darkgreen}{rgb}{.2,.4,.2}

    \usecolortheme[named=darkgreen]{structure}


Slide numbering can be added to the beamer template. By inserting this code block in Document / Settings / latex preamble:

    \addtobeamertemplate{navigation symbols}{}{%
        \usebeamerfont{footline}%
        \usebeamercolor[fg]{footline}%
        \hspace{1em}%
        \insertframenumber/\inserttotalframenumber
    }

Tables too wide for a slide can be resized by placing the table between the following ERT. If there is a table float, this instruction has to be placed inside the table float.

    \resizebox{\linewidth}{!}{%

    } 

 Elsevier article template

Elsevier provides a latex template for articles called elsarticle which is usable in Lyx. However compiling with this template doesn't seem to work when using the hyperref package with the general option "automatically fill header". After deactivating this option, compilation works again.


The elsarticle template uses numerical references by default. it is possible to activate author year reference according to this stack exchange answer.
 Tips

    CTRL+D uses yap, a faster (on windows) previewer than the default PDF one. There is no noticeable difference on Linux.


To produce a meeting report with a wider template than the default article.

    I would have liked to find an overview of the templates with screenshots of PDF results. But I couldn't find such overview online. LyX wiki has a list of examples and a list of layouts. 
    In fact all that was needed was to edit the Document \ Settings \ Page margins, I set the inner and out margins to 2 cm and was happy with the result.

knitr and Lyx

    Yihui Xie: Using knitr and Lyx
     Krishna Devulapalli: Creation of research papers with embedded R results using LyX

Export to Microsoft Word compatible format RTF

Under File / Export / Rich Text Format, it's possible to export Lyx files to a format compatible with Microsoft Word.

My Lyx file uses many packages and formatting options. Export to RTF didn't work and returned the error:

    "An error occurred while running: latex2rtf" 

I made a copy in a temporary directory (/tmp) and removed external packages and options in the latex preamble, before performing the conversion. Then the conversion to RTF worked.


Compare different versions of a document

Use Tools/Compare to highlight differences between a new and an old document. Then show changes in output to show changes in red and blue in the PDF output.

Alternatively, you can export the Lyx files to Latex and use Latexdiff as such:

    latexdiff draft.tex revision.tex > diff.tex

Avoid complex tables or figures in the diff, as they can cause issues. I had to create a fake old documents with final figures and table for latexdiff to return a usable output.
