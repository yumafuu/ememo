module Memo
  class SampleToml < String
    def initialize
      super <<~TOML
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
    end
  end
end
