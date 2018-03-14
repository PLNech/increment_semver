# Increment SemVer
> A gem to increment a version number following the [Semantic Versioning scheme](semver.org)

## Install

To install (or update to latest release):
```ruby
gem install increment_semver
```

Alternatively, add the following to your GemFile:
```gemfile
gem 'increment_semver', '~> 0.0.1' 
```

## Usage
```ruby
require 'increment_semver'
new_version = increment_semver('1.0.0', 'minor') // Now 1.1.0
```


