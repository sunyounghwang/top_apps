
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "top_apps/version"

Gem::Specification.new do |spec|
  spec.name          = "top_apps"
  spec.version       = TopApps::VERSION
  spec.authors       = ["'Sunyoung'"]
  spec.email         = ["'sunyounghwang13@gmail.com'"]

  spec.summary       = %q{Top Apps displays the top 5 free apps on Apple's iTunes Chart.}
  spec.description   = %q{Top Apps is a CLI that lists the current top 5 free apps on Apple's iTunes Chart and allows you to learn more about them.}
  spec.homepage      = "https://github.com/sunyounghwang/top_apps"
  spec.license       = "MIT"

  spec.files         = ["lib/top_apps.rb", "lib/top_apps/app.rb", "lib/top_apps/cli.rb", "lib/top_apps/scraper.rb", "lib/top_apps/version.rb"]
  spec.executables   << "top-apps"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "pry"
end
