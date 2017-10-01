

class Section {
	constructor(contents) {
		this.contents = contents
	}

	toHtml(header) {
		return "<section>" + this.contents.map(x => (x.toHtml || x.toString).apply(x, [header])).join('') + "</section>";
	}
}

module.exports = Section;