module Memo
  class Cli
    module Command
      class Fuzzy
        def initialize(
          options,
          os: Memo::OS.new
        )
          @options = options
          @os = os
          @config = Memo::Config.new
        end

        def call
          @os.exec "#{@config.editor} "\
            "$(find #{@config.root} -type f | "\
            "#{@config.fuzzy_finder})"
        end
      end
    end
  end
end
