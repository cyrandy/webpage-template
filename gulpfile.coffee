require 'coffee-script/register'
gulp       = require 'gulp'
gutil      = require 'gulp-util'
coffee     = require 'gulp-coffee'
jade       = require 'gulp-jade'
sass       = require 'gulp-ruby-sass'
webserver  = require 'gulp-webserver'
clean      = require 'gulp-clean'

runSequence = require('run-sequence')

gulp.task 'clean', ->
    gulp.src('./build/', {read: false})
        .pipe(clean())

gulp.task 'coffee', ->
    gulp.src('./coffee/**/*.coffee')
        .pipe(coffee()).on('error', gutil.log)
        .pipe(gulp.dest('./build/js'))

gulp.task 'jade', ->
    gulp.src('./jade/**/*.jade')
        .pipe(jade({pretty: true}))
        .pipe(gulp.dest('./build'))

gulp.task 'sass', ->
    gulp.src('./sass/**/*.sass')
        .pipe(sass({
            style: 'expanded',
            compass: true,
            require: ['susy']
        }))
        .on('error', gutil.log)
        .pipe(gulp.dest('./build/css'))

gulp.task 'watch', ['build', 'webserver'], ->
    gulp.watch('./coffee/**/*.coffee', ['coffee'])
    gulp.watch('./jade/**/*.jade', ['jade'])
    gulp.watch('./sass/**/*.sass', ['sass'])

gulp.task 'build', ->
    runSequence ['sass', 'jade', 'coffee']

gulp.task 'webserver', ->
    config = {
        livereload: true
        port: 1234
        # directoryListing: true
        open: true
        fallback: 'index.html'
    }
    gulp.src('./build/')
        .pipe(webserver(config))


gulp.task 'default', ['watch']
