function drka --description 'Kill running docker containers'
  if not type -q docker
    return 127
  end
  set -l ids (docker ps -a -f status=running -q)
  test (count $ids) -gt 0; and docker kill $ids
end
