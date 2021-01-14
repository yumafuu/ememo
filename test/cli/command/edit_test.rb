require "test_helper"

class EditCommandTest < Test::Unit::TestCase
  config = Memo::Config.new

  data(
    "case1" => {
      args: "e",
      expect: "vim #{config.root}/mymemo/memo.#{config.ext}",
    },
    "case2" => {
      args: "e -n hoge",
      expect: "vim #{config.root}/hoge/memo.#{config.ext}",
    },
    "case3" => {
      args: "e -n hoge fuga",
      expect: "vim #{config.root}/hoge/fuga.#{config.ext}",
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
