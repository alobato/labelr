# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'labelr/version'

Gem::Specification.new do |gem|
  gem.name    = 'labelr'
  gem.version = Labelr::VERSION
  gem.date    = Time.now.strftime('%Y-%m-%d')
  gem.summary = "Generator for labels"
  gem.description = "Generate label sheets"
  gem.authors  = '@alobato'

  gem.files = Dir['{lib,spec}/**/*', 'README*', 'Rakefile', '*.gemspec'] & `git ls-files -z`.split("\0")

  gem.add_dependency('prawn', '>= 0.8.4')
  gem.add_development_dependency('rspec')
end
