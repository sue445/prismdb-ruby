source "https://rubygems.org"

# Specify your gem's dependencies in prismdb.gemspec
gemspec

gem "coveralls"
gem "rake", "~> 12.0"
gem "rspec", "~> 3.0"
gem "rspec-its"

# Workaround for cc-test-reporter with SimpleCov 0.18.
# Stop upgrading SimpleCov until the following issue will be resolved.
# https://github.com/codeclimate/test-reporter/issues/418
gem "simplecov", "~> 0.10", "< 0.18"

gem "webmock", require: "webmock/rspec"
