function drmi --description 'Remove dangling docker images'
  if not type -q docker
    return 127
  end
  set -l ids (docker images -q)
  test (count $ids) -gt 0; and docker rmi $ids
end
