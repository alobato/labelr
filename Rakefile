require 'spec/rake/spectask'

desc "Run all examples"
Spec::Rake::SpecTask.new('spec') do |t|
    t.libs << 'lib'
    t.spec_files = FileList['spec/*.rb']
end
