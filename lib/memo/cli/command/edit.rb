module Memo
  class Cli
    module Command
      class Edit
        def initialize(options)
          @options = options
          @config = Memo::Config.new
        end

        def call
          filename = @options[0]
          namespace = @options.namespace

          file = Memo::File.new(file, namespace)

          system "mkdir -p #{file.dir}"
          system "#{@config.editor} #{file.fullpath}"
        end
      end
    end
  end
end
