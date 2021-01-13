module Memo
  class Option
    attr_reader :namespace

    def initialize(args)
      @args = args.to_a

      case args
      in [*, "-n", String => namespace, *]
        @namespace = namespace
        @args.delete("-n")
        @args.delete(namespace)
      else
      end
    end

    def [](index)
      @args[index]
    end
  end
end
