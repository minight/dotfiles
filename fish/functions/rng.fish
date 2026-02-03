function rng --description 'Print N random bytes as digits'
  if test (count $argv) -lt 1
    echo "Usage: rng <nbytes>" 1>&2
    return 2
  end
  od -tu2 -vAn -N$argv[1] < /dev/urandom | tr '\n' ' ' | sed 's/ //g'
end
