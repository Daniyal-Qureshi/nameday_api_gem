# frozen_string_literal: true

require_relative 'lib/nameday_api/version'

Gem::Specification.new do |spec|
  spec.name = 'nameday_api'
  spec.version = NamedayApi::VERSION
  spec.authors = ['Daniyal Qureshi']
  spec.email = ['daniyalqureshi.cs@gmail.com']

  spec.summary = 'A Ruby gem for fetching nameday information.'
  spec.description = 'NamedayApi is a Ruby gem that provides a simple interface
                      to fetch nameday information from the "nameday.abalin.net" API.'
  spec.homepage = 'https://github.com/Daniyal-Qureshi/nameday_api_gem'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['allowed_push_host'] = 'none'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = spec.homepage

  spec.license = 'MIT'

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rake', '~> 13.0'
  spec.add_runtime_dependency 'rspec-rails'
  spec.add_development_dependency 'webmock'
end
