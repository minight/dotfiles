function dockerssh --description 'SSH to docker host with key'
  if test (count $argv) -lt 1
    echo "Usage: dockerssh <host>" 1>&2
    return 2
  end

  set -l key "$HOME/.ssh/cs6443-master.pem"
  if not test -f "$key"
    echo "Missing key: $key" 1>&2
    return 1
  end

  ssh "docker@$argv[1]" \
    -o IdentitiesOnly=yes \
    -o "StrictHostKeyChecking false" \
    -o "UserKnownHostsFile /dev/null" \
    -i "$key"
end
