#! /bin/sh
set -e
gem build increment_semver.gemspec
gem push increment_semver-*.gem
rm ./*.gem
