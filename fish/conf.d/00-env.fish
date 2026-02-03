# Shared environment variables.

if not set -q XDG_CONFIG_HOME
  set -gx XDG_CONFIG_HOME "$HOME/.config"
end

# Editors / pager
set -gx VISUAL vim
set -gx EDITOR vim
set -gx PAGER less

# Locale
if not set -q LANG
  set -gx LANG en_US.UTF-8
end

# Browser
switch (uname)
  case Darwin
    set -gx BROWSER open
  case '*'
    if type -q xdg-open
      set -gx BROWSER xdg-open
    end
end

# Less
set -gx LESS '-F -g -i -M -R -S -w -X -z-4'

if type -q lesspipe
  set -gx LESSOPEN "| /usr/bin/env lesspipe %s 2>&-"
else if type -q lesspipe.sh
  set -gx LESSOPEN "| /usr/bin/env lesspipe.sh %s 2>&-"
end

# Tooling homes
set -gx GOPATH "$HOME/.go"
set -gx BUN_INSTALL "$HOME/.bun"
set -gx SDKMAN_DIR "$HOME/.sdkman"
set -gx NVM_DIR "$XDG_CONFIG_HOME/nvm"
set -gx PNPM_HOME "$HOME/Library/pnpm"

# Android
set -gx ANDROID_HOME "$HOME/Library/Android/sdk"
set -gx ANDROID_SDK_ROOT "$ANDROID_HOME"
set -gx ANDROID_AVD_HOME "$XDG_CONFIG_HOME/.android/avd"

# libffi (brew)
set -gx LDFLAGS "-L/usr/local/opt/libffi/lib"
set -gx PKG_CONFIG_PATH "/usr/local/opt/libffi/lib/pkgconfig"

# FZF defaults
set -gx FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --glob "!.venv/*"'
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx FZF_CTRL_T_OPTS "--preview 'bat --color=always --line-range :500 {} 2>/dev/null || cat {}' --preview-window=right:60%"
set -gx FZF_ALT_C_OPTS "--preview 'tree -C {} | head -200'"
set -gx FZF_CTRL_R_OPTS "--preview 'echo {}' --preview-window=up:3:wrap"

set -gx METRICS_LOG_LEVEL none

# Linux clipboard helpers (mirrors zsh/zlinux)
if test (uname) = Linux
  set -gx DISPLAY :0
  if type -q xclip
    alias pbcopy 'xclip -selection clipboard'
    alias pbpaste 'xclip -selection clipboard -o'
  end
end
