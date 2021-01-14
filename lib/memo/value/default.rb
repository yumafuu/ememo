module Memo
  module Default
    class Ext
      def self.to_s = "md"
    end

    class Preview
      def self.to_s = "cat"
    end

    class Root
      def self.to_s = "~/.memo"
    end

    class Editor
      def self.to_s = "vim"
    end

    class FuzzyFinder
      def self.to_s = "fzf"
    end

    class Filename
      def self.to_s = "memo"
    end

    class Namespace
      def self.to_s = "mymemo"
    end

    class Configfile
      def self.to_s = "config.toml"
    end
  end
end
