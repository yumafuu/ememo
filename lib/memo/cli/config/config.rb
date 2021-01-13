module Memo
  class Config
    attr_reader :alias, :command

    def initialize
      tomlfile = ENV["MEMO_CONFIG"] || "~/.memo/config.toml"
      tomlfile.sub!("~", ENV["HOME"])
      tomlfile.sub!("$HOME", ENV["HOME"])

      conf = Tomlrb.load_file(
        tomlfile,
        symbolize_keys: true,
      )

      @config = conf[:config].to_h
      @alias = conf[:namespace_alias].to_h
      @alias = conf[:alias].to_h
      @command = conf[:command].to_h
    end

    def root
      @config[:root] || "~/.memo"
    end

    def ext
      @config[:ext] || "md"
    end

    def editor
      @config[:editor] || ENV["EDITOR"] || "vim"
    end

    def cat
      @config[:cat] || "cat"
    end

    def default_namespace
      @config[:default_namespace] || "mymemo"
    end

    def default_filename
      @config[:default_filename] || "memo"
    end
  end
end
