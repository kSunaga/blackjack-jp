
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "blackjack_jp/version"

Gem::Specification.new do |spec|
  spec.name          = "blackjack_jp"
  spec.version       = BlackjackJp::VERSION
  spec.authors       = ["kSunaga"]
  spec.email         = ["jokers4140@gmail.com"]

  spec.summary       = %q{This is Blackjack for Japanese}
  spec.description   = %q{This is simple Blackjack}
  spec.homepage      = "https://github.com/kSunaga"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
