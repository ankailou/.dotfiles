# Login Hook
if status --is-login
  # Language Default
  set -x LC_ALL en_US.UTF-8
  set -x LC_CTYYPE en_US.UTF-8
  # Homebrew
  set -x PATH $PATH /usr/local/bin
  set -x PATH $PATH /usr/bin
  set -x PATH $PATH /usr/sbin
  set -x PATH $PATH /usr/texbin
  set -x PATH $PATH /bin
  set -x PATH $PATH /sbin
  # Ruby
  set -x PATH $PATH $HOME/.rbenv/bin
  set -x PATH $PATH $HOME/.rbenv/shims
  set -x RUBY_GC_HEAP_INIT_SLOTS 600000
  set -x RUBY_GC_HEAP_FREE_SLOTS 600000
  set -x RUBY_GC_HEAP_GROWTH_FACTOR 1.25
  set -x RUBY_GC_HEAP_GROWTH_MAX_SLOTS 300000
  # Python
  set -x PATH $PATH $HOME/.pyenv
  # Go
  set -x GOPATH $HOME/Documents/dev/go
  set -x PATH $PATH $GOPATH/bin
  # Android
  set -x ANDROID_HOME /usr/local/opt/android-sdk
  # Editor
  set -x EDITOR "vim"
  # Less
  set -x LESS "-RSM~gIsw"
end

