module Memo
  class Cli
    module Command
      class Help
        def initialize(*)
        end

        def call
          Usage::Help.new.call
        end
      end
    end
  end
end
