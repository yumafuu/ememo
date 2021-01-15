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
          @os.echo Memo::Usage.new.to_s
        end
      end
    end
  end
end
