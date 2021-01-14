module Memo
  class Cli
    module Command
      class Today
        require "date"

        def initialize(
          _,
          os: Memo::OS.new
        )
          @os = os
          @config = Memo::Config.new
          @today = Memo::Today.new
        end

        def call
          @os.exec "mkdir -p #{@config.root}/#{@today.dir}"
          @os.exec "#{@config.editor} #{@config.root}/#{@today.fullpath}"
        end
      end
    end
  end
end
