module Memo
  class Namespace
    def initialize(namespace = nil)
      @config = Memo::Config.new
      @namespace = namespace ||
        @config.default_namespace
    end

    def call
      @config.alias[:"#{@namespace}"] ||
        @namespace
    end
  end
end
