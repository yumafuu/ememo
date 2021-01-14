# frozen_string_literal: true

require "test_helper"

class MemoTest < Test::Unit::TestCase
  test "VERSION" do
    assert do
      ::Memo.const_defined?(:VERSION)
    end
  end
end
