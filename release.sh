#! /bin/sh
set -eo pipefail
if [ $# -ne 1 ]; then
    echo "$0 | A script to release new versions automatically"
    echo "Usage: $0 VERSION_CODE"
    exit -1
fi
VERSION_CODE=$1

GEMSPEC=increment_semver.gemspec
# Only release from master
currentBranch=$(git rev-parse --abbrev-ref HEAD)
if [ "$currentBranch" != 'master' ]; then
  printf "Release: You must be on master\\n"
  exit 1
fi

# Check that the working repository is clean (without any changes, neither staged nor unstaged).
if ! git diff --exit-code > /dev/null || ! git diff --staged --exit-code > /dev/null
then
    echo "ERROR: Working copy not clean! Aborting." 1>&2
    echo "Please stash, revert or commit any pending changes before releasing." 1>&2
    exit 1
fi

echo "About to release $VERSION_CODE"
echo "Bumping version number in gemspec..."
sed -i '' "s/\\(.*s\\.version     = \\).*/\\1'$VERSION_CODE'/" $GEMSPEC
git add $GEMSPEC
git commit -m "chore: Bump version to $VERSION_CODE"
echo "Building new gem..."
gem build $GEMSPEC

echo "Pushing gem v$VERSION_CODE to RubyGems.org..."
gem push increment_semver-*.gem
echo "Pushing release commit to GitHub..."
git push origin master
echo "Release complete."
rm ./*.gem
