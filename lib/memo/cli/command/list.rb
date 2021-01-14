module Memo
  class Cli
    module Command
      class List
        def initialize(
          options,
          os: Memo::OS.new
        )
          @options = options
          @os = os
          @config = Memo::Config.new
        end

        def call
          namespace = @options.namespace
          is_all = @options.is_all
          type = @options.dir? ? "d" : "f"

          dir = if is_all
                  ""
                else
                  Memo::File.new(
                    "",
                    @options.namespace,
                  ).dir
                end

          @os.exec "find #{@config.root}/#{dir} -type #{type}"
        end
      end
    end
  end
end
