module Memo
  class File
    def initialize(file = nil, namespace = nil)
      @config = Memo::Config.new
      @file = file || @config.default_filename
      @namespace = namespace || @config.default_namespace
    end

    def dir
      "#{@config.root}/#{@namespace}"
    end

    def file
      "#{@file}.#{@config.ext}"
    end

    def fullpath
      "#{dir}/#{file}"
    end
  end
end
