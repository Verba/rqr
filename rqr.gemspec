# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rqr"
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryota Maruko"]
  s.date = "2011-11-14"
  s.description = "A ruby library to create qrcode. Output: PS, JPEG, PNG, EPS, TIFF."
  s.email = ["pools _at_ rubyforge _dot_ org"]
  s.extensions = ["ext/rqr/extconf.rb"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "README.txt", "ext/rqr/extconf.rb"]
  s.homepage = "http://rqr.rubyforge.org"
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "rqr"
  s.rubygems_version = "1.8.10"
  s.summary = "A ruby library to create qrcode. Output: PS, JPEG, PNG, EPS, TIFF."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, ["~> 2.12"])
    else
      s.add_dependency(%q<hoe>, ["~> 2.12"])
    end
  else
    s.add_dependency(%q<hoe>, ["~> 2.12"])
  end
end
