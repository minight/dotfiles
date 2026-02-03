function dockershell --description 'docker exec -it'
  if not type -q docker
    return 127
  end
  docker exec -it $argv
end
