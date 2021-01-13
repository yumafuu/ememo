module Memo
  class Cli
    def initialize(input)
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
            when "config"
              Command::Config
            else
              Command::Custom.new(@command).()
              return
            end

      cmd.new(@options).()
    end
  end
end
