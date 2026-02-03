function activate --description 'Source .venv fish activate'
  if test -f .venv/bin/activate.fish
    source .venv/bin/activate.fish
  else
    echo "Missing .venv/bin/activate.fish" 1>&2
    return 1
  end
end
