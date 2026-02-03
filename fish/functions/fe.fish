function fe --description 'FZF open file in $EDITOR'
  if not type -q fzf
    echo "Requires fzf" 1>&2
    return 127
  end

  set -l file (fzf --preview 'bat --color=always --line-range :500 {} 2>/dev/null || cat {}')
  test -n "$file"; or return 0

  set -l editor vim
  set -q EDITOR; and set editor $EDITOR
  $editor "$file"
end
