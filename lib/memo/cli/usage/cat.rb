module Memo
  class Cli
    module Usage
      class Cat
        def initialize(err:)
          @err = err.to_s
        end

        def to_s
          <<~TEXT
          #{@err}

          usage:
            $ memo cat my-memo
          TEXT
        end
      end
    end
  end
end
