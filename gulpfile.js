const gulp = require('gulp')
const peg = require('gulp-peg')

gulp.task("peg:compile", () => {
  gulp
    .src("rtf.pegjs")
    .pipe(peg())
    .pipe(gulp.dest("./"))
});

gulp.task("all:build", ["peg:compile"], () => {

});

gulp.task("default", ["all:build"]);