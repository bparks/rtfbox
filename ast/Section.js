

class Section {
	constructor(contents) {
		this.contents = contents
	}

	toHtml() {
		return "<section>" + this.contents.map(x => (x.toHtml || x.toString).apply(x)).join('') + "</section>";
	}
}

module.exports = Section;