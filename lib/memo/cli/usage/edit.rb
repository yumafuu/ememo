module Memo
  class Cli
    module Usage
      class Edit
        def initialize(err:)
          @err = err
        end

        def to_s
          err = "ERROR: #{@err}" if @err

          <<~TEXT
          #{err}

          usage:
            $ memo #{command} my-memo
          TEXT
        end
      end
    end
  end
end
