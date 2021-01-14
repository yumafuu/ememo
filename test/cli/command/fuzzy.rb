require "test_helper"

class FuzzyCommandTest < Test::Unit::TestCase
  config = Memo::Config.new

  data(
    "case1" => {
      args: "f",
      expect: "#{config.editor} $(find #{config.root} -type f "\
        "| #{config.fuzzy})",
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
