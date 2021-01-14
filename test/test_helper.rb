# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "memo"

require "test-unit"
require "pry"
require_relative "./mock/os"

toml = "./config.test.toml"
ENV["MEMO_CONFIG"] = toml

config = <<~TOML
  [config]
  editor = "vim"
  root = "~/.memo"
  default_namespace = "mymemo"
  default_filename = "memo"
  ext = "md"

  [namespace_alias]
  t = "test"

  [command_alias]
  alias1 = "edit -n t test"
TOML

File.open(toml, "w") do |f|
  f.puts config
end

