module Memo
  class Cli
    module Command
      class Edit
        def initialize(
          options,
          os: Memo::OS.new
        )
          @options = options
          @os = os
          @config = Memo::Config.new
        end

        def call
          filename = @options[0]
          namespace = @options.namespace

          file = Memo::File.new(filename, namespace)

          @os.exec "mkdir -p #{@config.root}/#{file.dir}"
          @os.exec "#{@config.editor} #{@config.root}/#{file.fullpath}"
        end
      end
    end
  end
end
