# Ememo
Easy Memo

## Requirement
- Ruby 3.0.0+

#### Optional
- <a href="http://github.com/junegunn/fzf" target="_blank">
    fzf
  </a> ( or other fuzzy finder )

## Demo
![memo](https://user-images.githubusercontent.com/32477095/104561601-fb81de80-568a-11eb-9e4b-a823a6311be7.gif)


## Installation
```bash
$ gem install ememo
```

## Config
```bash
# Create config file to ENV["MEMO_CONFIG"] or "~/.memo/config"
# You can skip this step
$ memo setup

# edit config file
# with ENV["EDITOR"] or vim
$ memo c
$ memo config
```

## Usage
### Edit
```toml
[config]
# default is ENV["EDITOR"] or vim
editor = "emacs"

[namespace_alias]
p = "project1"
```
```bash
# edit ~/.memo/mymemo/memo.md with editor
$ memo e
$ memo edit

# edit ~/.memo/mymemo/todo.md with editor
$ memo edit todo

# edit ~/.memo/project1/todo.md with editor
$ memo edit todo -n project1

# with namespace_alias
$ memo edit todo -n p
```

### Preview
```bash
# preview ~/.memo/mymemo/memo.md
$ memo p
$ memo preview

# preview ~/.memo/mymemo/todo.md
$ memo p todo

# preview ~/.memo/project1/todo.md
$ memo p todo -n project1

# with namespace_alias
$ memo p todo -n p

# copy to clipboard
$ memo p todo -n p -c
$ memo p todo -n p -copy

# preview config
$ memo p c
$ memo p config
```

### List
```bash
# list of ~/.memo/mymemo
$ memo l
$ memo list

# list ~/.memo/project1
$ memo l -n project1

# all
$ memo l -a
$ memo l -all

# list of direcory
$ memo l -d
$ memo l -dir
```
### Today
```bash
# edit today's memo (~/.memo/2021/1/1.md)
$ memo t
$ memo today

# preview today's memo (~/.memo/2021/1/1.md)
$ memo p t
```

### FuzzyFind
```toml
[config]
# default is fzf
fuzzy_finder = "peco"
```
```bash
# fuzzy find memo
$ memo fuzzy
$ memo f
```

### Custom Command
You can register command_alias
```toml
[command_alias]
etw = "e todo -n w"
ptw = "p todo -n w"
```
```bash
$ memo etw
# => `memo edit todo -n work`

$ memo ptw
# => `memo preview todo -n work`
```

## Sample Config
```toml
[config]
ext = "md"
root = "~/.memo"
editor = "vim"
# pbcopy = "pbcopy"
pbcopy = "xsel --clipboard --input"
preview = "bat"
fuzzy_finder = "fzf --preview 'bat --color=always {}'"
default_filename = "memo"
default_namespace = "general"

[namespace_alias]
w = "work"
p = "private"
w1 = "work/project1"

[command_alias]
etw = "e todo -n w"
ptw = "p todo -n w"
```

## Author

  [@YumaFuu](https://github.com/YumaFuu)

## Licence
  mit

