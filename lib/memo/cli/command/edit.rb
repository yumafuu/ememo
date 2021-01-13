module Memo
  class Cli
    module Command
      class Edit
        def initialize(options)
          @options = options
          @config = Memo::Config.new
        end

        def call
          file = @options[0] ||
            @config.default_filename

          namespace = @options.namespace ||
            @config.default_namespace

          namespace = Memo::Namespace.new(
            @options.namespace,
          ).call

          newfile = Memo::File.new(file, namespace)

          system "mkdir -p #{newfile.dir}"
          system "#{@config.editor} #{newfile.fullpath}"
        end
      end
    end
  end
end
