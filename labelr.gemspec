# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name    = 'labelr'
  gem.version = '0.1'
  gem.date    = Time.now.strftime('%Y-%m-%d')

  gem.summary = "Generator for labels"
  gem.description = "Generate label sheets"

  gem.authors  = ['alobato']
  gem.homepage = 'http://twitter.com/alobato'

  gem.add_dependency('prawn', '>= 0.8.4')
  gem.add_development_dependency('rspec')

  gem.files = Dir['lib/**/*', 'README*'] & `git ls-files -z`.split("\0")
  gem.test_files = Dir['spec/**/*', 'README*'] & `git ls-files -z`.split("\0")
end
