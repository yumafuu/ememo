module Memo
  class Cli
    def initialize(
      input,
      os: Memo::OS.new
    )
      @command = input[0]
      @options = Option.new input[1..]
      @os = os
    end

    def call
      cmd = case @command
            when "edit", "e", nil
              Command::Edit
            when "preview", "p"
              Command::Preview
            when "today", "t"
              Command::Today
            when "config", "c"
              Command::Config
            when "help", "h"
              Command::Help
            when "setup", "s"
              Command::Setup
            when "fuzzy", "f"
              Command::Fuzzy
            else
              @options = @command
              Command::Custom
            end

      cmd.new(@options, os: @os).()
    end
  end
end
