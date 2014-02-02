# -*- encoding: utf-8 -*-
# stub: activerecord 3.2.13 ruby lib

Gem::Specification.new do |s|
  s.name = "activerecord"
  s.version = "3.2.13"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["David Heinemeier Hansson"]
  s.date = "2013-03-18"
  s.description = "Databases on Rails. Build a persistent domain model by mapping database tables to Ruby classes. Strong conventions for associations, validations, aggregations, migrations, and testing come baked-in."
  s.email = "david@loudthinking.com"
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc"]
  s.homepage = "http://www.rubyonrails.org"
  s.rdoc_options = ["--main", "README.rdoc"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubygems_version = "2.2.1"
  s.summary = "Object-relational mapper framework (part of Rails)."

  s.installed_by_version = "2.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, ["= 3.2.13"])
      s.add_runtime_dependency(%q<activemodel>, ["= 3.2.13"])
      s.add_runtime_dependency(%q<arel>, ["~> 3.0.2"])
      s.add_runtime_dependency(%q<tzinfo>, ["~> 0.3.29"])
    else
      s.add_dependency(%q<activesupport>, ["= 3.2.13"])
      s.add_dependency(%q<activemodel>, ["= 3.2.13"])
      s.add_dependency(%q<arel>, ["~> 3.0.2"])
      s.add_dependency(%q<tzinfo>, ["~> 0.3.29"])
    end
  else
    s.add_dependency(%q<activesupport>, ["= 3.2.13"])
    s.add_dependency(%q<activemodel>, ["= 3.2.13"])
    s.add_dependency(%q<arel>, ["~> 3.0.2"])
    s.add_dependency(%q<tzinfo>, ["~> 0.3.29"])
  end
end
