module Memo
  class Cli
    module Usage
      class New
        def initialize(err:)
          @err = err
        end

        def to_s
          <<~TEXT
          #{@err}

          usage:
            $ memo new new-memo
            $ memo n new-memo
          TEXT
        end
      end
    end
  end
end
