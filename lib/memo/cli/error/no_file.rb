module Memo
  class Cli
    module Error
      class NoFile
        def to_s
          "ERROR: no file specified"
        end
      end
    end
  end
end
