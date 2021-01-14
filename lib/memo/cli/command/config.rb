module Memo
  class Cli
    module Command
      class Config
        def initialize(
          _,
          os: Memo::OS.new
        )
          @os = os
          @config = Memo::Config.new
          @file = Default::Configfile.to_s
        end

        def call
          tomlfile = ENV["MEMO_CONFIG"] ||
            "#{@config.root}/#{@file}"

          @os.exec "#{@config.editor} #{tomlfile}"
        end
      end
    end
  end
end
