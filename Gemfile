source 'https://rubygems.org'

gem "bundler", "> 1"
if defined?(RUBY_VERSION) && RUBY_VERSION > '1.9'
  gem "rake", "~> 11.1"
else
  gem "rake", "< 11.0"
end

gem 'elasticsearch2-api',        :path => File.expand_path("../elasticsearch2-api", __FILE__),        :require => false
gem 'elasticsearch2-transport',  :path => File.expand_path("../elasticsearch2-transport", __FILE__),  :require => false
gem 'elasticsearch2-extensions', :path => File.expand_path("../elasticsearch2-extensions", __FILE__), :require => false
gem 'elasticsearch2',            :path => File.expand_path("../elasticsearch2", __FILE__),            :require => false

gem "pry"
gem "ansi"
gem "shoulda-context"
gem "mocha"
gem "turn"
gem "yard"
gem "ci_reporter", "~> 1.9"

if defined?(RUBY_VERSION) && RUBY_VERSION > '1.9'
  gem "ruby-prof"    unless defined?(JRUBY_VERSION) || defined?(Rubinius)
  gem "require-prof" unless defined?(JRUBY_VERSION) || defined?(Rubinius)
  gem "simplecov"
  gem "simplecov-rcov"
  gem "cane"
end

if defined?(RUBY_VERSION) && RUBY_VERSION > '2.2'
  gem "test-unit", '~> 2'
end
