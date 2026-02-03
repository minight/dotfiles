# PATH setup (guarded, no duplicates).

function __dotfiles_add_path
  for p in $argv
    if test -d "$p"
      fish_add_path -g "$p"
    end
  end
end

switch (uname)
  case Darwin
    __dotfiles_add_path /opt/homebrew/bin
end

__dotfiles_add_path /usr/local/go/bin
__dotfiles_add_path "$GOPATH/bin"
__dotfiles_add_path "$HOME/.cargo/bin"
__dotfiles_add_path "$HOME/.local/bin"

for p in $HOME/Library/Python/*/bin
  __dotfiles_add_path "$p"
end

__dotfiles_add_path "$BUN_INSTALL/bin"
__dotfiles_add_path "$PNPM_HOME"
__dotfiles_add_path "$HOME/.krew/bin"
__dotfiles_add_path "$HOME/tools/custom"
__dotfiles_add_path "$HOME/bin"
__dotfiles_add_path /usr/local/opt/coreutils/libexec/gnubin
__dotfiles_add_path /usr/local/bin
__dotfiles_add_path "$ANDROID_HOME/platform-tools"
