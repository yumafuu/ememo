require "test_helper"

class ConfigCommandTest < Test::Unit::TestCase
  root = Memo::Default::Root.new
  editor = Memo::Default::Editor.new
  file = Memo::Default::Configfile.new

  data(
    "case1" => {
      args: "config",
      expect: "vim #{ENV["MEMO_CONFIG"]}",
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
