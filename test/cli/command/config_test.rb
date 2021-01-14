require "test_helper"

class ConfigCommandTest < Test::Unit::TestCase
  root = Memo::Default::Root.to_s
  editor = Memo::Default::Editor.to_s
  file = Memo::Default::Configfile.to_s

  data(
    "default" => {
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
