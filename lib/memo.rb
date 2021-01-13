# frozen_string_literal: true

require_relative "memo/version"
require "pry"
require "tomlrb"
require "ostruct"

Dir["lib/memo/**/*.rb"].each {
  require_relative "../#{_1}"
}

module Memo
end
