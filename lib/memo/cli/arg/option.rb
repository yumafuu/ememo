module Memo
  class Option
    attr_reader :namespace, :is_all

    def initialize(args)
      @args = args.to_a
      @is_all = args.include?("-a") ||
        args.include?("-all")

      case args
      in [*, "-n", namespace, *]
        @namespace = namespace
        @args.delete("-n")
        @args.delete(namespace)
      else
      end
    end

    def [](index)
      @args[index]
    end

    def dir?
      @args.include? "-d"
    end

    def copy?
      @args.include? "-copy"
    end
  end
end
