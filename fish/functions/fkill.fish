function fkill --description 'FZF kill process'
  if not type -q fzf
    echo "Requires fzf" 1>&2
    return 127
  end

  set -l line (ps aux | sed 1d | fzf --header='Select process to kill' --height 40%)
  test -n "$line"; or return 0

  set -l pid (echo $line | awk '{print $2}')
  test -n "$pid"; and kill -9 $pid
end
