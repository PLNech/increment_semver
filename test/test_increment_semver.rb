gem 'minitest'
require 'minitest/autorun'
require 'increment_semver'

class IncrementSemVerTest < MiniTest::Test
  def test_patch
    assert_equal "1.2.4",
      increment_semver("1.2.3", "patch")
  end
  def test_minor
    assert_equal "1.3.0",
      increment_semver("1.2.3", "minor")
  end
  def test_major
    assert_equal "2.0.0",
      increment_semver("1.2.3", "major")
  end
end
