function fbr --description 'FZF git branch picker'
  if not type -q git; or not type -q fzf
    echo "Requires git + fzf" 1>&2
    return 127
  end

  set -l branches (git branch --all | string trim | string match -v '*HEAD*')
  test (count $branches) -gt 0; or return 0

  set -l branch (printf '%s\n' $branches | fzf --preview 'git log --oneline --graph --date=short -20 {}' --height 40%)
  test -n "$branch"; or return 0

  set -l target (string trim (string replace -r '.*\s+' '' -- $branch))
  set target (string replace -r '^remotes/origin/' '' -- $target)
  git checkout $target
end
