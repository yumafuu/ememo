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

            You can use namespace
            $ memo edit my-memo -n project1

          - cat memo
            $ memo cat ~/path/to/memo
            $ memo cat my-memo -n project1
            $ memo cat my-memo
            $ memo cat
            $ memo cat -ago 1
          TEXT
        end
      end
    end
  end
end
