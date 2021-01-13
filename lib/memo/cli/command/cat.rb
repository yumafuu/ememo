module Memo
  class Cli
    module Command
      class Cat
        def initialize(options)
          @options = options
          @config = Memo::Config.new
          @today = Memo::Today.new
          @defaultfile = Memo::Defaultfile.new
        end

        def call
          path = case @options[0]
                 when "today", "t"
                   @today.fullpath
                 when nil
                   @defaultfile.fullpath
                 else
                   @options[0]
                 end

          system "#{@config.cat} #{path}"
        end
      end
    end
  end
end
