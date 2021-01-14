require "test_helper"

class PreviewCommandTest < Test::Unit::TestCase
  root = Memo::Default::Root.to_s
  dir = Memo::Default::Namespace.to_s
  file = Memo::Default::Filename.to_s
  ext = Memo::Default::Ext.to_s
  today = Memo::Today.new

  data(
    "default" => {
      args: "p",
      expect: "cat #{root}/#{dir}/#{file}.#{ext}",
    },
    "today1" => {
      args: "p t",
      expect: "cat #{root}/#{today.dir}/#{today.file}",
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
