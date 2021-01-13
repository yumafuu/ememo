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
            command[:"#{@command}"]&.
            split(" ")

          if input.nil?
            puts Error::Unknown.new.to_s
            puts Usage::Help.new.to_s
            return
          end

          Memo::Cli.new(input).call
        end
      end
    end
  end
end
