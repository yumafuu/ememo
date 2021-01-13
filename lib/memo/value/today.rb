module Memo
  class Today
    def initialize
      @config = Memo::Config.new
      @today = Date.today.to_s
      @year, @month, @day = @today.split("-")
    end

    def dir
      "#{@config.root}/#{@year}/#{@month}"
    end

    def file
      "#{@day}.md"
    end

    def fullpath
      "#{dir}/#{file}"
    end
  end
end
