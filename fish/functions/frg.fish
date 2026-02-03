function frg --description 'FZF ripgrep picker + open in editor'
  if not type -q rg; or not type -q fzf
    echo "Requires rg + fzf" 1>&2
    return 127
  end

  set -l selected (rg --line-number --no-heading . \
    | fzf -d ':' --preview 'bat --color=always --highlight-line {2} {1} 2>/dev/null || sed -n "{2}p" {1}' \
    | string trim)

  test -n "$selected"; or return 0

  set -l file (string split -m1 ':' $selected)[1]
  set -l rest (string split -m1 ':' $selected)[2]
  set -l line (string split -m1 ':' $rest)[1]

  set -l editor vim
  set -q EDITOR; and set editor $EDITOR
  $editor "$file" +$line
end
