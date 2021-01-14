require "test_helper"

class PreviewCommandTest < Test::Unit::TestCase
  root = Memo::Default::Root.to_s
  today = Memo::Today.new

  data(
    "case1" => {
      args: "p",
      expect: "cat #{root}/mymemo/memo.md",
    },
    "case2" => {
      args: "p t",
      expect: "cat #{root}/#{today.dir}/#{today.file}",
    },
    "case3" => {
      args: "p -n hoge",
      expect: "cat #{root}/hoge/memo.md",
    },
    "case4" => {
      args: "p -n hoge fuga",
      expect: "cat #{root}/hoge/fuga.md",
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
