# -*- encoding: utf-8 -*-
require File.expand_path('../lib/git-whistles/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Julien Letessier", "Pedro Cunha"]
  gem.email         = ["julien.letessier@gmail.com"]
  gem.description   = %q{A few helpers for classic Git workflows}
  gem.summary       = %q{
    A few helpers for classic Git workflows:
    makes branching and merging, PO file handling, issuing pull requests
    slightly simpler.
  }
  gem.homepage      = "http://github.com/mezis/git-whistles"
  gem.license       = 'MIT'

  gem.required_rubygems_version = ">= 1.3.6"

  gem.add_development_dependency "bundler", ">= 1.0.0"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "pry"
  gem.add_development_dependency "pry-nav"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "webmock"
  gem.add_development_dependency "vcr"

  gem.add_dependency "pivotal-tracker", "~> 0.5.6"
  gem.add_dependency "term-ansicolor"
  gem.add_dependency "jira-ruby", "~> 1.0.0"
  gem.add_dependency "youtrack", "~> 0.0.11"
  gem.add_dependency "faraday", "~> 2.6.0"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "git-whistles"
  gem.require_paths = ["lib"]
  gem.version       = Git::Whistles::VERSION
end
