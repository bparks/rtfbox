require('./Header');
require('./Document');

class File {
	constructor(header, document) {
		this.header = header;
		this.document = document;
	}

	toHtml() {
		return this.document.toHtml(this.header);
	}
}

module.exports = File;