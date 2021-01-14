require "test_helper"

class CustomCommandTest < Test::Unit::TestCase
  config = Memo::Config.new

  data(
    "case1" => {
      args: "alias1",
      expect: "vim #{config.root}/test/test.#{config.ext}",
    },
  )

  test "success" do |input|
    cmd = Memo::Cli.new(
      input[:args].split(" "),
      os: Mock::OS.new,
    ).call

    assert_equal input[:expect], cmd
  end
end
