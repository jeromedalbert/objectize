require_relative 'lib/objectize/version'

Gem::Specification.new do |spec|
  spec.name = 'objectize'
  spec.version = Objectize::VERSION
  spec.authors = ['Jerome Dalbert']
  spec.email = ['jerome.dalbert@gmail.com']

  spec.summary = 'Transforms hashes into objects.'
  spec.description =
    'Transforms hashes into objects. Check documentation at https://github.com/jeromedalbert/objectize.'
  spec.homepage = 'https://github.com/jeromedalbert/objectize'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.0.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/jeromedalbert/objectize'

  gemspec = File.basename(__FILE__)
  spec.files =
    IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
      ls
        .readlines("\x0", chomp: true)
        .reject do |f|
          (f == gemspec) ||
            f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
        end
    end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'hashie'
end
