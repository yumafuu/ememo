module Memo
  class Config
    attr_reader :command_alias, :namespace_alias, :path

    def initialize
      @path = ENV["MEMO_CONFIG"].dup ||
        "~/.memo/config.toml"

      @path.sub!("~", ENV["HOME"])
      @path.sub!("$HOME", ENV["HOME"])

      conf = Tomlrb.load_file(
        @path,
        symbolize_keys: true,
      ) rescue {}

      @config = conf[:config].to_h

      @namespace_alias = conf[:namespace_alias].to_h
      @command_alias = conf[:command_alias].to_h

      system "mkdir -p #{root}"
    end

    def ext = @config[:ext] || Default::Ext.to_s
    def root = @config[:root] || Default::Root.to_s
    def pbcopy = @config[:pbcopy] || Default::Pbcopy.to_s
    def preview = @config[:preview] || Default::Preview.to_s

    def fuzzy_finder = @config[:fuzzy_finder] ||
      Default::FuzzyFinder.to_s

    def editor = @config[:editor] ||
      ENV["EDITOR"] || Default::Editor.to_s

    def default_filename = \
      @config[:default_filename] || Default::Filename.to_s

    def default_namespace = \
      @config[:default_namespace] || Default::Namespace.to_s
  end
end
