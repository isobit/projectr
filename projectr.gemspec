# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'projectr/version'

Gem::Specification.new do |spec|
  spec.name          = 'projectr'
  spec.version       = Projectr::VERSION
  spec.authors       = ["Josh Glendenning"]
  spec.email         = ["joshglendenning@gmail.com"]

  spec.summary       = %q{Project templating tool for quickly starting and updating new projects.}
  spec.homepage      = "https://github.com/joshglendenning/projectr"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.bindir        = 'bin'
  spec.executables   = ['projectr']

  spec.add_dependency 'commander', '~> 4.3'
end
