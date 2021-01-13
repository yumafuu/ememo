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

      @config = conf[:config]
      @alias = conf[:alias]
      @command = conf[:command]
    end

    def root
      @config[:root]
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
