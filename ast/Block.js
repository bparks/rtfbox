

class Block {
	constructor(modifiers, contents) {
		this.modifiers = modifiers;
		this.contents = contents;
	}

	toHtml() {
		return this.contents.map(x => (x.toHtml || x.toString).apply(x)).join('');
	}
}

module.exports = Block;