
require 'date'

Gem::Specification.new do |spec|

  spec.name                      =  'reraise'
  spec.rubyforge_project         =  'reraise'
  spec.version                   =  '0.0.1'

  spec.summary                   =  "Re-raise a rescued Exception to refer to line where missing call originated."
  spec.description               =  "Adds a line to the Exception's backtrace corresponding to line where missing call originated. Does not modify backtrace otherwise. Requires specifying how many levels under missing call re-raise occurs."

  spec.authors                   =  [ 'Asher' ]
  spec.email                     =  'asher@ridiculouspower.com'
  spec.homepage                  =  'http://rubygems.org/gems/reraise'

  spec.required_ruby_version     = ">= 1.9.1"

  spec.date                      = Date.today.to_s
  
  spec.files                     = Dir[ '{lib,spec}/**/*',
                                        'README*', 
                                        'LICENSE*',
                                        'CHANGELOG*' ]

end
