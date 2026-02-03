function pipenvreq --description 'pipenv install from requirements.txt'
  if not test -f requirements.txt
    echo "Missing requirements.txt" 1>&2
    return 1
  end
  pipenv install (cat requirements.txt)
end
