# -*- encoding: utf-8 -*-
require File.expand_path('../lib/motion-layouts/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["malkomalko (Robert Malko)"]
  gem.email         = ["robmalko@gmail.com"]
  gem.description   = %q{A DSL for creating layouts easily in RubyMotion. Also comes bundled with a set of categories to make life easier. I'm using the word category from objective-c land which is basically the same as re-opening classes in ruby :D.}
  gem.summary       = %q{A DSL for creating layouts easily in RubyMotion}
  gem.homepage      = "https://github.com/malkomalko/motion-layouts"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "motion-layouts"
  gem.require_paths = ["lib"]
  gem.version       = Motion::Layouts::VERSION
end
