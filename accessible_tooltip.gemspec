# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'accessible_tooltip/version'

Gem::Specification.new do |gem|
  gem.name          = "accessible_tooltip"
  gem.version       = AccessibleTooltip::VERSION
  gem.authors       = ["Daniel Vandersluis"]
  gem.email         = ["dvandersluis@selfmgmt.com"]
  gem.description   = %q{WCAG compliant balloon-style tooltip helper for Rails}
  gem.summary       = %q{WCAG compliant balloon-style tooltip helper for Rails}
  gem.homepage      = "https://github.com/dvandersluis/accessible_tooltip"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'rails', '>= 3.0.0'
  gem.add_dependency 'sass-rails', '>= 3.0.0'
end
