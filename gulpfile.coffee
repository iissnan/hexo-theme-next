fs = require('fs')
path = require('path')
gulp = require('gulp')
jshint = require('gulp-jshint')
stylish = require('jshint-stylish')
yaml = require('js-yaml')

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

gulp.task 'validate:config', (cb) ->
  themeConfig = fs.readFileSync path.join(__dirname, '_config.yml')

  try
    yaml.safeLoad(themeConfig)
    cb()
  catch error
    cb new Error(error)

gulp.task 'validate:languages', (cb) ->
  languages = fs.readdirSync path.join(__dirname, 'languages')
  errors = []
  for lang in languages
    try
      yaml.safeLoad fs.readFileSync path.join(__dirname, 'languages', lang)
    catch error
      errors.push(error)

  if errors.length == 0
    cb()
  else
    cb(errors)


gulp.task 'default', ['lint', 'validate:config', 'validate:languages']
