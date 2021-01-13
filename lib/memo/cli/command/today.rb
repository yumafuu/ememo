module Memo
  class Cli
    module Command
      class Today
        require "date"

        def initialize(*)
          @config = Config.new
        end

        def call
          today = Date.today.to_s
          year, month, day = today.split("-")

          dir = "#{@config.root}/#{year}/#{month}"
          file = "#{day}.md"

          system "mkdir -p #{dir}"
          system "#{@config.editor} #{dir}/#{file}"
        end
      end
    end
  end
end
