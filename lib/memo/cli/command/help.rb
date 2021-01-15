module Memo
  class Cli
    module Command
      class Help
        def initialize(*); end

        def call
          puts Memo::Usage.new.to_s
        end
      end
    end
  end
end
