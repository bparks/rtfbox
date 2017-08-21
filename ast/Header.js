

class Header {
	constructor(version, charset, fonttbl, filetbl, colortbl, stylesheet, listtables, revtbl, utf, custom) {
		this.version = version;
		this.charset = charset;
		this.fonttbl = fonttbl;
		this.filetbl = filetbl;
		this.colortbl = colortbl;
		this.stylesheet = stylesheet;
		this.listtables = listtables;
		this.revtbl = revtbl;
		this.utf = utf;
		this.custom = custom;
	}
}

module.exports = Header;