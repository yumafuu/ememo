module Memo
  class OS
    def exec(cmd) = system(cmd)

    def write(path, text)
      ::File.open(path, "w") do |f|
        f.puts text
      end
    end
  end
end
