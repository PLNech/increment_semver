#! /usr/bin/env ruby
def increment_semver(semver, increment_type = "patch")
  # Increment a version code following SemVer Scheme
  #
  # Example:
  #   >> increment_semver("1.2.3")
  #   => "1.2.4"
  #
  #   >> increment_semver("1.2.3", "major")
  #   => "2.0.0"
  #
  # Arguments:
  #   semver: (String)
  #   increment_type: (String)
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
