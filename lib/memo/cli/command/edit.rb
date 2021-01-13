module Memo
  class Cli
    module Command
      class Edit
        def initialize(options)
          @options = options
        end

        def call
          file = @options[0]
          if file.nil?
            Usage::Edit.new(err: "no file").call
            return
          end

          system "#{EDITOR} #{ROOT}/#{file}"
        end
      end
    end
  end
end
