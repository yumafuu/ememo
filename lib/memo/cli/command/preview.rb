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
                   "#{@config.root}/#{@today.fullpath}"
                 when "config", "c"
                   @config.path
                 else
                   p = Memo::File.new(
                     filename,
                     @options.namespace,
                   ).fullpath

                   "#{@config.root}/#{p}"
                 end

          cmd ="#{@config.preview} #{path}"
          if @options.copy?
            @os.exec "#{cmd} | (#{@config.pbcopy})"
          end

          @os.exec cmd
        end
      end
    end
  end
end
