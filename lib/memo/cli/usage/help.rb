module Memo
  class Cli
    module Usage
      class Help
        def to_s
          <<~TEXT
        EASY EDIT MEMO

        usage:
          - edit today's memo
            $ memo

          - edit custom memo
            $ memo edit my-memo

          - cat memo
            $ memo cat path/to/my-memo
          TEXT
        end
      end
    end
  end
end
