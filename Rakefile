$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require 'labelr/version'

require 'spec/rake/spectask'

desc "Run all examples"
Spec::Rake::SpecTask.new('spec') do |t|
    t.libs << 'lib'
    t.spec_files = FileList['spec/*.rb']
end

desc "Build gem"
task :build do
  system "gem build labelr.gemspec"
end

desc "Release gem"
task :release => :build do
  # system "gem push labelr-#{Labelr::VERSION}"
  puts "#{Labelr::VERSION}"
end
