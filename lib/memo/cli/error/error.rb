module Memo
  class Cli
    module Error
      class NoFile
        def to_s
          "ERROR: no file specified"
        end
      end

      class Unknown
        def to_s
          "ERROR: unknown command"
        end
      end
    end
  end
end
