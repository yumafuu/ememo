module Memo
  class Cli
    module Command
      class Custom
        def initialize(command)
          @command = command
          @config = Memo::Config.new
        end

        def call
          input = @config.
            command[:"#{@command}"].
            split(" ")

          Memo::Cli.new(input).call
        end
      end
    end
  end
end
