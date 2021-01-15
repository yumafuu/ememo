require "test_helper"

class HelpCommandTest < Test::Unit::TestCase
  data(
    "case1" => {
      args: "h",
      expect: nil,
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
