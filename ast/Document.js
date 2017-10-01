

class Document {
	constructor(info, format, contents) {
		this.contents = contents
	}

	toHtml(header) {
		return "<body>" + this.contents.map((section) => {
			return section.toHtml(header);
		}).join("") + "</body>";
	}
}

module.exports = Document;