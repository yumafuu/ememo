module Memo
  class Cli
    module Command
      class Alias
        def initialize(
          _,
          os: Memo::OS.new
        )
          @os = os
          @config = Memo::Config.new
          @file = Default::Configfile.to_s
        end

        def call
          namespaces = @config.
            namespace_alias.
            map { |k, v| %(#{k} = "#{v}")}.
            join "\n"

          commands = @config.
            command_alias.
            map { |k, v| %(#{k} = "#{v}")}.
            join "\n"

          toml = <<~TOML
            [namespace_alias]
            #{namespaces}

            [command_alias]
            #{commands}
          TOML


          @os.exec "echo '#{toml}'"
        end
      end
    end
  end
end
