

class Block {
	constructor(modifiers, contents) {
		this.modifiers = modifiers;
		this.contents = contents;
	}

	toHtml(header) {
		if (this.modifiers.filter(m => m == 'listtext').length > 0) {
			// We support list items natively, so this effectively becomes an li
			var popTags = "";
			var idx = header._state.indexOf("li");
			for (var i = 0; i <= idx; i++) {
				popTags += "\n</" + header._state[i] + ">";
			}
			
			header._state.splice(0, idx + 1, 'li');
			return popTags + "\n<li>";
		}
		return "\n<block>" + this.contents.map(x => (x.toHtml || x.toString).apply(x)).join('') + "</block>";
	}
}

module.exports = Block;