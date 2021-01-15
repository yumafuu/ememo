require "test_helper"

class AliasCommandTest < Test::Unit::TestCase
  config = Memo::Config.new

  aliases = <<~TOML
    [namespace_alias]
    t = "test"

    [command_alias]
    alias1 = "edit -n t test"
  TOML

  data(
    "default" => {
      args: "a",
      expect: "echo '#{aliases}'",
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
