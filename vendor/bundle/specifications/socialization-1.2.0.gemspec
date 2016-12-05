# -*- encoding: utf-8 -*-
# stub: socialization 1.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "socialization".freeze
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Carl Mercier".freeze]
  s.date = "2015-08-08"
  s.description = "Socialization allows any model to Follow and/or Like any other model. This is accomplished through a double polymorphic relationship on the Follow and Like models. But you don't need to know that since all the complexity is hidden from you.".freeze
  s.email = "carl@carlmercier.com".freeze
  s.homepage = "https://github.com/cmer/socialization".freeze
  s.rubygems_version = "2.6.4".freeze
  s.summary = "Easily socialize your app with Likes and Follows".freeze

  s.installed_by_version = "2.6.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>.freeze, [">= 0"])
      s.add_development_dependency(%q<appraisal>.freeze, [">= 0"])
      s.add_development_dependency(%q<logger>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.3.0"])
      s.add_development_dependency(%q<rspec-mocks>.freeze, [">= 0"])
      s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_development_dependency(%q<yard>.freeze, [">= 0"])
      s.add_development_dependency(%q<mock_redis>.freeze, [">= 0"])
      s.add_development_dependency(%q<guard>.freeze, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>.freeze, [">= 0"])
    else
      s.add_dependency(%q<activerecord>.freeze, [">= 0"])
      s.add_dependency(%q<appraisal>.freeze, [">= 0"])
      s.add_dependency(%q<logger>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.3.0"])
      s.add_dependency(%q<rspec-mocks>.freeze, [">= 0"])
      s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_dependency(%q<yard>.freeze, [">= 0"])
      s.add_dependency(%q<mock_redis>.freeze, [">= 0"])
      s.add_dependency(%q<guard>.freeze, [">= 0"])
      s.add_dependency(%q<guard-rspec>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>.freeze, [">= 0"])
    s.add_dependency(%q<appraisal>.freeze, [">= 0"])
    s.add_dependency(%q<logger>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.3.0"])
    s.add_dependency(%q<rspec-mocks>.freeze, [">= 0"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
    s.add_dependency(%q<yard>.freeze, [">= 0"])
    s.add_dependency(%q<mock_redis>.freeze, [">= 0"])
    s.add_dependency(%q<guard>.freeze, [">= 0"])
    s.add_dependency(%q<guard-rspec>.freeze, [">= 0"])
  end
end
