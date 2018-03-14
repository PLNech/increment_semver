#! /usr/bin/env ruby
# Increment a version code following SemVer Scheme
#
# @param semver [String] the version code to update, e.g. "1.2.3"
# @param increment_type [String] the version code to update, e.g. "1.2.3"
# @return [String] the version code updated according to #increment_type
#
# @example Default increment (patch)
#   increment_semver("1.2.3")  #=> "1.2.4"
#
# @example Increment for given type
#   increment_semver("1.2.3", "major")  #=> "2.0.0"
def increment_semver(semver, increment_type = "patch")
  if not (/\d+\.\d+\.\d+/).match(semver)
    raise "Your semantic version must match the format 'X.X.X'."
  end
  if not ["patch", "minor", "major"].include?(increment_type)
    raise "Only 'patch', 'minor', and 'major' are supported increment types."
  end

  major, minor, patch = semver.split(".")
  case increment_type
    when "patch"
      patch = patch.to_i + 1
    when "minor"
      minor = minor.to_i + 1
      patch = 0
    when "major"
      major = major.to_i + 1
      minor = 0
      patch = 0
  end

  return "#{major}.#{minor}.#{patch}"
end
