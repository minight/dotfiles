# General
alias vim nvim
alias vi nvim

# Go
alias gob 'go build ./...'
alias got 'go test ./...'
alias gotv 'go test -v ./...'
alias gotr 'go test -race ./...'
alias gotc 'go test -count=1 ./...'
alias gocov 'go test -coverprofile=coverage.out && go tool cover -html=coverage.out'
alias golint 'golangci-lint run'
alias goimp 'goimports -w .'
alias gomod 'go mod tidy'
alias govet 'go vet ./...'

# Python
alias py python3
alias pytest 'python -m pytest'
alias pytestv 'python -m pytest -v'
alias pytestx 'python -m pytest -x'
alias pytestpdb 'python -m pytest --pdb'
alias pycheck 'ruff check . && mypy .'
alias pyfmt 'ruff format .'
alias pyruff 'ruff check --fix .'
alias pipreq 'pip freeze > requirements.txt'

# Node
alias nr 'npm run'
alias nrt 'npm run test'
alias nrb 'npm run build'
alias nrd 'npm run dev'
alias nrl 'npm run lint'
alias pnx 'pnpm exec'
alias tsc 'npx tsc --noEmit'
alias tsw 'npx tsc --watch'

# Git / GH
alias gpr 'gh pr create --web'
alias gprl 'gh pr list'
alias gprv 'gh pr view --web'
alias gprc 'gh pr checkout'
alias gissue 'gh issue list'
alias gcob 'git checkout -b'
alias gco 'git checkout'
alias glog 'git log --oneline --graph -20'
alias gloga 'git log --oneline --graph --all -30'
alias gdiff 'git diff --word-diff'
alias gstash 'git stash --include-untracked'
alias gsp 'git stash pop'
alias gundo 'git reset --soft HEAD~1'
alias gamend 'git commit --amend --no-edit'
alias grebase 'git rebase -i HEAD~'
alias s 'git status -sb'

# Misc
alias hexdump xxd
alias strings 'strings -a'
alias objdump 'objdump -d -M intel'
alias checksec 'checksec --file'
alias lash 'ls -lash'
alias pg 'ping 8.8.8.8'
alias awk gawk
alias dc docker-compose
alias tmux 'tmux -2u'
alias sizeme 'du -h -d 1 | sort -rh'
alias ndu 'ncdu --color dark -rr -x --exclude .git --exclude node_modules'

alias pcp 'pwd | pbcopy'
alias cdp 'cd (pbpaste)'

# Kubernetes
alias k kubectl
alias kctx kubectx
alias kga 'k get svc,statefulset,deployment,pods,daemonset,hpa,replicaset'
alias whichk 'kubectl config current-context'
alias kgetc 'kubectl config get-contexts'

# macOS-only
if test (uname) = Darwin
  alias lock '/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine'
  alias flushdns 'sudo dscacheutil -flushcache; and sudo killall -HUP mDNSResponder; and say DNS cache flushed'
end

alias wtf "echo -n 'ಠ_ಠ' | pbcopy"
alias uncolor "printf '\\e[0m'"

alias payloads 'cd ~/tmp/payloads'
alias pload payloads

alias dsh dockershell
alias ff fe

# zoxide convenience
if type -q zoxide
  alias j z
  alias jj zi
end
