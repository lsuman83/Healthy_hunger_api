require_relative 'lib/Healthy_hunger_api/version'

Gem::Specification.new do |spec|
  spec.name          = "Healthy_hunger_api"
  spec.version       = HealthyHungerApi::VERSION
  spec.authors       = ["Sean Bordelon"]
  spec.email         = ["sean.j.bordelon@gmail.com"]

  spec.summary       = %q{Displays a List of created meals from Recipe-Food-Nutrition API}
  spec.description   = %q{CLI program for getting a List of created meals abd providing a recipe from Recipe-Food-Nutrition API}
  spec.homepage      = "https://github.com/lsuman83/Healthy_hunger_api"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/lsuman83/Healthy_hunger_api"
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  #spec.bindir        = "exe"
  spec.executables   = ["Healthy_hunger_api"]
  spec.require_paths = ["lib"]
end
