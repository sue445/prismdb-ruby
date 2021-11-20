require_relative 'lib/prismdb/version'

Gem::Specification.new do |spec|
  spec.name          = "prismdb"
  spec.version       = Prismdb::VERSION
  spec.authors       = ["sue445"]
  spec.email         = ["sue445@sue445.net"]

  spec.summary       = %q{PrismDB API client for ruby}
  spec.description   = %q{PrismDB API client for ruby}
  spec.homepage      = "https://github.com/sue445/prismdb-ruby"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/sue445/prismdb-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/sue445/prismdb-ruby/blob/master/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">= 1.0.0"
  spec.add_dependency "faraday_middleware"
  spec.add_dependency "hashie"
end
