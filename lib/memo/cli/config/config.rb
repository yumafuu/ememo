module Memo
  class Config
    def initialize
      tomlfile = ENV["MEMO_CONFIG"] || "~/.memo/config.toml"
      tomlfile.sub!("~", ENV["HOME"])
      tomlfile.sub!("$HOME", ENV["HOME"])

      conf = Tomlrb.load_file(
        tomlfile,
        symbolize_keys: true,
      )

      @config = OpenStruct.new conf[:config]
    end

    def root
      @config.root
    end

    def editor
      @config.editor || ENV["EDITOR"] || "vim"
    end
  end
end
