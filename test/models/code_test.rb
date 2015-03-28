require 'test_helper'

class CodeTest < ActiveSupport::TestCase

  test "should not save code without a title" do
    code = Code.new
    assert_not code.save, "Saved a code without a title"
  end
end
