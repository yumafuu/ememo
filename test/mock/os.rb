module Mock
  class OS
    def echo(s) = s
    def exec(cmd) = cmd
    def write(path, text) = true
  end
end
