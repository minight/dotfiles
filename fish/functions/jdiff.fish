function jdiff --description 'Side-by-side JSON diff (sorted keys)'
  if test (count $argv) -lt 2
    echo "Usage: jdiff <a.json> <b.json>" 1>&2
    return 2
  end
  if not type -q jq
    echo "Requires jq" 1>&2
    return 127
  end

  diff -y (jq --sort-keys . "$argv[1]" | psub) (jq --sort-keys . "$argv[2]" | psub)
end
