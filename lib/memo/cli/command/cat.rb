module Memo
  class Cli
    module Command
      class Cat
        def initialize(options)
          @options = options
          @config = Memo::Config.new
          @today = Memo::Today.new
        end

        def call
          file = @options[0] || @today.fullpath
          system "#{@config.cat} #{file}"
        end
      end
    end
  end
end
