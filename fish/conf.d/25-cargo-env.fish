# Load Rust toolchain environment if available.
# This mirrors existing fish conf snippets that source `~/.cargo/env.fish`.

if not set -q __dotfiles_cargo_env_sourced
  set -g __dotfiles_cargo_env_sourced 1
  if test -f "$HOME/.cargo/env.fish"
    source "$HOME/.cargo/env.fish"
  end
end
