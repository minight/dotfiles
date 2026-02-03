# Optional integrations (guarded).

# fzf (if installed via `~/.fzf.fish`)
if test -f "$HOME/.fzf.fish"
  source "$HOME/.fzf.fish"
end

# zoxide
if type -q zoxide
  zoxide init fish | source
end

# OrbStack
if test -f "$HOME/.orbstack/shell/init.fish"
  source "$HOME/.orbstack/shell/init.fish" 2>/dev/null
end

# SDKMAN and NVM are bash-based; use bass if available.
if type -q bass
  if test -s "$SDKMAN_DIR/bin/sdkman-init.sh"
    bass source "$SDKMAN_DIR/bin/sdkman-init.sh"
  end

  if test -s "$NVM_DIR/nvm.sh"
    bass source "$NVM_DIR/nvm.sh" --no-use
  end
end

# bun completions
# if status --is-interactive; and type -q bun
#   bun completions fish 2>/dev/null | source
# end
# if status --is-interactive; and type -q bun
#
# # kubectl completions
# if status --is-interactive; and type -q kubectl
#   kubectl completion fish 2>/dev/null | source
# end
