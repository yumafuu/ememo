module Memo
  class Cli
    def initialize(input)
      @command = input[0]
      @options = input[1..]
    end

    def call
      cmd = case @command
            when "help", "h"
              Command::Help
            when "edit", "e"
              Command::Edit
            when "cat", "c"
              Command::Cat
            when "new", "n"
              Command::New
            when "config"
              Command::Cat
            when "today", nil
              Command::Today
            end

      cmd.new(@options).()
    end
  end
end
