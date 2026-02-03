function flog --description 'FZF git commit browser'
  if not type -q git; or not type -q fzf
    echo "Requires git + fzf" 1>&2
    return 127
  end

  set -l sha (git log --oneline --graph --color=always \
    | fzf --ansi --preview 'git show --color=always {2}' --height 80% \
    | awk '{print $2}')

  test -n "$sha"; and git show $sha
end
