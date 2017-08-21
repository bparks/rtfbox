

class Document {
	constructor(info, format, contents) {
		this.contents = contents
	}

	toHtml() {
		return "<body>" + this.contents.map((section) => {
			return section.toHtml();
		}).join("") + "</body>";
	}
}

module.exports = Document;