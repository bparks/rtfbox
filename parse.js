const parser = require('./rtf.js')
const process = require('process')
const fs = require('fs')

if (process.argv.length < 3) {
	console.log("USAGE: node parse.js [rtf file]");
	process.exit(-1);
}

fs.readFile(process.argv[2], 'utf8', (err, rtf) => {
	if (err) {
		console.log(err);
		process.exit(-1);
	}
	var ast = parser.parse(rtf);
	//console.log(ast);
	console.log(ast.toHtml());
})