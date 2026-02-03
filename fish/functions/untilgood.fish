function untilgood --description 'Retry a command until it succeeds'
  if test (count $argv) -eq 0
    echo "Usage: untilgood <command> [args...]" 1>&2
    return 2
  end

  while true
    $argv
    set -l status_code $status
    if test $status_code -eq 0
      return 0
    end
  end
end
