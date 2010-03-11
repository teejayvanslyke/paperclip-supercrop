# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{paperclip-supercrop}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["T.J. VanSlyke"]
  s.date = %q{2010-03-11}
  s.description = %q{A resize and crop plugin for Paperclip which allows specifying a compass-direction gravity option.  

Originally developed to fix the dreaded chopped-off-heads problem when uploading user content.}
  s.email = ["teejay.vanslyke@gmail.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "lib/paperclip-supercrop.rb", "script/console", "script/destroy", "script/generate", "spec/paperclip-supercrop_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "tasks/rspec.rake"]
  s.homepage = %q{http://github.com/teejayvanslyke/paperclip-supercrop}
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{paperclip-supercrop}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A resize and crop plugin for Paperclip which allows specifying a compass-direction gravity option}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rubyforge>, [">= 2.0.3"])
      s.add_development_dependency(%q<gemcutter>, [">= 0.5.0"])
      s.add_development_dependency(%q<hoe>, [">= 2.5.0"])
    else
      s.add_dependency(%q<rubyforge>, [">= 2.0.3"])
      s.add_dependency(%q<gemcutter>, [">= 0.5.0"])
      s.add_dependency(%q<hoe>, [">= 2.5.0"])
    end
  else
    s.add_dependency(%q<rubyforge>, [">= 2.0.3"])
    s.add_dependency(%q<gemcutter>, [">= 0.5.0"])
    s.add_dependency(%q<hoe>, [">= 2.5.0"])
  end
end
