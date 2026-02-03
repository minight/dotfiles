function mmv --description 'Prefix files in cwd'
  if test (count $argv) -lt 1
    echo "Usage: mmv <prefix>" 1>&2
    return 2
  end
  for f in *
    mv "$f" "$argv[1]-$f"
  end
end
