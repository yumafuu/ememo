module Memo
  module Alias
    class Command
      def initialize(name)
        @name = name
        @config = Memo::Config.new
      end

      def call
        @config.command_alias[:"#{@name}"]
      end
    end

    class Namespace
      def initialize(name)
        @name = name
        @config = Memo::Config.new
      end

      def call
        @config.namespace_alias[:"#{@name}"] ||
          @name
      end
    end
  end
end
