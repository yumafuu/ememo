module Memo
  class Cli
    module Command
      class Preview
        def initialize(
          options,
          os: Memo::OS.new
        )
          @options = options
          @os = os
          @config = Memo::Config.new
          @today = Memo::Today.new
          @defaultfile = Memo::File.new
        end

        def call
          filename = @options[0]
          path = case filename
                 when "today", "t"
                   @today.fullpath
                 else
                   Memo::File.new(
                     filename,
                     @options.namespace,
                   ).fullpath
                 end

          @os.exec "#{@config.preview} #{@config.root}/#{path}"
        end
      end
    end
  end
end
