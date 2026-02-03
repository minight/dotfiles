function drma --description 'Remove exited docker containers'
  if not type -q docker
    return 127
  end
  set -l ids (docker ps -a -f status=exited -q)
  test (count $ids) -gt 0; and docker rm $ids
end
