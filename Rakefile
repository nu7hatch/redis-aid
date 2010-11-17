# -*- ruby -*-
$:.unshift(File.expand_path('../lib', __FILE__))

require 'rspec/core/rake_task'
require 'rake/rdoctask'
require 'redis/aid/version'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.rspec_opts = %q[-c -b]
end

RSpec::Core::RakeTask.new(:rcov) do |t|
  t.rcov = true
  t.rspec_opts = %q[-c -b]
  t.rcov_opts = %q[-T -x "spec"]
end

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "Redis Aid #{Redis::Aid.version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

task :default => :spec

desc "Build current version as a rubygem"
task :build do
  `gem build redis-aid.gemspec`
  `mkdir -p pkg`
  `mv redis-aid-*.gem pkg/`
end

desc "Relase current version to rubygems.org"
task :release => :build do
  `git tag -am "Version bump to #{Redis::Aid.version}" v#{Redis::Aid.version}`
  `git push origin master`
  `git push origin master --tags`
  `gem push pkg/redis-aid-#{Redis::Aid.version}.gem`
end

desc "Perform installation via rubygems"
task :install => :build do
  `gem install pkg/redis-aid-#{Redis::Aid.version}.gem`
end
