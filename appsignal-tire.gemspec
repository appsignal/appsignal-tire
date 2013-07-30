# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'appsignal-tire/version'

Gem::Specification.new do |s|
  s.name          = 'appsignal-tire'
  s.version       = Appsignal::Tire::VERSION
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Thijs Cadier', 'Steven Weller']
  s.email         = %w{contact@appsignal.com}

  s.homepage      = 'https://github.com/appsignal/appsignal-tire'
  s.summary       = 'Add instrument calls to tire queries '\
                    'made with Tire. For use with Appsignal.'
  s.description   = 'Wrap all Tire queries with'\
                    'ActiveSupport::Notifications.instrument calls.'\
                    'For use with Appsignal.'
  s.files         = Dir.glob('lib/**/*') + %w(README.md)

  s.require_path  = 'lib'

  s.add_dependency 'appsignal', '> 0.5'
  s.add_dependency 'tire', '> 0.3'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'pry'
end
