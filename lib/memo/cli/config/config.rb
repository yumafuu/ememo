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

    def ext = @config[:ext] || Default::Ext.new
    def root = @config[:root] || Default::Root.new
    def pbcopy = @config[:pbcopy] || Default::Pbcopy.new
    def preview = @config[:preview] || Default::Preview.new

    def fuzzy_finder = @config[:fuzzy_finder] ||
      Default::FuzzyFinder.new

    def editor = @config[:editor] ||
      ENV["EDITOR"] || Default::Editor.new

    def default_filename = \
      @config[:default_filename] || Default::Filename.new

    def default_namespace = \
      @config[:default_namespace] || Default::Namespace.new
  end
end
