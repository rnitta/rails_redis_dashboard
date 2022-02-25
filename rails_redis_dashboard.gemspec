require_relative "lib/rails_redis_dashboard/version"

Gem::Specification.new do |spec|
  spec.name = "rails_redis_dashboard"
  spec.version = RailsRedisDashboard::VERSION
  spec.authors = ["rnitta"]
  spec.email = ["attinyes@gmail.com"]
  # spec.homepage = "TOD"
  spec.summary = "Summary of RailsRedisDashboard."
  spec.description = "Description of RailsRedisDashboard."
  spec.license = "MIT"
  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails"
end
