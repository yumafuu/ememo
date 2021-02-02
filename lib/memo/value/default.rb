module Memo
  module Default
    class Ext < String
      def initialize = super("md")
    end

    class Preview < String
      def initialize = super("cat")
    end

    class Pbcopy < String
      def initialize = super("pbcopy")
    end

    class Root < String
      def initialize = super("~/.memo")
    end

    class Editor < String
      def initialize = super("vim")
    end

    class FuzzyFinder < String
      def initialize = super("fzf")
    end

    class Filename < String
      def initialize = super("memo")
    end

    class Namespace < String
      def initialize = super("mymemo")
    end

    class Configfile < String
      def initialize = super("config.toml")
    end
  end
end
