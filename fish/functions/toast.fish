function toast --description 'Send local toast notification'
  if test (count $argv) -eq 0
    echo "Usage: toast <message>" 1>&2
    return 2
  end
  curl -s "http://localhost:11001/notify?msg=$argv[1]" >/dev/null
end
