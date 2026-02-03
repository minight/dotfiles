function rmdupe --description 'Remove duplicate lines from a file'
  if test (count $argv) -lt 1
    echo "Usage: rmdupe <file>" 1>&2
    return 2
  end
  cat "$argv[1]" | perl -lne 's/\s*$//; print if ! $x{$_}++'
end
