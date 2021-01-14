require "test_helper"

class EditCommandTest < Test::Unit::TestCase
  config = Memo::Config.new

  data(
    "alias1" => {
      args: "e",
      expect: "vim #{config.root}/mymemo/memo.#{config.ext}",
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
