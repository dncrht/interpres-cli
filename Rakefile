desc 'Gem debugging'
task :console do
  sh 'pry -I lib -r interpres'
end

namespace :interpres do

  desc 'Download translation files'
  task :download, :path do |t, args|
    require 'interpres'
    Interpres::Pull.run(args['path'])
  end

  desc 'Upload translation texts'
  task :upload, :path, :inclusion, :exclusion do |t, args|
    require 'interpres'
    Interpres::Push.run(args['path'], args['inclusion'], args['exclusion'])
  end
end
