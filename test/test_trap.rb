# frozen_string_literal: true

require 'minitest_helper'

class TestTrap < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Trap::VERSION
  end

  def test_it_does_something_useful
    assert false
  end
end
