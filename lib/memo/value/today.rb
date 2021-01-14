module Memo
  class Today
    def initialize(config: Memo::Config.new)
      @config = config
      @today = Date.today.to_s
      @year, @month, @day = @today.split("-")
    end

    def dir = "#{@year}/#{@month}"
      def file = "#{@day}.#{@config.ext}"
    def fullpath = "#{dir}/#{file}"
  end
end
