Gem::Specification.new do |s|
  s.name = %q{simple_settings}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pradeep Elankumaran"]
  s.autorequire = %q{simple_settings}
  s.date = %q{2008-11-29}
  s.description = %q{A gem that provides a basic Settings object for Ruby/Rails/Merb apps}
  s.email = %q{pradeep@intridea.com}
  s.extra_rdoc_files = ["README", "LICENSE", "TODO"]
  s.files = ["LICENSE", "README", "Rakefile", "TODO", "lib/simple_settings.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/skyfallsin/simple_settings}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.2.0}
  s.summary = s.description
  s.add_dependency("mash", ">= 0.0.1")

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
    else
    end
  else
  end
end
