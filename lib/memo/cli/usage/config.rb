module Memo
  class Cli
    module Usage
      class Config
        def to_s
          <<~TEXT
            $ memo config
          TEXT
        end
      end
    end
  end
end
