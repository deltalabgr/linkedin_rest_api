# frozen_string_literal: true

require_relative "lib/linkedin_rest_api/version"

Gem::Specification.new do |spec|
  spec.name = "linkedin_rest_api"
  spec.version = LinkedinRestApi::VERSION
  spec.authors = ["Dimitrios Douros"]
  spec.email = ["dourosdimitris@outlook.com"]

  spec.summary = "LinkedIn REST Share API."
  spec.description = "LinkedIn REST Share API."
  spec.homepage = "https://github.com/deltalabgr/linkedin_rest_api"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.4"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/deltalabgr/linkedin_rest_api"
  spec.metadata["changelog_uri"] = "https://github.com/deltalabgr/linkedin_rest_api/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "httparty", "~> 0.21"

  # Development dependency
  # spec.add_development_dependency "dotenv"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
