# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'digest/simple'

Gem::Specification.new do |spec|
  spec.name          = "digest-simple"
  spec.version       = Digest::Simple::VERSION
  spec.authors       = ["ksss"]
  spec.email         = ["co000ri@gmail.com"]
  spec.summary       = %q{Digest::Simple is a class that minimun implementation for non block message digest.}
  spec.description   = %q{Digest::Simple is a class that minimun implementation for non block message digest.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
