require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.test_files = FileList['test/**/*.rb']

  t.verbose = true
end

desc "Run tests"
task :default => :test