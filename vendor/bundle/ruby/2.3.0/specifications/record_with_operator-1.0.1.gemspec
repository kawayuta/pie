# -*- encoding: utf-8 -*-
# stub: record_with_operator 1.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "record_with_operator".freeze
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Yasuko Ohba".freeze]
  s.date = "2014-09-12"
  s.description = "RecordWithOperator is a rails plugin that makes your all active record models to be saved or logically deleted with created_by, updated_by, deleted_by automatically. Also it makes creator, updater, deleter association (belongs_to) if the class has created_by, updated_by, deleted_by.".freeze
  s.email = ["y.ohba@everyleaf.com".freeze]
  s.extra_rdoc_files = ["README.rdoc".freeze]
  s.files = ["README.rdoc".freeze]
  s.homepage = "https://github.com/nay/record_with_operator".freeze
  s.licenses = ["MIT".freeze]
  s.rubyforge_project = "record_with_operator".freeze
  s.rubygems_version = "2.6.4".freeze
  s.summary = "Rails plugin to set created_by, updated_by, deleted_by to ActiveRecord objects. Supports associations.".freeze

  s.installed_by_version = "2.6.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 1.0.0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0.8.7"])
      s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
    else
      s.add_dependency(%q<activerecord>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, [">= 1.0.0"])
      s.add_dependency(%q<rake>.freeze, [">= 0.8.7"])
      s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 1.0.0"])
    s.add_dependency(%q<rake>.freeze, [">= 0.8.7"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
  end
end
