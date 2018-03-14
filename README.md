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

## Contributing

From [reporting an issue](https://github.com/PLNech/increment_semver/issues/new) to [contributing new code](https://github.com/PLNech/increment_semver/compare?expand=1), your collaboration is more than welcome!

- To run the tests: `rake`

- To release a new version: `./release.sh VERSION_CODE` (with `VERSION_CODE` following SemVer 😉)

