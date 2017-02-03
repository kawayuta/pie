# -*- encoding: utf-8 -*-
# stub: rack-user_agent 0.5.2 ruby lib

Gem::Specification.new do |s|
  s.name = "rack-user_agent".freeze
  s.version = "0.5.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Takashi Kokubun".freeze]
  s.date = "2016-07-11"
  s.description = "Rack::Request extension for handling User-Agent.".freeze
  s.email = ["takashikkbn@gmail.com".freeze]
  s.homepage = "https://github.com/k0kubun/rack-user_agent".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.4".freeze
  s.summary = "Rack::Request extension for handling User-Agent.".freeze

  s.installed_by_version = "2.6.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>.freeze, [">= 1.5"])
      s.add_runtime_dependency(%q<woothee>.freeze, [">= 1.0.0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
      s.add_development_dependency(%q<rack-test>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rack>.freeze, [">= 1.5"])
      s.add_dependency(%q<woothee>.freeze, [">= 1.0.0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<minitest>.freeze, [">= 0"])
      s.add_dependency(%q<rack-test>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rack>.freeze, [">= 1.5"])
    s.add_dependency(%q<woothee>.freeze, [">= 1.0.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_dependency(%q<rack-test>.freeze, [">= 0"])
  end
end
