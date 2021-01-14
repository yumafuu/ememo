# frozen_string_literal: true

require_relative "memo/version"
require "pry"
require "tomlrb"

Dir["#{__dir__}/**/*.rb"].
  each &method(:require)

module Memo
end
