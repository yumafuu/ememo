require "test_helper"

class ListCommandTest < Test::Unit::TestCase
  config = Memo::Config.new

  data(
    "case1" => {
      args: "l",
      expect: "find #{config.root}/mymemo -type f",
    },
    "case2" => {
      args: "l -a",
      expect: "find #{config.root}/ -type f",
    },
    "case3" => {
      args: "l -a -d",
      expect: "find #{config.root}/ -type d",
    },
    "case4" => {
      args: "l -n t",
      expect: "find #{config.root}/test -type f",
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
