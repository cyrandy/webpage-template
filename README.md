webpage-template
=============

This project allow you to use elegant syntax build a static web page, with a simple develop environment.
Use [Jade](http://jade-lang.com)/[Sass](http://sass-lang.com)/[Coffee](http://coffeescript.org) which will compile into html/css/js files.
Use gulp to watch, compile files, and also support livereload.

## Setup Environment

1. install npm `brew install npm`

2. install bundler `gem install bundler` (optional: set up `rbenv` or `rvm` first. Make sure gem run under folder in your home directory to prevent permission problem.)

3. `git clone git@github.com:cyrandy/webpage-template.git` and `cd webpage-template`

4. `npm install` and `bundle install`

5. run `./node_modules/gulp/bin/gulp.js` will auto open the livereload web service in your browser. 

6. You will see Hello World! on your browser and start enjoy your web page development!