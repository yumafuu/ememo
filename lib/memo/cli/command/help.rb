module Memo
  class Cli
    module Command
      class Help
        def initialize(
          _,
          os: Memo::OS.new
        )
          @os = os
        end

        def call
          @os.echo Memo::Usage.new
        end
      end
    end
  end
end
