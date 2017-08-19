

start
	= file

file
	= START_BLOCK header:header document:document END_BLOCK { return { header: header, document: document }; }

header
	= version:RTF charset:charset utf:utf? ctrlseq:ctrlseq* deff:DEFF? fonttbl:fonttbl
		filetbl:filetbl? colortbl:colortbl? stylesheet:stylesheet? listtables:listtables?
		revtbl:revtbl? { return {
		charset: charset, fonttbl: fonttbl, filetbl: filetbl, colortbl: colortbl,
		stylesheet: stylesheet, listtables: listtables, revtbl: revtbl, utf: utf,
		ctrlseq: ctrlseq, version: version
	}; }

charset
	= '\\ansi'
	/ '\\mac'
	/ '\\pc'
	/ '\\pca'

utf
	= '\\ansicpg' page:[0-9]+ { return { codepage: page.join('') }; }

fonttbl
	= block

filetbl
	= block

colortbl
	= block

stylesheet
	= block

fonttbl
	= block

listtables
	= block

revtbl
	= block

document
	= content*

content
	= ctrlseq:ctrlseq+ { return ctrlseq; }
	/ block
	/ text

block
	= START_BLOCK ctrlseq:ctrlseq* contents:content* END_BLOCK '\n'? { return { sequences: ctrlseq, contents: contents }; }

ctrlseq
	= '\\' seqname:[a-zA-Z0-9]* '\n'* { return seqname.join(''); }

text
	= str:[^{}\\]+ nl:"\\\n"* { return str.join(''); }

START_BLOCK
	= '{'

END_BLOCK
	= '}'

RTF
	= '\\rtf' rtfver:[0-9]+ '\n'* { return rtfver; }

DEFF
	= '\\deff' '\n'*