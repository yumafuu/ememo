require "test_helper"

class TodayCommandTest < Test::Unit::TestCase
  config = Memo::Config.new
  today = Memo::Today.new

  data(
    "case1" => {
      args: "t",
      expect: "vim #{config.root}/#{today.dir}/#{today.file}",
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
