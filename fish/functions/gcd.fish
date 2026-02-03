function gcd --description 'cd to GOPATH github.com/<repo>'
  if test (count $argv) -lt 1
    echo "Usage: gcd <repo>" 1>&2
    return 2
  end
  cd "$GOPATH/src/github.com/$argv[1]"
end
