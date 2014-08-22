$:.push File.expand_path('../lib', __FILE__)
require 'interpres/version'

Gem::Specification.new do |s|
  s.name        = 'interpres'
  s.version     = Interpres::VERSION
  s.authors     = ['Daniel Cruz Horts']
  s.homepage    = 'https://github.com/dncrht/interpres-cli'
  s.summary     = 'Push/pull translations from the command line'
  s.description = 'CLI interface to the Interpres server'
  s.license     = 'MIT'

  s.files = Dir['{bin,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.executables = s.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'oj', '~> 2.10'
  s.add_dependency 'faraday', '~> 0.9'
  s.add_dependency 'gettext', '~> 2.2'

  s.add_development_dependency 'pry', '~> 0.10'
  s.add_development_dependency 'pry-byebug', '~> 1.3'
end
