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
      include_any? "-dir", "-d"
    end

    def all?
      include_any? "-all", "-a"
    end

    def copy?
      include_any? "-copy", "-c"
    end

    private

    def include_any?(*args)
      args.map { |a| @args.include?(a) }.any?
    end
  end
end
