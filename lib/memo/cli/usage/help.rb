module Memo
  class Cli
    module Usage
      class Help
        def to_s
          <<~TEXT
            EASY EDIT MEMO

            USAGE
             - Config
              You can edit basic config and register aliases

              $ memo c
              $ memo config

             - Edit
              $ memo e
              $ memo edit
              $ memo edit todo
              $ memo edit todo -n project1
              $ memo edit todo -n p # use namespace_alias

             - Preview
              $ memo p
              $ memo preview
              $ memo p todo
              $ memo p todo -n project1
              $ memo p todo -n p # use namespace_alias

            - Today
              # edit
              $ memo t
              $ memo today

              # preview
              $ memo preview today
              $ memo p t

            - Fuzzy
              $ memo fuzzy
              $ memo f

            - Custom Command
              $ memo todo # use command_alias
          TEXT
        end
      end
    end
  end
end
