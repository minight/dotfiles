function fcd --description 'FZF cd to selected file directory'
  if not type -q fzf
    echo "Requires fzf" 1>&2
    return 127
  end
  set -l file (fzf -q "$argv[1]")
  test -n "$file"; and cd (dirname -- "$file")
end
