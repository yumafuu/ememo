module Memo
  class Option
    attr_reader :namespace, :is_all

    def initialize(args)
      @raw_args = args.to_a

      case @raw_args
      in [*, "-n", namespace, *]
        @namespace = namespace
        @raw_args.delete("-n")
        @raw_args.delete(namespace)
      else
      end

      @args = @raw_args.select do |s|
        !s.start_with? "-"
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
      args.map { |a| @raw_args.include?(a) }.any?
    end
  end
end
