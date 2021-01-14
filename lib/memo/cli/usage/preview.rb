module Memo
  class Cli
    module Usage
      class Preview
        def initialize(err:)
          @err = err.to_s
        end

        def to_s
          <<~TEXT
          #{@err}

          usage:
            $ memo preview my-memo
          TEXT
        end
      end
    end
  end
end
