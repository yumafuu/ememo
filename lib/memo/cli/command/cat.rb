module Memo
  class Cli
    module Command
      class Cat
        def initialize(options)
          @options = options
        end

        def call
          file = @commands[1]
          if file.nil?
            puts <<~TEXT
          ERROR: no file name

          usage:
            $ memo #{command} my-memo
            TEXT

            return
          end

          file = @options[0]
          if file.nil?
            Usage::Help.new(err: "no file").call
            return
          end

          system "#{CAT} #{ROOT}/my/#{file}.md"
        end
      end
    end
  end
end
