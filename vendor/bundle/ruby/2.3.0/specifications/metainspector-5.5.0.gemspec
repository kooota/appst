# -*- encoding: utf-8 -*-
# stub: metainspector 5.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "metainspector"
  s.version = "5.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jaime Iniesta"]
  s.date = "2018-05-15"
  s.description = "MetaInspector lets you scrape a web page and get its links, images, texts, meta tags..."
  s.email = ["jaimeiniesta@gmail.com"]
  s.homepage = "https://github.com/jaimeiniesta/metainspector"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "MetaInspector is a ruby gem for web scraping purposes, that returns metadata from a given URL"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.7"])
      s.add_runtime_dependency(%q<faraday>, ["~> 0.11"])
      s.add_runtime_dependency(%q<faraday_middleware>, ["~> 0.11"])
      s.add_runtime_dependency(%q<faraday-cookie_jar>, ["~> 0.0"])
      s.add_runtime_dependency(%q<faraday-http-cache>, ["~> 2.0"])
      s.add_runtime_dependency(%q<faraday-encoding>, ["~> 0.0"])
      s.add_runtime_dependency(%q<addressable>, ["~> 2.5"])
      s.add_runtime_dependency(%q<fastimage>, ["~> 2.1"])
      s.add_runtime_dependency(%q<nesty>, ["~> 1.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
      s.add_development_dependency(%q<webmock>, [">= 0"])
      s.add_development_dependency(%q<awesome_print>, [">= 0"])
      s.add_development_dependency(%q<rake>, ["~> 10.1.0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<rubocop>, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>, ["~> 1.7"])
      s.add_dependency(%q<faraday>, ["~> 0.11"])
      s.add_dependency(%q<faraday_middleware>, ["~> 0.11"])
      s.add_dependency(%q<faraday-cookie_jar>, ["~> 0.0"])
      s.add_dependency(%q<faraday-http-cache>, ["~> 2.0"])
      s.add_dependency(%q<faraday-encoding>, ["~> 0.0"])
      s.add_dependency(%q<addressable>, ["~> 2.5"])
      s.add_dependency(%q<fastimage>, ["~> 2.1"])
      s.add_dependency(%q<nesty>, ["~> 1.0"])
      s.add_dependency(%q<rspec>, ["~> 3.0"])
      s.add_dependency(%q<webmock>, [">= 0"])
      s.add_dependency(%q<awesome_print>, [">= 0"])
      s.add_dependency(%q<rake>, ["~> 10.1.0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<rubocop>, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>, ["~> 1.7"])
    s.add_dependency(%q<faraday>, ["~> 0.11"])
    s.add_dependency(%q<faraday_middleware>, ["~> 0.11"])
    s.add_dependency(%q<faraday-cookie_jar>, ["~> 0.0"])
    s.add_dependency(%q<faraday-http-cache>, ["~> 2.0"])
    s.add_dependency(%q<faraday-encoding>, ["~> 0.0"])
    s.add_dependency(%q<addressable>, ["~> 2.5"])
    s.add_dependency(%q<fastimage>, ["~> 2.1"])
    s.add_dependency(%q<nesty>, ["~> 1.0"])
    s.add_dependency(%q<rspec>, ["~> 3.0"])
    s.add_dependency(%q<webmock>, [">= 0"])
    s.add_dependency(%q<awesome_print>, [">= 0"])
    s.add_dependency(%q<rake>, ["~> 10.1.0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<rubocop>, [">= 0"])
  end
end
