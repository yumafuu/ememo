module Memo
  class Cli
    def initialize(input)
      @command = input[0]
      @options = Option.new input[1..]
      @command = input[0]
      @options = Option.new input[1..]
    end

    def call
      cmd = case @command
            when "edit", "e", nil
              Command::Edit
            when "cat", "c"
              Command::Cat
            when "today", "t"
              Command::Today
            when "config", "co"
              Command::Config
            when "help", "h"
              Command::Help
            else
              @options = @command
              Command::Custom
            end

      cmd.new(@options).()
    end
  end
end
