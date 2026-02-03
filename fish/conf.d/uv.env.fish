# Compatibility shim for existing `~/.config/fish/conf.d/uv.env.fish`.
# Source cargo env exactly once.

if not set -q __dotfiles_cargo_env_sourced
  set -g __dotfiles_cargo_env_sourced 1
  if test -f "$HOME/.cargo/env.fish"
    source "$HOME/.cargo/env.fish"
  end
end
