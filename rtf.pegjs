{

const File = require('./ast/File');
const Header = require('./ast/Header');
const Document = require('./ast/Document');
const Section = require('./ast/Section');
const Block = require('./ast/Block');

}

start
	= file

file
	= START_BLOCK header:header document:document END_BLOCK { return new File(header, document); }

header
	= version:RTF charset:charset utf:utf? ctrlseq:ctrlseq* deff:DEFF? fonttbl:fonttbl
		filetbl:filetbl? colortbl:colortbl? stylesheet:stylesheet? listtables:listtables?
		revtbl:revtbl? { return new Header(version, charset, fonttbl, filetbl, colortbl,
			stylesheet, listtables, revtbl, utf, ctrlseq);
		}

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
	= info:info? docfmt:docfmt* sections:sections { return new Document(info, docfmt, sections); }

info
	= block

docfmt
	= ctrlseq

sections
	= secfmt* hdrftr? content:para+ nextsection:('\\sect' sections)? {
		nextsection = nextsection || [];
		nextsection.unshift(new Section(content));
		return nextsection;
	}

secfmt
	= ctrlseq

hdrftr
	= block*

para
	= content

content
	= ctrlseq:ctrlseq+ { return ctrlseq; }
	/ block
	/ text

block
	= START_BLOCK ctrlseq:ctrlseq* contents:content* END_BLOCK '\n'? { return new Block(ctrlseq, contents); }

ctrlseq
	= '\\' seqname:[a-zA-Z0-9]* '\n'* { return seqname.join(''); }
	/ '\\*' dest:ctrlseq { return { destination: dest }; }

text
	= str:[^{}\\]+ nl:"\\\n"* { return str.join('') + nl.map(x => '\n').join(''); }

START_BLOCK
	= '{'

END_BLOCK
	= '}'

RTF
	= '\\rtf' rtfver:[0-9]+ '\n'* { return rtfver.join(''); }

DEFF
	= '\\deff' '\n'*