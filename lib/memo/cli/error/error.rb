module Memo
  class Cli
    module Error
      class Unknown < String
        def initialize
          super "ERROR: unknown command"
        end
      end
    end
  end
end
