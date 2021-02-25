module Memo
  class OS
    def echo(s) = puts(s)
    def exec(cmd) = system(cmd)
    def write(path, text)
      ::File.open(path, ?w) { |f| f.puts text }
    end
  end
end
