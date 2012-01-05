lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'wildcloud/configuration/version'

Gem::Specification.new do |s|
  s.name        = 'wildcloud-configuration'
  s.version     = Wildcloud::Configuration::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Marek Jelen']
  s.email       = ['marek@jelen.biz']
  s.homepage    = 'http://github.com/wildcloud'
  s.summary     = 'Configuration loader component for Wildcloud'
  s.description = 'Configuration loader extracted form Wildcloud platform'
  s.license     = 'Apache2'

  s.required_rubygems_version = '>= 1.3.6'

  s.files        = Dir.glob('{lib}/**/*') + %w(LICENSE README.md CHANGELOG.md)
  s.require_path = 'lib'
end