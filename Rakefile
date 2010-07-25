$:.unshift File.expand_path("../lib", __FILE__)

require 'labelr'
require 'labelr/version'

begin
  require 'spec/rake/spectask'
rescue LoadError
  raise 'Run `gem install rspec` to be able to run specs'
else
  desc "Run specs"
  Spec::Rake::SpecTask.new do |t|
    t.spec_files = FileList['spec/**/*_spec.rb']
    t.spec_opts  = %w(-fs --color)
    t.warning    = true
  end
  task :spec
end

desc "Build gem"
task :build do
  system "gem build labelr.gemspec"
end

desc "Install gem"
task :install => :build do
  system "gem install -l labelr-#{Labelr::VERSION}"
end

desc "Release gem"
task :release => :build do
  system "gem push labelr-#{Labelr::VERSION}"
end

task :default => :spec
