module Memo
  class File
    def initialize(file, namespace = nil)
      @config = Memo::Config.new
      @file = file
      @namespace = namespace || @config.default_namespace
    end

    def dir
      "#{@config.root}/#{@namespace}"
    end

    def file
      "#{@file}.md"
    end

    def fullpath
      "#{dir}/#{file}"
    end
  end
end
