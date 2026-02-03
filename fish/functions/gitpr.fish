function gitpr --description 'Open compare URL for current branch'
  set -l branch $argv[1]
  if test -z "$branch"
    if type -q git
      set branch (git rev-parse --abbrev-ref HEAD)
    end
  end

  test -n "$branch"; or return 1

  if type -q xdg-open
    xdg-open "https://github.com/assetnote/cs-engine/compare/staging...$branch?quick_pull=1&reviewers=infosec-au&assignee=minight&labels=bug&projects=assetnote/1"
  else if type -q open
    open "https://github.com/assetnote/cs-engine/compare/staging...$branch?quick_pull=1&reviewers=infosec-au&assignee=minight&labels=bug&projects=assetnote/1"
  end
end
