module Memo
  class Cli
    module Command
      class New
        def initialize(options, config = nil)
          @options = options
          @config = config
        end

        def call
          file = @options[0]
          if file.nil?
            puts Usage::New.new(
              err: Error::NoFile,
            ).to_s

            return
          end

          system "mkdir -p #{@config.root}/mymemo/"
          system "#{@config.editor} #{@config.root}/mymemo/#{file}.md"
        end
      end
    end
  end
end
