gulp = require('gulp')
jshint = require('gulp-jshint')
stylish = require('jshint-stylish')

gulp.task 'lint', ->
  return gulp.src([
    './source/js/src/utils.js',
    './source/js/src/motion.js',
    './source/js/src/hook-duoshuo.js',
    './source/js/src/algolia-search.js',
    './source/js/src/bootstrap.js',
    './source/js/src/post-details.js',
    './source/js/src/schemes/pisces.js'
  ]).pipe jshint()
    .pipe jshint.reporter(stylish)


gulp.task 'default', ['lint']
