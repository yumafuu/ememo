module Memo
  class Cli
    module Command
      class Setup
        def initialize(
          _,
          os: Memo::OS.new
        )
          @os = os
          @config = Memo::Config.new
        end

        def call
          toml = <<~TOML
            [config]
            # ext = "md"
            # root = "~/.memo"
            # editor = "vim"
            # preview = "bat"
            # fuzzy_finder = "fzf --preview 'bat --color=always {}'"
            # default_filename = "memo"
            # default_namespace = "mymemo"

            [namespace_alias]
            # p1 = "project1"

            [command_alias]
            # ep1 = "edit memo -n project1"
          TOML

          if ::File.exist? @config.path
            puts "WARNING: config file already exists"
            puts
            print "reset config? (y/n) "
            ans = STDIN.gets.to_s.chomp
            if ans != "y"
              puts "aborted"
              return
            end
          end

          @os.write @config.path, toml

          puts
          puts <<~TEXT
            Create config file to #{@config.path}
            You can edit by `$ memo config`
          TEXT
        end
      end
    end
  end
end
