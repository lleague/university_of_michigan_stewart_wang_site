# -*- encoding: utf-8 -*-
# stub: ssl_requirement 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "ssl_requirement".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["David Heinemeier Hansson".freeze]
  s.date = "2010-01-12"
  s.description = "SSL requirement adds a declarative way of specifying that certain actions should only be allowed to run under SSL, and if they're accessed without it, they should be redirected.".freeze
  s.email = "david@loudthinking.com".freeze
  s.extra_rdoc_files = ["README".freeze]
  s.files = ["README".freeze]
  s.homepage = "http://github.com/rails/ssl_requirement".freeze
  s.rdoc_options = ["--charset=UTF-8".freeze]
  s.rubygems_version = "2.5.2".freeze
  s.summary = "SSL Requirement plugin".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version
end
