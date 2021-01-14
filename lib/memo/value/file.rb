module Memo
  class File
    def initialize(
      file = nil,
      namespace = nil,
      config: Memo::Config.new
    )
      @config = config
      @file = file || @config.default_filename
      @namespace = Alias::Namespace.new(namespace).call ||
        @config.default_namespace
    end

    def dir = "#{@namespace}"
    def file = "#{@file}.#{@config.ext}"
    def fullpath = "#{dir}/#{file}"
  end
end
