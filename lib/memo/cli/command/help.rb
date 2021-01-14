module Memo
  class Cli
    module Command
      class Help
        def initialize(*); end

        def call
          puts Usage::Help.new.to_s
        end
      end
    end
  end
end
