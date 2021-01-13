module Memo
  class Cli
    module Command
      class Config
        def initialize(*)
          @config = Memo::Config.new
        end

        def call
          tomlfile = ENV["MEMO_CONFIG"] || "#{@config.root}/config.toml"

          system "#{@config.editor} #{tomlfile}"
        end
      end
    end
  end
end
