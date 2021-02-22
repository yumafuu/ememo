module Memo
  class Cli
    module Command
      class Custom
        def initialize(
          command,
          os: Memo::OS.new
        )
          @command = command
          @os = os
        end

        def call
          input = Memo::Alias::Command.new(
            @command,
          ).()&.split(" ")

          if input.nil?
            puts Error::Unknown.new
            puts Memo::Usage.new
            return
          end

          Memo::Cli.new(input, os: @os).()
        end
      end
    end
  end
end
